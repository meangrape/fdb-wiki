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
They key and key ranges read with snapshot option does not get added to the read conflict range. So snapshot reads will give a consistent view of the database but the reads will not be used in determining conflicts if the transaction is to be committed.

For read-only transactions, there shouldn't be any difference in the outcome between using snapshot reads or regular ones. In this case snapshot reads would avoid a little work because it doesn’t have to maintain read conflict ranges, but please note that the FoundationDB team hasn't done any performance comparison between the two.