FoundationDB API does not provide multi/bulk `get` and `set` operations.

Layers can easily make multiple concurrent `get` calls and wait on the returned futures. Internally, client library is free to combine multiple `get` calls destined to same storage server, into a single network request. 

`Set` calls buffer up all mutations at the client side until a call to `commit` - at which time all _mutations_ and _conflict-ranges_ are sent to _proxies_ in a single network request.
