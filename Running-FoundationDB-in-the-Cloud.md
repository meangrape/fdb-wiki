# Introduction

This document is meant as:

1. An internal documentation for Snowflake. It is meant to contain what we learned and learn while running FoundationDB clusters of variable sizes on different cloud providers.
1. These things are potentially useful to other FoundationDB users and we try to either keep Snowflake specific information out of this document or point the requirements out clearly.

We are currently running FoundationDB deployments in several regions on Amazon Web Services (AWS), Microsoft Azure (Azure), and Google Cloud Platform (GCP). Most of the documentation here applies generally to all of them, but for examples and specifics it covers mostly AWS. If something is drastically different for other cloud providers, we'll try to point them out.

# Choosing the right Disks

When running in the cloud a user typically has the option between several disk offerings. For AWS these are:

1. Ephemeral SSDs
1. Several flavors of Elastic Block Storage (EBS):
   1. EBS Cold HDD
   1. EBS Throughput Optimized HDD
   1. EBS General Purpose SSD (gp2)
   1. EBS Provisioned IOPS SSD (io1)

Generally speaking: ephemeral ssd are probably the best solution for most use cases as they provide the highest number of IOPS for the lowest price. This being said, EBS has some benefits. We'll explore the options below.

## Ephemeral SSDs

For most deployments, this is probably what you want. It has the following benefits over EBS:

1. Very high number of IOPS compared to EBS.
1. Much cheaper.

The list of drawbacks is a bit longer, although as mentioned above, FoundationDB provides features to mitigate most of them:

1. **Less reliable**: disks can fail and if an ephemeral disk fails, it will lose all its data. FoundationDB can automatically recreate a lost copy. In theory however, you would lose all your data if a whole region would go down due to a power failure.
1. **Missing Features**:
    1. No Snapshots: if you want to do snapshots this will increase the operational work as you would need a filesystem that supports snapshots and you will need operational tools to copy these snapshots off the machine. EBS can do all of this for you.
    1. No machine resize: if you start/stop your machine, you will lose your data on that disk. This will make some operational tasks harder.

It is a good idea to use something like Fearless or DR in addition to backups if you run on SSDs. With EBS it is much less likely to lose three disks within a cluster. Backups are great to safe you against accidental corruption by a user while satelite tlogs will save you from disk and machine failures.

## EBS

In general EBS can provide valuable benefits over ephemeral disks. However, they solve problems that FoundationDB already solves for you - so depending on your sensitivity to risk of data loss and generally your topology and additional safety mechanism EBS can either give you additional piece of mind and some valuable features or it could be a waste of money.

A typical FoundationDB cluster with EBS can be more than twice as expensive than a FoundationDB cluster with ephemeral disks - and you can expect slightly higher latency and lower throughput. This being said, there are some benefits:

