`perf`: https://perf.wiki.kernel.org/index.php/Main_Page is a linux profiler which will allow you to monitor the CPU utilization of a single process. Perf is a useful tool to check whether CPU time is being spent in the appropriate places and to identify potential performance bugs (by seeing which functions are consuming the most CPU cycles).


## Quick Start

1. `perf` utility can be found in the `linux-tools` package (`sudo apt install linux-tools-common` on Ubuntu or `yum install perf` on CentOS)
2. Run `perf record -g -o <file_name> -p <PID>  -- sleep <time>`, where `file_name` is the file which stores the results of the analysis, PID is the process being monitored (which in our case is the PID of `fdbserver`) and `<time>` is the amount of time (in seconds) which the profiling occurs over.
3. `perf` can open many file connections (which can sometimes exceed the system limit) resulting in a `too many open files` error. To increase the ulimit follow the instructions here: https://www.tecmint.com/increase-set-open-file-limits-in-linux/
4. To visualize the perf results, run the following command: `perf report -i <file_name> --no-children`, where `file_name` is the same value used in step 2. This will show you which functions used the most CPU time. There are other visualization possibilities as well so go over the wiki for a full rundown of the options available.

See https://forums.foundationdb.org/t/profiling-foundationdb/1337 for a lot more info!