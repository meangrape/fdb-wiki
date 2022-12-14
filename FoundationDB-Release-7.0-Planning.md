---
mainfont: "Abitare Sans 100"
sansfont: "Abitare Sans 100"
monofont: "PragmataPro Liga Regular"
mathfont: "PragmataPro Liga Regular"
colorlinks: true
linkcolor: blue
urlcolor: red
toccolor: gray
---
# *Planned Features in 7.0*

*Scaling* - (A.J.) - Larger clusters will make adding additional hardware easier, and will make it easier to balance users across partitions. Larger clusters also enables transactions across more data. This feature is also extremely important for external adoption, because it means a lot of use cases can fit entirely in a single cluster.

*Redwood Storage Engine* - (Steve) - The Redwood storage engine will give us prefix compression and also significant performance improvements for a variety of workloads. In particular sequential insertion performance appears to be 5x better than SQLite.

*Backup from TLogs* - (Jingyu) - The existing backup implementation inserts every mutation into the database twice. Once to actually apply the mutation, and a second to the \xff\x02\blog key space, so that backup can read the mutation and archive it before removing the key. Not only does this mean we are spending half of our write bandwidth for backup, it also means that half of all of the write bandwidth to a cluster is written in a single keyspace, which makes it difficult for data distribution to balance the load across servers. By writing mutations directly into blob from the transaction logs, we will completely remove the need to write mutations two, effectively double our write bandwidth.

*Storage cache* - (Neelam, Xin) - One of the biggest causes of cluster unavailability for FoundationDB are hot read shards. When users drive a lot of read traffic to a small keyspace, the cluster cannot distribute the load to more than a few servers. The goal of this project is to automatically detect these hot read shards, and have a large number of stateless processes (storage cache) start serving reads for this key range. The storage cache role will pull mutations from the TLogs, so it will be able to provide a consistent answer for these reads immediately after an initial fetch of the range.

*Fast restore* - (Meng) - Restores of large FoundationDB backup take around 4 days to complete. In the event that we ever needed to restore our backups, this would mean a very long period of unavailability. This project should enable us to complete restores in less than a day.

*Slow machine poisoning* - (Vishesh) - One of the tradeoffs with the FoundationDB architecture is the fact that we rely on explicit failure detection. This works well for normal machine failures, however when a machine starts operating much more slowly than usual this will cause the performance of the entire cluster to degrade significantly. We recently had an incident were a switch causes significant packet loss to a single rack, and it cause unavailability in four clusters which had machines on that rack. The goal of the project is to detect when a process is operating slower than usual, and report that it is degraded to the cluster controller. The cluster controller can use this information to automatically exclude sets of machines which are degraded to restore performance.

*Failover testing/improvements* - (Bala) - Datacenter failures are very rare in the real world. To ensure our software is robust to datacenter failures we need to be constantly subjecting clusters to this type of failure. The goal of this project is to continuously subject a test cluster to randomized failures, and automatically alert when the cluster does not handle the failure in the way we expect it to.

*Stable wire protocol* - (AJ) - Re-implement our bindings to use a gRPC protocol for handling client requests. This will eliminate the need for the multi-version client, so upgrades will become much easier. It will also remove our use of JNI, making the Java bindings much more efficient.

*Transfer data between databases* - (Evan) - Add functionality to atomically copy ranges of keyspace from one database to another. Managing data that has been sharded across multiple FoundationDB databases is a challenge. In particular, it can be hard to keep the amount of data stored in each database equal. The feature will provide a tool for transferring data between databases, as a first step towards a more comprehensive solution to managing sharded FDB.

*Data distribution write bandwidth load balancing* - The existing data distribution algorithm does not monitor the write bandwidth each storage server is subjected to. We rely exclusively on random shard assignment to hopeful avoid putting too many write-hot key ranges on the same storage server. The backup keyspace is particularly hard to balance, because the shards are small in size, but constantly have data written and deleted in these ranges. We have had a number of production incidents related to assigning too many backup key ranges to the same server. This project will make data distribution aware of the write bandwidth each server is taking, and use that information when moving shards.

*Recovery speed* - (Alex) - The speed at which we can perform a master recovery is directly related to the availability of our database. In 6.2 we improved the speed at which we recovery the transaction state store, which significantly improved restore times for large clusters. There is a remaining opportunity to further improve the recovery speed, which is to speed up the rate at which TLogs recovery when rebooted. Currently, the need to load their entire 2GB queue into memory before we can start recovery. This means recovery which after a storage server has been failed for a while can be long. This work would allow us to recover without pulling all of the data into memory, significantly reducing this recovery time.

