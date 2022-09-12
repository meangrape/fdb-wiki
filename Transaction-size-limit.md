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
Transaction size cannot exceed 10,000,000 bytes (~10 MB) of affected data. It's not very intuitive to see what affected data size here means. To give a sense, the different entities that contribute to this size are

* Mutation Size (For set operations these are the same, but for clears and clear ranges the mutation consists only of keys)
* Read and write conflict ranges.  A conflict range consists of two keys that mark the beginning and end of a range that is read or written.

The range of keys and values read in a RangeRead op does not contribute to the transaction size. They will be part of read conflict ranges which only contains the beginning and end key of that range.

FoundationDB provides the client the ability to know the approximate size of its transaction. Every binding has an api for this and JAVA bindings api can be found [here](https://apple.github.io/foundationdb/javadoc/com/apple/foundationdb/Transaction.html#getApproximateSize())