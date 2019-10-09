Follow these steps to obtain heap profiles:

1. Install gperftools if needed, e.g., `yum install -y gperftools-devel gperftools-libs gperftools`
2. Compile with gperf tools: `cmake -DUSE_GPERFTOOLS=1 ../foundationdb -G Ninja; ninja`
3. Run with gperftools enabled: `HEAPPROFILE=/tmp/fdbserver fdbserver [args...]`
4. Profile the heap profile: `pprof-symbolize gperf-build/bin/fdbserver /tmp/fdbserver.0065.heap`

Note that the profiling runs are at least 10X slower than the runs without profiling.

See a sample profile [here](https://github.com/apple/foundationdb/issues/2218).