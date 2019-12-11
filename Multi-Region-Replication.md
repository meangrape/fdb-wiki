## Overview

FoundationDB supports safe, automatic failover in the event of a data center failure through multi-region replication, which is also known as Fearless DR. In a Fearless DR configuration, all commits are synchronously committed to transaction logs in multiple data centers before being confirmed to the client, and are asynchronously replicated to storage servers in multiple data centers. This approach allows you to make different choices about where you place the transaction logs and the storage servers to balance the requirements for low-latency commits with the requirements for geographically-distributed reads.

All of FoundationDB's multi-region configurations require at least three data centers in order to survive the loss of one data center.

## Concepts

In a multi-region configuration, you define two regions, and two or more data centers in each region. The data centers within a region should have a low enough latency for it to be acceptable to have that latency for every commit. At any time, one region will be the primary region, meaning that commits are made synchronously to that region. The primary region will be where the master and cluster controller processes are recruited.

Regions can be assigned priorities, which tell the database which region you would prefer to use as the primary. Regions with higher priorities are preferred over regions with lower priorities. You can set a region’s priority to be `-1` to indicate that the database should never recruit that region as the primary region.

Each region has a list of two or more data centers, which are identified by an `id`. This `id` should match the value you pass to the `locality_dcid` parameter for processes in that data center. You can configure whether a data center is a satellite or the main DC by setting the `satellite` flag to `1` or `0`. The satellites can also be assigned a priority, to indicate which satellite we should prefer to use when recruiting satellite logs.

You can also control how many satellite logs the database will recruit in each region through the `satellite_logs` parameter. This has a similar role to the `logs` field in the top-level database configuration, but it is specified on the region object instead.

The `satellite_redundancy_mode` is configured per region, and specifies how many copies of each mutation should be replicated to the satellite data centers.

`one_satellite_single`: Keep one copy of the mutation log in the satellite datacenter with the highest priority. If the highest priority satellite is unavailable it will put the transaction log in the satellite datacenter with the next highest priority.

`one_satellite_double`: Keep two copies of the mutation log in the satellite datacenter with the highest priority.

`one_satellite_triple`: Keep three copies of the mutation log in the satellite datacenter with the highest priority.

`two_satellite_safe`: Keep two copies of the mutation log in each of the two satellite data centers with the highest priorities, for a total of four copies of each mutation. This mode will protect against the simultaneous loss of both the primary and one of the satellite data centers. If only one satellite is available, it will fall back to only storing two copies of the mutation log in the remaining datacenter.

``two_satellite_fast``: Keep two copies of the mutation log in each of the two satellite data centers with the highest priorities, for a total of four copies of each mutation. FoundationDB will only synchronously wait for one of the two satellite data centers to make the mutations durable before considering a commit successful. This will reduce tail latencies caused by network issues between data centers. If only one satellite is available, it will fall back to only storing two copies of the mutation log in the remaining datacenter.

At this time, FoundationDB only supports configuring one or two regions.

## Example: Three Data Centers

In this example, we have three datacenters: `dc1`, `dc2`, and `dc3`. Let's say we have the following latencies between our data centers.

| From DC | To DC | Latency |
| ------- | ----- | ------- |
| dc1     | dc2   | 10ms    |
| dc1     | dc3   | 15ms    |
| dc2     | dc3   | 12ms    |


Let's also say that we want the primary to be in `dc1`, and our secondary to be in `dc3`.

To make this configuration work, we would define two regions: one where `dc1` is the main DC, and one where `dc3` is the main DC. In the first region, we would have `dc2` and `dc3` as possible satellites. In the second region, we would have `dc1` and `dc2` as possible satellites.

In the happy case, we commit synchronously to main logs in `dc1` and satellite logs in `dc2`. If the client processes are in `dc1`, that would mean we're adding about 10 ms to the commit latency in order to get the data to `dc2`. After a brief delay, the new commits would be replicated onto storage processes in `dc1` and `dc3`, and the commit data would be removed from the transaction logs.

If `dc2` goes down, the database will recover into a new configuration where we are putting the satellite logs in `dc3`. This would add a small amount to the commit latency. The database would become fully healthy after the few seconds it takes to recover.

If `dc3` goes down, the database will still be able to accept commits, but would not be able to replicate data into `dc3`. This would lead to a large volume commits being stored on the transaction log processes in `dc1` and `dc2`. This would not have an immediate impact on clients, but it would become a problem eventually. Setting the `usable_regions` configuration to `1` rather than `2` would disable replication into `dc3`, and prevent these commits from being batched up.

If `dc1` goes down, the database will recover into a configuration where commits are made synchronously to main logs in `dc3` and satellite logs in `dc2`. Any commit data that had not been replicated into `dc3` would be recovered from the copies stored in `dc2`. This would have similar risks as the scenario where `dc3` went down. 

In all of these scenarios, if the failed data center comes back, we will automatically go back to the happy case configuration. If the `usable_regions` setting is changed, however, it will require manual reconfiguration to get back to the original configuration.

