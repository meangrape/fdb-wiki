When Joshua tests failed for an upgrade test, the reproduction of the failure is different from normal runs. Specifically, to reproduce the failure, we need to run two commands, one with the old binary and one with the new binary.

For instance, the Joshua results contains failures like:
```
  <Test TestUID="7e8c7574-74fe-487f-8af3-05421d646384" RandomSeed="535104944" SourceVersion="dd5481fb60ee1652986b2a028b31dcbb6cb171b5" Time="1548289089" BuggifyEnabled="0" DeterminismCheck="0" OldBinary="fdbserver-6.0.3" TestFile="/app/deploy/ensembles/20190123-161607-jingyu_zhou-bcdbea9b64b020d3/tests/restarting/CycleTestRestart-1.txt" SimElapsedTime="59.8124" RealElapsedTime="1.94647" RandomUnseed="45188" Passed="0" Failed="1" PeakMemory="37519360" OK="true" />  
  <Test TestUID="7e8c7574-74fe-487f-8af3-05421d646384" RandomSeed="535104945" SourceVersion="f7ed11ccd605968813a59622eb8778007cd003fe" Time="1548289093" BuggifyEnabled="0" DeterminismCheck="0" OldBinary="fdbserver-6.0.3" TestFile="/app/deploy/ensembles/20190123-161607-jingyu_zhou-bcdbea9b64b020d3/tests/restarting/CycleTestRestart-2.txt" SimElapsedTime="2110.19" RealElapsedTime="74.4127" RandomUnseed="87437" Passed="1" Failed="0" PeakMemory="625065984" OK="false">  
    <DisableConnectionFailures_Tester Severity="30" LogGroup="default" />  
    <TestFailure Severity="40" Error="timed_out" ErrorDescription="Operation timed out" ErrorCode="1004" Reason="Unable to set starting configuration" Backtrace="addr2line -e fdbserver.debug -p -C -f -i 0x1479f46 0x14786b7 0xad9537 0xad9ab7 0x45dfc9 0x7b13d4 0x530ae0 0x141a2d3 0x141a773 0x141a44d 0x141ac3d 0x530ae0 0x149e472 0x141a92a 0x141abc5 0x439ffb 0x7f63efbe8ec5" LogGroup="default" />  
    <CodeCoverage File="fdbserver/SimulatedCluster.actor.cpp" Line="1293" />  
    <CodeCoverage File="fdbserver/DiskQueue.actor.cpp" Line="616" />  
    ...(elided)  
```
Note the first "<Test>" indicates this is running with old binary of version "fdbserver-6.0.3". Assuming you have both binaries (fdbserver-6.0.3 and fdbserver-new) at hand, the correct command to reproduce the error is:

`fdbserver-6.0.3 -r simulation -f ./foundationdb/tests/restarting/CycleTestRestart-1.txt -s 535104944 -b off`

`fdbserver-new   -r simulation -f ./foundationdb/tests/restarting/CycleTestRestart-2.txt -s 535104945 -b off --restarting`

You can download old binaries from [here](https://www.foundationdb.org/downloads/misc/fdbservers-6.2.22.tar.gz) and then extract the tar ball, or just build one. Note that the second command needs "**--restarting**" flag.

Finally, if you still can't reproduce. Check if the compiler you used is the same as Joshua job, which by default is GCC 8. Sometimes it's better to reproduce using the development docker image, as different Linux version may affect determinism.