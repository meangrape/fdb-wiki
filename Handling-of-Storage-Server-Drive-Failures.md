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
FoundationDB has many replication modes which can handle a certain amount of failures. In this post, data replication across storage servers is considered. A double replication mode can handle one storage server (SS) drive failure and triple replication can handle two storage server (SS) drive failures. FoundationDB doesn't employ any erasure coding and fully replicates data on to different drives.

In case a SS drive failure is detected, FoundationDB automatically handles restoring replicating the lost data through its data distribution subcomponent. Key ranges that were affected by the loss will be assigned to a new team of servers. Until the data is re-replicated, status will report decreased failure tolerance.

A storage server detects drive failures when it is not able to read/write data to it or the io requests return incorrect data (including bad checksums). Data on the drives have checksums and a storage server can detect silent data corruption when trying to access those data blocks. In each of these cases, the storage server will die, effectively discarding all of its data as potentially corrupt, and the data will be re-replicated from the non-corrupt nodes.

To detect the case of silent data corruption on cold data, FoundationDB recommends the user to run a [consitencychecker](https://github.com/apple/foundationdb/blob/8bf67c7afc7082e131ea8a02ae22f5635c3f683a/fdbserver/workloads/ConsistencyCheck.actor.cpp) that continuously reads all the data from the database at a modest rate and report any data consistency failures. Please note that the user has to manually start the consistency checker and can be invoked as

> fdbserver -r consistencycheck ...