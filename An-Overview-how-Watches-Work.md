# Overview

This documentation gives a short introduction into how locks are implemented in FoundationDB and what kind of guarantees a client is getting.

In general there are two parts of this implementation: one part is implemented in the client and one is implemented on the server side. These play together to achieve the right functionality.

Watches are registered through a transaction and are registered with a storage server. The storage will keep all watches in a map internally. For each mutation that is executed on the storage, it will then look up corresponding watches from that map and, if there are any, will send the version at which the change was made back to the client.

# Guarantees

A watch might get notified on changes. However, you can miss changes for two reasons:
* The value changed more than once while the client or a storage server was in some faulty state and the watch had to be reregistered. In this case the watch might only fire once.
* Watches are subjected to the ABA-problem: if a value changes twice and after the second update it has the same value as before, the client might not be notified of that update.

# Client Failures

If a client fails, the storage will keep that watch until it will be triggered the next time as the storage server will not be made aware of the fact that the client died. This is problematic, as a client could watch a key that never changes. To handle this case the storage server will eventually time out any watch that didn't see any writes for a long time (usually after ~15 minutes). If the client didn't fail, it will receive a timeout from the server and can reregister the watch (it will do so automatically).

# Server Failures

Watches on storage servers are ephemeral. So if a storage server fails, it will lose all current watches. 