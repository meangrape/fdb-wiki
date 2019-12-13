## Overview

Over the life of a FoundationDB cluster, you may need to move a cluster onto a new set of machines with different sizing and performance characteristics. FoundationDB allows you to do this with no downtime or loss of fault tolerance, using the following process:

1. Add the new machines to the cluster.
2. Exclude all of the old machines.
3. Wait for exclusion to complete.
4. Shut down the old machines.
5. Re-include the old processes.

This is essentially identical to the process for replacing a single bad host, but applied to a larger number of hosts.

## Technical Considerations

It's generally best to move to the new machines all at once, rather than swapping one machine at a time. FoundationDB's data distribution is not well-optimized for clusters that combine machines of different sizes. This can be a particular problem if you're moving to a smaller number of processes that will be using larger disks. FoundationDB may not be able to divide up the disk space in an ideal way for that kind of configuration. By excluding all of the old machines in one go, you can tell the cluster to only move data onto the new machines, where it can be more effective. Doing all of the replacements at once ensures that the cluster will only distribute data onto the new machines.

Another concern with migrating hosts one at a time is the safety check in the exclusion command that prevents filling up any disks by excluding processes. This check assumes that the data from the excluded servers will be distributed evenly across all of the remaining servers. Data distribution is smarter than this in practice, but the exclusion command is applying a simpler and safer model. If you have a mixture of new machines that are nearly empty and old machines that are nearly full, it will prevent you from excluding any of the old machines. If you instead exclude all of the old machines, it will only consider the disk fullness on the new machines when determining if it can safely move the data.

The risk of moving all the machines at once is that the load from the temporary increase in process count can overwhelm the cluster controller. We recommend running a maximum of 1500 FoundationDB processes per cluster, as of FoundationDB 6.2.0. If you want to support migrating to new hosts, you would want to limit your clusters to 750 FoundationDB processes in the steady state.