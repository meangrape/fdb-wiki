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
## Overview

When fdbmonitor is failing to launch fdbserver processes, the process output can be a bit confusing. fdbmonitor forks a copy of itself for each process specified in the conf file. The forked copy then tries to exec to the command invocation for the child process. If that fails, you may see multiple fdbmonitor processes in the `ps` output: one for the original fdbmonitor process, and one for the failing child. 


## Debugging Failures

You can see more information about failures to launch processes in the standard output for the fdbmonitor process. fdbmonitor logs every attempt to launch a process, and the output from the child processes. The `Process` key in the log will identify whether this is coming from fdbmonitor or one of its children, and will include the process identifier from the fdbmonitor conf file. For instance, if you have a process in your monitor conf file labeled `[fdbserver.4500]`, then you will see logs from fdbmonitor identified by `Process="fdbmonitor"`, and logs from the server process identified by `Process="fdbserver.4500"`.