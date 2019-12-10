No, `fdb_future_set_callback` guarantees _**at most once**_ execution.

A `fdb_future` is a C wrapper around a `Flow` future (`Flow` is the actor framework that FoundationDB is implemented in). A future can even be set to `Never` - in which case it is guaranteed that your callback will never be called. However, the callback is guaranteed to fire if one cancel or destroy the future at some point.

To alleviate the potential problemetic cases, for example the case where a `wait` on such a future can hang there for hours or even days, one can set the option `transaction_timeout` on each transaction started. Since 6.1, this option can be set on the database level so that each transation will by default have a `transaction_timeout` set.
