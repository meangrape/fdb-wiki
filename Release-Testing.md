# Release Testing
This document will list the set of tests executed prior to the release of a version of FoundationDB. 

## Types of Release Testing

### Correctness Testing (using [fdb-joshua](https://github.com/FoundationDB/fdb-joshua))
* Regular
* Binding Tester
* Valgrind Enabled
* Sanitizers Enabled

### Performance Testing Matrix (using YCSB tests from [fdb-kubernetes-tests](https://github.com/FoundationDB/fdb-kubernetes-tests))
* Storage Engines
  * SQLite
  * RocksDB
  * Redwood
* Disk Types
  * [AWS EBS gp3](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html)
  * [AWS EC2 Instance Store](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/InstanceStorage.html)
* Scalability Tests (**NOTE**: "Node" definition is TBD)
  * 10 Nodes
  * 20 Nodes
  * 30 Nodes
  * etc.

### Other Cluster Testing
* High Availability configurations
* Chaos testing
* Backup/Restore Tests
  * Backup/Restore performance
  * Backup/Restore integrity

## Performance Test Metrics
* Data Load rate
* Data Read rate
* Transactional throughput (YCSB workloads A-F plus some custom/hybrid workloads)
* Latency Measurements
  * Mean Latency
  * Tail Latency
* Disk Usage Efficiency (Logical TB vs. Physical TB)
* CPU Utilization (under load)
* Memory Utilization (under load)

## Release/Test Report Format
* Format will attempt to be consistent
* Format will attempt to allow for comparability between releases
* Format is subject to change as testing capability, or system performance characteristics change
* Test reports must be available to OSS community at time of release