1. **Much lower probability for data loss**: If Amazon loses machine due to a hardware failure, you will be able to just mount the data volume to another machine. If you use ephemeral disks, losing a machine means that you lose your data. This also means that you could safely run in double or even single replication mode. However, in practice you probably won't do that (it will still lower your availability and the high cost of EBS might offset the cost savings due to a lower replication factor).
1. **Fewer Disk Failures***: You generally can expect EBS to be more robust. Disk failures are usually transparent to the user (Amazon can often repair your disk without you noticing). Think of it as a managed RAID. This can save you some operational work. This being said: EBS volumes can break. However, if they break you usually will only lose availability and your data will be back after restarting the machine.
1. **Additional Features**:
    1. You can resize a machine and even change the machine type (for example from `m5` to `c5`) without data loss. This is not possible with ephemeral disk as it requires a stop/start of the machine (which will result in your ephemeral data to be lost). This will speed up some operational work significantly. On ephemeral disks you would need to use `include` and `exclude` to "wiggle" your data over to a new disk which will take significantly longer.
    1. **Snapshots**: FoundationDB 6.2 introduced a new snapshot feature which will can use file system snapshots to consistently snapshot a whole cluster. However, this feature requires the filesystem to support snapshoting. For Linux there are not many great solutions: ZFS is not part of the Kernel (and doesn't support KAIO), btrfs is not great for B-Trees (and FoundationDB has many B-Trees on disk), and LVM snapshots slow down disk operations. EBS supports snapshots and can even write them automatically to S3. This makes snapshots a compelling alternative to traditional backups.
    1. **Sizing**: If you get an ephemeral SSD, the size of the disk will typically be determined by the size of your VM (this is a bit more complex/flexible on GCP). With EBS you can get almost any size you want. Additionally you can even add more space on the fly (which for GP2 will increase IOPS). However, a resize also needs to be supported by the file system.

### EBS Cold HDD

This is not a good option for any processes that run FDB. However, it could be used to store backups - although S3 seems to be the better option for this. We generally don't use that.

### EBS Throughput Optimized HDD

We didn't explore this offering yet. In general we believe that this would be a bad choice to run storage nodes on (we only run FoundationDB on SSDs). This being said: this could be an interesting for TLog as HDDs are cheaper than SSDs and writing a log on a HDD is often sufficiently fast. However, this has not yet been tested. One problem could be disk spilling: if TLogs spill, they will index the data in a b-tree, which could cause a significant slow-down.

### EBS General Purpose SSD (gp2)

This is probably the most useful EBS offering for FoundationDB. In our experience it is as fast and as stable as io1 but much cheaper. The only real drawback is that the maximum per disk IOPS limit is lower for gp2 than for io1 and io1 is more elastic.

With gp2 you get a certain amount of IOPS per GB disk space and you get billed only depending on the size of the disk. The limits are usually high enough for a single storage process (though a storage process can saturate any EBS volume).

This is the EBS type that Snowflake uses.

### EBS Provisioned IOPS SSD (io1)

io1 is similar to gp2 but mostly with different pricing. Instead of only paying for disk size, you'll also pay for provisioned IOPS. This makes this offering much more expensive. Price is the biggest drawback and for most users the benefits will probably not justify the much higher price. The benefits are:

1. **Higher IOPS limits**. io1 can give you up to 64,000 IOPS - gp2 can only scale up to 16,000 IOPS (at the time of writing - these numbers might change). However, there are two main arguments why this is not super useful for FoundationDB:
    1. There's also a machine-limit for IOPS that is determined by the network adapter that this machine provides. These limits can be found [here](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSOptimized.html). Only large instances will be able to actually utilize more than the max IOPS that gp2 provides.
    1. Instead of having disks with many IOPS it is much cheaper to have several storage processes where each process gets a disk. So instead of having 4 storage processes running on a io1 disk with 64K IOPS, it will be cheaper to run for processes each having its own gp2 disk with 16K IOPS.

We also found that io1 is so expensive that it is usually cheaper to get machines with a lot of memory and set the cache-parameter for storage servers to a high value. This way, most read operations will be served out of memory and therefore won't consume any IOPS (and this is also faster). So only writes have to be calculated against this budget. This should probably work for most real-world workloads. Only if you have a lot of data and your workload is very uniform, this might not be a great option (most workloads have some significant skew though).

# Machine Types

One great thing about running in the cloud is that it provides great flexibility to chose type and size of the machines you want to run. In general we think there are two valid strategies how to chose the right machine sizes: many small machines or few large machines.

Large machines have the benefit that you might not have noisy neighbors. It will also help to understand physical machine failures: if you have two i3.metal machines, you know that a machine failure will only bring down one machine. However, if you run 72 i3.large instances, a machine failure could cause anything between 1-32 virtual machines to fail.

*Warning*: Above argument about machine failures and big instances doesn't seem apply to GCP (at least at the time of writing). Google currently doesn't provide any guarantees about machine placement. So if a physical machine fails, it might look to you like a whole data center goes down.

This being said, this shouldn't be too much of an issue in practice for several reasons:

1. You should distribute your data across several AZs. Two VMs in two different AZs are guaranteed to run on two different machines.
1. You probably want to size your cluster in a way that you can survive the failure of a full AZ.
1. At least AWS provides an anti-placement feature you can use to get yourself some additional security.

In general small VMs have several benefits over large VMs:

1. If a VM crashes (or a disk fails) the amount of data FoundationDB has to re-replicate is small.
1. It increases elasticity: the smaller the machines, the smaller the steps for scaling are.
1. You can scale process types independently of each other.

A sample configuration would be (we assume the region you run on has at least 3 AZs):

- 36 storage nodes, one process per machine, i3en.large as machine type, with ephemeral SSD. You can use ~8GB of the memory for the page cache (`--cache_memory` argument to `fdbserver`)
- 6 Tlogs, one per machine on i3en.large
- 6 Stateless processes, one per machine, on m5.xlarge

For the rest of this documentation, we assume that this is the cluster we want to deploy - but making changes here should be simple.

## Anti-Placement

AWS support [Spread Placement Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html#placement-groups-spread) to ensure that multiple VMs run on different physical machines. One important limitation to spread placement is that only up to 7 EC2 instances can be in one spread placement group.

Currently FoundationDB can not make use of anti-placement which is a serious limitation. The main problem with that is that one might lose data if an AZ and a machine (in a different AZ) go down at the same time.

Currently solving this issue manually is possible by using a combination of these strategies:

1. As long as the cluster consists of fewer than 21 machines of each type, anti-placement can be used (7 machines per AZ).
1. One can use `.metal` machines (or the biggest VM available which will usually run on dedicated hardware). An important thing to look out for when doing this is that these machines often are NUMA-machines (`numactl` can be used to place `fdbserver` processes into NUMA regions).

This is obviously not optimal and we'll hopefully find a better fix for this. #2126 tracks this.

# FoundationDB Configuration

Here comes the more interesting part: how to configure FoundationDB for maximum reliability. The main things to keep in mind is the following:

1. Whenever the FoundationDB documentation talks about data centers, it assumes that these data centers are geographically far apart. In AWS terminology this would correspond to a region.
1. FoundationDB doesn't (yet) have a concept of availability zones.
1. Zones in FoundationDB refer to a fault domain (this could be used for example to group all machines within a rack together). In a cloud environment we currently don't know of any users who make use of this.

## Replication Mode

FoundationDB supports several replication modes and all of them are documented [here](https://apple.github.io/foundationdb/configuration.html).

The recommended replication mode for most users running in the cloud is `three_data_hall`. With this mode a cluster can survive the failure of one machine and one AZ. The policy works as follows:

1. For storages: each AZ holds exactly one copy of data. If an AZ fails, the cluster will be available and run with only two copies of data (until a third AZ comes back).
1. For TLogs: There can be at most two copies of data in one AZ and there are four copies in total. So if an AZ and a machine fail, there is one copy left.

It is important that there are enough processes of each class so that the cluster can recovery if one AZ and one machine fail. This means specifically that one should have at least three machines per AZ and each machine should run at least one tlog process.

### Setting Localities in the Configuration

Locality is configured through the `foundationdb.conf` file:

```
[fdbserver]
command = /usr/sbin/fdbserver
public_address = auto:$ID
listen_address = public
datadir = /var/lib/foundationdb/data/$ID
logdir = /var/log/foundationdb
# logsize = 10MiB
# maxlogssize = 100MiB
# class =
# memory = 8GiB
# storage_memory = 1GiB
# cache_memory = 2GiB
# locality_machineid =
# locality_zoneid =
# locality_data_hall =
```

The only locality which is strictly needed is `locality_data_hall` (the `machineid` and `zoneid` is set to a random value by default and will be set on a per machine basis). All machines within the same AZ have to have the same data hall locality.