*Read proxies* - (Vishesh) - The 6.2 release disconnected clients from the cluster controller, removing the main bottleneck preventing us from running with more clients connected to the cluster. With enough client connected though, the storage servers will each have too many client connections, and that will impact performance. This project will allow clients to specify that they want their reads to be proxied through another process before going to the storage servers. This will reduce the number of connections a client has by 10x at the cost of slightly higher read latencies.

*Report conflicting key* - (Chaoguang) - As a developer writing applications on top of FoundationDB, it is often hard to track down what is going wrong when the conflict rate spikes up dramatically. By providing a key which conflicted along with the error when a transaction conflicts, clients will more easier be able to debug problems.

*New memory storage engine* - (Mengran) - The in-memory part of the memory storage engine is a simple std::map-like data structure.  Replacing this with a Radix Tree / Trie-like data structure would allow for both more efficient lookups and a smaller memory usage.

*ConnectionTest role* - In 6.2 clients no longer connect to all of the coordinators. This means we no longer have a method of safely checking if clients can establish TLS connections before switching a cluster to use TLS. The proposed solution to this problem is to have a new role, which when present in a cluster will be sent to clients, and the clients will report if they can connect to the process.

*Multi-version fdbcli* - One big operational headache is that when upgrading a cluster, fdbcli no longer works because the version changes. This means you have to bounce the processes with one version of the fdbcli, and check to see if the cluster is healthy with the next version of the fdbcli. By writing fdbcli such that it can use the multi-version client, a single binary will be usable through the whole process.

*Support processes changing IP addresses* - Kubernetes does not guarantee that a process will have the same IP address after a reboot. By changing exclude to be locality based, and by changing cluster files to support DNS addresses, we can make FoundationDB more friendly for Kubernetes users.

*Downgrade simulation testing* - (Alex) - FDB 6.1 introduced a forward compatibility framework to allow users to downgrade their cluster after an upgrade.  However, no tests exist that enforce or verify that downgrades work and are correct, and thus this support was never documented.  Adding downgrades to restarting tests will allow us to offer official guidance of when and how downgrades are supported.

# *Notable features which will not be in 7.0*

*Predicate pushdown* - The FoundationDB API does not have efficient methods for implementing filtering or aggregations. With the existing API, if you want to count the number of keys in a key range, you need to send all of the keys and values in the range back to the client. This feature will allow clients to do server side filtering and aggregation, which should make a number of different operations in the record layer much more efficient.

*Move recovery to the cluster controller* - The only reason that recovery is done on the master is because of path dependance. There are a lot of unnecessary interactions between the cluster controller and the master to support this recovery path, which makes is very difficult to change recruitment logic. By having recovery happen on the cluster controller, we will be able to write a single function for generating the best allocation of roles at any given moment, and have a single comparison function which will be able to tell us if it is worth killing the current generation to re-recruit in new locations.

*Satellite anti-quorums* - FoundationDB synchronously commits to the satellites TLogs with every commit. This makes tail latencies dependent on the WAN network between the main DC and the satellite location. By supporting anti-quorums on the satellites, we can submit mutation to two different satellites, and return success when one of the two responds.

*Efficient memory utilization* - Processes need be provisioned a full 8GB of memory, even when a lot of roles do not require much memory. The cluster controller should be written in a way that processes register with how much memory they have, and each role should have a maximum amount of memory usage. We can then do a better job of assigning roles to processes, allowing us to have more memory for storage caches.

*Arbitrary region configuration* - The current region configuration only support replicating to at most two regions. Allowing replication to more regions would allow fast local regions in a large number of data centers. It will also give a much safer way to migrate clusters between data centers. Currently you have to drop the replicas in one location before you add replicas in a different locations.

*Scope* - The scope tool allows us to record microsecond level metrics on running clusters. Having the ability to turn this on for clusters which are experiencing performance anomalies would make it much easier to track down what is happening.

*Latency-based ratekeeper* - There are a number of different roles in a cluster that can be saturated without causing ratekeeper to kick in. If ratekeeper controlled on latencies of client level operations, we could protect ourselves much better against a variety of potential problems.

*Change feeds* - Change feeds would allow clients to receive a stream of mutations that have been applied to a given key range. The watches are not durable, so they always have to possibility of throwing an error, in which case the client would have to read the entire range again. This is a very common API implemented by other databases like etcd and ZooKeeper, and has a variety of uses.