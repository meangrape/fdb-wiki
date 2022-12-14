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
There are scenarios like hardware upgrade, rack upgrade, etc., where some machines may need to be taken offline. After the work is done, these machines are brought back online. It may be desirable to not trigger a large scale data distribution while the machines are offline. FoundationDB has a maintenance mode where the user can notify the database that a particular zone is going for maintenance and not trigger data distribution due to offline machines in that particular zone. 

fdbcli tool has a command to initiate maintenance mode

```
fdb> help maintenance

maintenance [on|off] [ZONEID] [SECONDS]

Mark a zone for maintenance.

Calling this command with on prevents data distribution from moving data away
from the processes with the specified ZONEID. Data distribution will
automatically be turned back on for ZONEID after the specified SECONDS have
elapsed, or after a storage server with a different ZONEID fails. Only one
ZONEID can be marked for maintenance. Calling this command with no arguments
will display any ongoing maintenance. Calling this command with off will
disable maintenance.
```

The user has to be careful to offline machines only on the particular zone that the maintenance mode is initiated for, otherwise data distribution can get triggered. Once the offline machines are brought online, the storage servers will begin to catch up.