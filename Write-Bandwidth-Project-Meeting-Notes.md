### 4/8/2020

* Storage server profiling and optimizations
  * Daniel and Rusty have both not found low hanging fruit to further optimize
  * *Daniel* to run and profile a test with Rusty's three way comparison merged
  * 5% of CPU time spent allocating std::vector, but unsure if there's a good way to reduce that
* Daniel seeing stalls during performance tests
  * Are there recoveries?  OOMs?  Seems not.
  * Likely Ratekeeper?
  * *Alex* to connect with Segment folk about getting FoundationDB metrics into Datadog.  (Sent!)
* P-Tree improvements/rewrites
  * Daniel chatting with Steve about if there's a better datastructure to use than the existing P-Tree
  * Neelam's previous investigation suggested that there's no low-hanging optimizations to do on the P-Tree itself
  * Persistent Adaptive Radix Tree might be a good candidate
  * (Persistent in the versioned sense, and not persistent as in disk.)
  * [HOPE](https://arxiv.org/pdf/2003.02391.pdf) would maybe be useful to reduce in-memory size of data?
    * *Rusty* to bug Pavlo about releasing the code 
* New Slack channel of #write-throughput-discuss made for this project
* Proxy optimizations
  * 550micros spent in batching
  * Via tweaking knobs, this was reduced to 200micros
  * In the process of this work, found [Avoid unnecessary copies in PromiseStream ](https://github.com/apple/foundationdb/pull/2915), which might help for more loaded cases.

### 4/1/2020

* Storage server profiles show 25% CPU time in operator<
  * Rusty's approach: [reduce the number of calls to operator< made by lower_bound and upper_bound](https://github.com/apple/foundationdb/pull/2882)
  * Daniel's approach: [Pass StringRef by value in comparison operators ](https://github.com/apple/foundationdb/pull/2875)
  * Rusty has a larger change in the works to move from operator< to operator<=> for more gains
  * Taking an `ssd` profile again would be good?
  * Try tweaking knobs to lower the number of versions a storage server keeps in memory to see what effect that has
* Proxy CPU
  * Had used debug transaction to build up stats on where time is going in commits
  * Looked like more time is spent batching transactions on proxy than in TLogs
  * Exploring ways to cheat the commit path, and drop strict serializability if desired
  * Policy engine optimizations might have a large impact on proxy cpu time
* Will continue adding more debug transactions to get better pipeline visualization

### 3/25/2020

* Rusty's updates
  * Initial results from network loop optimization resulted in a 1%-2% speedup
  * Next focus will be on storage server optimizations 
* Daniel's benchmarking run results
  * Tracing of DebugCommit doesn't seem to show large pipelining waits
  * AWS seems to show ~0.1ms for within AZ, and ~0.3ms and ~0.7ms for across different AZs
  * Adding more clients now shows storage server saturation
  * Will continue to run more benchmarks, take and forward profiles to others to examine more closely

### 3/18/2020

* Pipelining
  * With Chrome Tracing, we now have some tools we can use to investigate commit pipelining.
  * How do we identify issues?  What do we think could be issues?  What tests should we be running to find issues?
  * Setting `\xff\x02/timeKeeper/disable` will disable timekeeper, which is the every 10s debug transaction.
  * Trevor is doing work in this area also.  Will invite him to future meetings.
    * Investigating instances where more time being spent in proxy than waiting for tlog fsync.
  * Resolvers cannot just be turned off for conflict-free workloads due to their involvement in `\xff`
* Other improvements
  * Rusty's event loop 2.0?

To do for next week:
  * The suspicion is there there should be one proxy that is slower than the others.
  * Confirm from the trace that resolvers are waiting on pipelining, and preferably that one proxy is indeed slower
  * Look into or add proxy batching to traces
  * If there is indeed one slow proxy, then work on single proxy CPU usage and profiling
  * Sync with Trevor on his current state of proxy profiling
