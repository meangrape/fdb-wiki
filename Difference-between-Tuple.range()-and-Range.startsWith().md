There are multiple api's available to define a range to fetch keys from the database. Two such options are

> 1. Tuple.range()
> 2. Range.startsWith(tuple.pack())

Just for reference: here is the code snippet for both the methods from the java bindings:
```
Tuple::
	public Range range() {
		byte[] p = pack();
		return new Range(ByteArrayUtil.join(p, new byte[] {0x0}),
						 ByteArrayUtil.join(p, new byte[] {(byte)0xff}));
	}
Range::
	public static Range startsWith(byte[] prefix) {
		return new Range(prefix, ByteArrayUtil.strinc(prefix));
	}
```

There is a subtle difference between these two options. Range.startsWith will include the tuple itself, while Tuple.range only includes proper sub-tuples. In other words, if you have a tuple t=('foo', 'bar') and you have key k=t.pack() in the database, then calling t.range() will not include k, but calling Range.startsWith(t.pack()) will. The former would only include things like ('foo', 'bar', 'baz'), where there is at least one additional element in the tuple.

It’s also the case that any keys that are of the form t.pack() + '\xff' + ... will be excluded by t.range() and included by Range.startsWith(), but such keys won’t exist if all of your keys are generated from tuples.