The region configuration for this would be:

				[
					{
						"priority":1,
						"satellite_redundancy_mode": "one_satellite_double",
						"satellite_logs": 3,
						"datacenters": [
							{"id":"dc1", "satellite":0 },
							{"id":"dc2", "satellite":1, "priority": 2},
							{"id":"dc3", "satellite":1, "priority": 1}
						]
					},
					{
						"priority":0,
						"satellite_redundancy_mode": "one_satellite_double",
						"satellite_logs": 3,
						"datacenters": [
							{"id":"dc3", "satellite":0 },
							{"id":"dc2", "satellite":1, "priority": 2},
							{"id":"dc1", "satellite":1, "priority": 1}
						]
					}
				]

## Example: Four Data Centers

In this example, we have four datacenters: `dc1`, `dc2`, `dc3`, and `dc4`. Let's say we have the following latencies between our data centers.

| From DC | To DC | Latency |
| ------- | ----- | ------- |
| dc1     | dc2   | 5ms     |
| dc1     | dc3   | 60ms    |
| dc1     | dc4   | 60ms    |
| dc2     | dc3   | 60ms    |
| dc2     | dc4   | 60ms    |
| dc3     | dc4   | 5ms     |


Let's also say that we want the primary to be in `dc1`, and our secondary to be in `dc3`.

In this case the latency between the first two DCs and the second two DCs is too high for us to
accept in our commit pipline, so we will want to have a narrower set of options for satellites.

To make this configuration work, we would define two regions: one where `dc1` is the main DC, and one where `dc3` is the main DC. In the first region, we would have `dc2` as the only satellite. In the second region, we would have `dc4` as the only satellite.

In the happy case, we commit synchronously to main logs in `dc1` and satellite logs in `dc2`. If the client processes are in `dc1`, that would mean we're adding about 5 ms to the commit latency in order to get the data to `dc2`. After a brief delay, the new commits would be replicated onto storage processes in `dc1` and `dc3`, and the commit data would be removed from the transaction logs.

If `dc2` goes down, the database will fail over to use `dc3` as the primary DC, and `dc4` as the satellite DC. This will lead to higher latencies from clients in `dc1`, so the clients may need to do failover at their layer as well. Any data that has not been replicated into `dc3` will be recovered from the replicas in `dc1`. Once the database fails over, we will be able to asynchronously ship data to `dc1`, and the failed state of `dc2` will not cause any problems for the cluster.

If `dc3` goes down, the database will still be able to accept commits, but would not be able to replicate data into `dc3`. This would lead to a large volume commits being stored on the transaction log processes in `dc1` and `dc2`. This would not have an immediate impact on clients, but it would become a problem eventually. Setting the `usable_regions` configuration to `1` rather than `2` would disable replication into `dc3`, and prevent these commits from being batched up.

If `dc4` goes down, there will be no immediate impact on the database, but we would lose the capability to fail over to `dc3`.

If `dc1` goes down, the database will recover into a configuration where commits are made synchronously to main logs in `dc3` and satellite logs in `dc4`. Any commit data that had not been replicated into `dc3` would be recovered from the copies stored in `dc2`. This would have similar risks as the scenario where `dc3` went down. Unlike the scenario where `dc2` went down, in this scenario we will be unable to replicate commits onto the remote storage servers.

In all of these scenarios, if the failed data center comes back, we will automatically go back to the happy case configuration. If the `usable_regions` setting is changed, however, it will require manual reconfiguration to get back to the original configuration.

The region configuration for this would be:

				[
					{
						"priority":1,
						"satellite_redundancy_mode": "one_satellite_double",
						"satellite_logs": 3,
						"datacenters": [
							{"id":"dc1", "satellite":0 },
							{"id":"dc2", "satellite":1, "priority": 1}
						]
					},
					{
						"priority":0,
						"satellite_redundancy_mode": "one_satellite_double",
						"satellite_logs": 3,
						"datacenters": [
							{"id":"dc3", "satellite":0 },
							{"id":"dc4", "satellite":1, "priority": 1}
						]
					}
				]

## Process Count Recommendations

In locations that are only serving as satellites, you will only need to run log processes. These log processes will have to be spread across 3 failure domains, just like they would in the main DC. If you're running multiple FDB processes on each machine, then you may want to use smaller machines in the satellites to account for the fact that you'll only be running one per machine in the satellites.

It's generally best to run and recruit the same number of logs in the satellites that you have in the main DC. This will help to avoid performance and disk space issues when you're running in a degraded state where one of the main DCs is unavailable. In the happy case, you should be fine recruiting about 1/3 as many satellite logs as main logs.

If you are running a 3-DC config, you should be aware that there will be some situations where a data center needs to serve as a main DC and a satellite DC at the same time. This will require provisioning enough logs to be able to handle the number you are going to be recruiting for each of these rules. In this scenario you can either recruit the same number of main logs and satellite logs, which means you would need to provision twice as many, or recruit fewer satellite logs than main logs, which means that you could run into problems if you ran with only 2 DCs up for an extended period of time.