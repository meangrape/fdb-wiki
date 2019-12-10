## Components in FoundationDB

![](https://aws1.discourse-cdn.com/foundationdb/original/1X/8a2f0e6b6ba9109aeb895a0f7f275cb251ecf488.jpeg)

### Coordinators
All clients and servers connect to a FoundationDB cluster with a cluster file, which contains the IP:PORT of the coordinators. Both the clients and servers use the coordinators to connect with the cluster controller. The servers will attempt to become the cluster controller if one does not exist, and register with the cluster controller once one has been elected. Clients use the cluster controller to keep an up-to-date list of proxies.

### Cluster Controller
The cluster controller is a singleton elected by a majority of coordinators. It is the entry point for all processes in the cluster. It is responsible for determining when a process has failed, telling processes which roles they should become, and passing system information between all of the processes.

### Master
The master is responsible for coordinating the transition of the write sub-system from one generation to the next. The write sub-system includes the master, proxies, resolvers, and transaction logs. The three roles are treated as a unit, and if any of them fail, we will recruit a replacement for all three roles. The master provides the commit versions for batches of the mutations to the proxies, runs data distribution algorithm, and runs ratekeeper.

### Proxies
The proxies are responsible for providing read versions, committing transactions, and tracking the storage servers responsible for each range of keys. To provide a read version, a proxy will ask all other proxies to see the largest committed version at this point in time, while simultaneously checking that the transaction logs have not been stopped. Ratekeeper will artificially slow down the rate at which the proxy provides read versions.

Commits are accomplished by:

* Get a commit version from the master.
* Use the resolvers to determine if the transaction conflicts with previously committed transactions.
* Make the transaction durable on the transaction logs.

The key space starting with the `'xff'` byte is reserved for system metadata. All mutations committed into this key space are distributed to all of the proxies through the resolvers. This metadata includes a mapping between key ranges and the storage servers which have the data for that range of keys. The proxies provides this information to clients on-demand. The clients cache this mapping; if they ask a storage server for a key it does not have, they will clear their cache and get a more up-to-date list of servers from the proxies.

### Transaction Logs
The transaction logs make mutations durable to disk for fast commit latencies. The logs receive commits from the proxy in version order, and only respond to the proxy once the data has been written and fsync'ed to an append only mutation log on disk. Before the data is even written to disk we forward it to the storage servers responsible for that mutation. Once the storage servers have made the mutation durable, they pop it from the log. This generally happens roughly 6 seconds after the mutation was originally committed to the log. We only read from the log's disk when the process has been rebooted. If a storage server has failed, mutations bound for that storage server will build up on the logs. Once data distribution makes a different storage server responsible for all of the missing storage server's data we will discard the log data bound for the failed server.

### Resolvers
The resolvers are responsible determining conflicts between transactions. A transaction conflicts if it reads a key that has been written between the transaction's read version and commit version. The resolver does this by holding the last 5 seconds of committed writes in memory, and comparing a new transaction's reads against this set of commits.

### Storage Servers
The vast majority of processes in a cluster are storage servers. Storage servers are assigned ranges of key, and are responsible to storing all of the data for that range. They keep 5 seconds of mutations in memory, and an on disk copy of the data as of 5 second ago. Clients must read at a version within the last 5 seconds, or they will get a transaction_too_old error. The ssd storage engine stores the data in a b-tree. The memory storage engine store the data in memory with an append only log that is only read from disk if the process is rebooted.

### Clients
Clients must get a read version at the start of every transaction. During the transaction all of the reads are done at that read version, and write are kept in memory until transaction is committed. When the transaction is committed, all of the reads and writes are sent to the proxy. If the transaction conflicts with another transaction the client is responsible for retrying the transaction. By default, reading a key that was written in the same transaction will return the newly written value.

## Transaction Processing


![](https://aws1.discourse-cdn.com/foundationdb/original/1X/cf8c5fc2f9f5675055c05610bc495f5b760444e1.jpeg)
![](https://aws1.discourse-cdn.com/foundationdb/original/1X/032af061abbd783549a8b4805e09f53e1cad2a83.jpeg)
![](https://aws1.discourse-cdn.com/foundationdb/original/1X/df2fa96cbdc35a482e2726a5f786be69dc5fc4a6.jpeg)
![](https://aws1.discourse-cdn.com/foundationdb/original/1X/2ba462a1102390fbd0cca88c06d3cb25f485cde5.jpeg)
![](https://aws1.discourse-cdn.com/foundationdb/original/1X/39ef9f39ff6a382818f9386aa4538be4f80a6fdc.jpeg)


## Resources

[Forum Post](https://forums.foundationdb.org/t/technical-overview-of-the-database/135/26)

[Existing Documentation](https://github.com/apple/foundationdb/blob/master/documentation/sphinx/source/kv-architecture.rst)

[Summit Presentation](https://www.youtube.com/watch?list=PLbzoR-pLrL6q7uYN-94-p_-Q3hyAmpI7o&v=EMwhsGsxfPU&feature=emb_logo)