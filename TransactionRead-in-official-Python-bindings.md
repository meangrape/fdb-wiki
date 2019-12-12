# What's the purpose of `TransactionRead` in official Python bindings?

The purpose of the `TransactionRead` class is to encapsulate all of the parts of a transaction that lets it read from the database. (The equivalent in Java, for example, is the `ReadTransaction` interface) As it turns out, because in snapshot isolation, all a transaction can do is read, the Transaction.snapshot property only needs to be of that type.

In a language with static type checking, it’s useful to have a ReadTransaction interface so that methods can declare that they will be doing some reads (but no writes) and have the type checker enforce that. In Python, the need is probably less (because of duck typing), but it’s still nice for code re-use reasons.