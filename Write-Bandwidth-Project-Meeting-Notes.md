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
