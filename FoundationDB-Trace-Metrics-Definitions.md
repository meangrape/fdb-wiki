FoundationDB outputs various messages to `/var/log/foundationdb`. While some of these may be self-explanatory, others are hard to decipher. This page is a full listing of all metrics (as of v6.2.15 20566f2ff06a7e822b30e8cfd91090fbd863a393) and their definitions. 

**Initially these will be blank. If you come here to find a metric definition and do not find it -- please update the page when you do!**

## Common Metrics
| Metric Name  | Description |
| ------------- | ------------- |
 | Type | |
 | Time | |
 | Severity | |
 | Machine | |
 | LogGroup | |
 | ID | |
 | Roles | |

## "AsyncFileKAIOOpen"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588967689.669706` |             |
| `Type` | `AsyncFileKAIOOpen` |             |
| `ID` | `0000000000000000` |             |
| `Filename` | `/mnt/fdb/transaction/4519/logqueue-V_3_LS_2-ebfd05340047e0023ebfd5976921797d-0.fdq` |             |
| `Flags` | `983046` |             |
| `Mode` | `1408` |             |
| `Fd` | `76` |             |
| `Machine` | `10.180.50.179:4519` |             |
| `LogGroup` | `default` |             |
| `Roles` | `TL` |             |

## "BgDDMountainChopper"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588947778.846806` |             |
| `Type` | `BgDDMountainChopper` |             |
| `ID` | `47cedbda4d178447` |             |
| `SourceBytes` | `4853627018` |             |
| `DestBytes` | `3153236645` |             |
| `ShardBytes` | `24260500` |             |
| `AverageShardBytes` | `17832010` |             |
| `SourceTeam` | `Size 3; 10.180.50.80:4505 266809676c603f74 10.180.50.50:4504 54a823d4ae7529d3, 10.180.50.179:4502 5ce25c2920b67979` |             |
| `DestTeam` | `Size 3; 10.180.50.80:4500 1ddcb14a4183c131 10.180.50.179:4501 4c48cfbd569beedc, 10.180.50.59:4502 9cd1b1e104c9b375` |             |
| `Machine` | `10.180.50.133:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `DD` |             |

## "BgDDValleyFiller"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588947773.943168` |             |
| `Type` | `BgDDValleyFiller` |             |
| `ID` | `47cedbda4d178447` |             |
| `SourceBytes` | `3209342253` |             |
| `DestBytes` | `2784814454` |             |
| `ShardBytes` | `30515983` |             |
| `AverageShardBytes` | `17832010` |             |
| `SourceTeam` | `Size 3; 10.180.50.133:4501 0d0549ca42863d3d 10.180.50.77:4505 16c1de13480928f6, 10.180.50.59:4500 ba09eca3913bf7ea` |             |
| `DestTeam` | `Size 3; 10.180.50.179:4500 739f9922184049d5 10.180.50.59:4501 7b4181ea6025fff2, 10.180.50.77:4502 e8181de673760f68` |             |
| `Machine` | `10.180.50.133:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `DD` |             |

## "ClusterControllerMetrics"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1589032655.510371` |             |
| `OriginalTime` | `1589032652.301211` |             |
| `Type` | `ClusterControllerMetrics` |             |
| `ID` | `71f062b5aa2e75b9` |             |
| `Elapsed` | `5.00001` |             |
| `OpenDatabaseRequests` | `1.2 5.11374 7659081` |             |
| `RegisterWorkerRequests` | `0 0 1201` |             |
| `GetWorkersRequests` | `0 0 0` |             |
| `GetClientWorkersRequests` | `0 0 0` |             |
| `RegisterMasterRequests` | `0 0 149` |             |
| `GetServerDBInfoRequests` | `0.399999 1.52986 1845456` |             |
| `StatusRequests` | `0 0 425054` |             |
| `FailureMonitoringRequests` | `719.198 4.12408 5493283854` |             |
| `ServersFailed` | `0 0 271` |             |
| `ServersUnfailed` | `0 0 343` |             |
| `Machine` | `10.180.50.59:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CCCD` |             |
| `TrackLatestType` | `Rolled` |             |

## "ClusterControllerWorkerAlreadyRegistered"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1589306127.517835` |             |
| `Type` | `ClusterControllerWorkerAlreadyRegistered` |             |
| `ID` | `71f062b5aa2e75b9` |             |
| `SuppressedEventCount` | `0` |             |
| `WorkerId` | `6e9e2d06650b7805` |             |
| `ProcessId` | `a907b89762a1511a65776582eb9c6add` |             |
| `ZoneId` | `d5e9f92c0f8335f87d059e9f83e731b3` |             |
| `DataHall` | `3` |             |
| `PClass` | `stateless` |             |
| `Workers` | `72` |             |
| `Machine` | `10.180.50.59:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CCCD` |             |

## "ClusterGetStatus"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1589032656.245691` |             |
| `Type` | `ClusterGetStatus` |             |
| `ID` | `0000000000000000` |             |
| `Duration` | `0.0272791` |             |
| `StatusSize` | `85872` |             |
| `Machine` | `10.180.50.59:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CCCD` |             |

## "CodeCoverage"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1589229311.314538` |             |
| `Type` | `CodeCoverage` |             |
| `ID` | `0000000000000000` |             |
| `File` | `fdbserver/storageserver.actor.cpp` |             |
| `Line` | `3432` |             |
| `Condition` | `true` |             |
| `Machine` | `10.180.50.179:4501` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "CommitAttachID"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620806.473401` |             |
| `Type` | `CommitAttachID` |             |
| `ID` | `0345df4c2682866e` |             |
| `To` | `8af7049501fab007` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMP` |             |

## "CommitBatchesMemoryLimit"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620806.404859` |             |
| `Type` | `CommitBatchesMemoryLimit` |             |
| `ID` | `0000000000000000` |             |
| `BytesLimit` | `429496729` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMP` |             |

## "CommitDebug"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620806.472888` |             |
| `Type` | `CommitDebug` |             |
| `ID` | `0345df4c2682866e` |             |
| `Location` | `MasterProxyServer.batcher` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMP` |             |

## "CommitDummyTransaction"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1589306127.517460` |             |
| `Type` | `CommitDummyTransaction` |             |
| `ID` | `0000000000000000` |             |
| `Key` | `\xff/SC/p\xcb\xd8\xb2t\\xb3;1v\xa4\xcf\xf9\x8c\xf7` |             |
| `Retries` | `0` |             |
| `Machine` | `10.180.50.59:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CCCD` |             |

## "CommitDummyTransactionError"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624446.751595` |             |
| `Type` | `CommitDummyTransactionError` |             |
| `ID` | `0000000000000000` |             |
| `Error` | `operation_cancelled` |             |
| `ErrorDescription` | `Asynchronous operation cancelled` |             |
| `ErrorCode` | `1101` |             |
| `Key` | `\xff/logs` |             |
| `Retries` | `0` |             |
| `Machine` | `10.180.50.77:4518` |             |
| `LogGroup` | `default` |             |
| `Roles` | `MS` |             |

## "ConnectedOutgoing"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1589440609.340105` |             |
| `Type` | `ConnectedOutgoing` |             |
| `ID` | `0000000000000000` |             |
| `SuppressedEventCount` | `0` |             |
| `PeerAddr` | `10.180.50.50:4516` |             |
| `Machine` | `10.180.50.179:4503` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "ConnectingTo"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1589440609.338790` |             |
| `Type` | `ConnectingTo` |             |
| `ID` | `0000000000000000` |             |
| `SuppressedEventCount` | `0` |             |
| `PeerAddr` | `10.180.50.50:4516` |             |
| `Machine` | `10.180.50.179:4503` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "ConnectionClosed"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588950096.127790` |             |
| `Type` | `ConnectionClosed` |             |
| `ID` | `2ca7bfdaeffe987a` |             |
| `Error` | `connection_failed` |             |
| `ErrorDescription` | `Network connection failed` |             |
| `ErrorCode` | `1026` |             |
| `SuppressedEventCount` | `0` |             |
| `PeerAddr` | `10.180.50.77:4518` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "ConnectionEstablished"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588953503.058843` |             |
| `Type` | `ConnectionEstablished` |             |
| `ID` | `3c385b767912e1d8` |             |
| `SuppressedEventCount` | `0` |             |
| `Peer` | `10.180.50.59:34208` |             |
| `ConnectionId` | `0` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "ConnectionExchangingConnectPacket"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1589440609.339243` |             |
| `Type` | `ConnectionExchangingConnectPacket` |             |
| `ID` | `cbe8783874023296` |             |
| `SuppressedEventCount` | `0` |             |
| `PeerAddr` | `10.180.50.50:4516` |             |
| `Machine` | `10.180.50.179:4503` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "ConnectionFrom"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588953503.058843` |             |
| `Type` | `ConnectionFrom` |             |
| `ID` | `3c385b767912e1d8` |             |
| `SuppressedEventCount` | `0` |             |
| `FromAddress` | `10.180.50.59:34208` |             |
| `ListenAddress` | `10.180.50.179:4500` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "ConnectionTimedOut"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620913.463151` |             |
| `Type` | `ConnectionTimedOut` |             |
| `ID` | `0000000000000000` |             |
| `SuppressedEventCount` | `0` |             |
| `PeerAddr` | `10.180.50.80:4516` |             |
| `Machine` | `10.180.50.179:4514` |             |
| `LogGroup` | `default` |             |

## "ConnectionTimeout"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620801.277431` |             |
| `Type` | `ConnectionTimeout` |             |
| `ID` | `0000000000000000` |             |
| `SuppressedEventCount` | `1` |             |
| `WithAddr` | `10.180.50.80:4501` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "CoordinatedStateSet"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624381.224096` |             |
| `Type` | `CoordinatedStateSet` |             |
| `ID` | `0000000000000000` |             |
| `Gen` | `72` |             |
| `Wgen` | `72` |             |
| `Genu` | `4132d40fe4b7295c` |             |
| `Wgenu` | `4132d40fe4b7295c` |             |
| `Cgen` | `72` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "CoordinationPing"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588949856.367059` |             |
| `Type` | `CoordinationPing` |             |
| `ID` | `99ae80c2014db2b1` |             |
| `CCID` | `71f062b5aa2e75b9` |             |
| `TimeStep` | `126270` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "CoordinationPingSent"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1589032656.518897` |             |
| `Type` | `CoordinationPingSent` |             |
| `ID` | `71f062b5aa2e75b9` |             |
| `TimeStep` | `127650` |             |
| `Machine` | `10.180.50.59:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CCCD` |             |

## "DDInitGotInitialDD"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588935347.800644` |             |
| `OriginalTime` | `1584124303.900535` |             |
| `Type` | `DDInitGotInitialDD` |             |
| `ID` | `47cedbda4d178447` |             |
| `B` | `\x15(\x02\x02\x05\x0d\x00\x00\x00\x00\x00\x07h\xd2` |             |
| `E` | `\xff\xff` |             |
| `Src` | `014e19075c662a8f202b8a450ad604d42ad341d7b4caeb5e80b8975b6ef98d69,3821fc63e0d45b3238b4159ad69e2618` |             |
| `Dest` | `[no items]` |             |
| `Machine` | `10.180.50.133:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `DD` |             |
| `TrackLatestType` | `Rolled` |             |

## "DDRecruiting"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588970360.114821` |             |
| `Type` | `DDRecruiting` |             |
| `ID` | `0000000000000000` |             |
| `State` | `Sending request to CC` |             |
| `Exclusions` | `36` |             |
| `Critical` | `0` |             |
| `Machine` | `10.180.50.133:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `DD` |             |

## "DDTrackerStarting"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588935347.800644` |             |
| `OriginalTime` | `1584124339.015333` |             |
| `Type` | `DDTrackerStarting` |             |
| `ID` | `47cedbda4d178447` |             |
| `State` | `Active` |             |
| `Machine` | `10.180.50.133:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `DD` |             |
| `TrackLatestType` | `Rolled` |             |

## "DDTrackerStats"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588935347.800644` |             |
| `OriginalTime` | `1588935343.580889` |             |
| `Type` | `DDTrackerStats` |             |
| `ID` | `47cedbda4d178447` |             |
| `Shards` | `6787` |             |
| `TotalSizeBytes` | `245391561136` |             |
| `SystemSizeBytes` | `0` |             |
| `Machine` | `10.180.50.133:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `DD` |             |
| `TrackLatestType` | `Rolled` |             |

## "DiskMetrics"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588949825.432928` |             |
| `Type` | `DiskMetrics` |             |
| `ID` | `739f9922184049d5` |             |
| `ReadOps` | `0` |             |
| `WriteOps` | `15` |             |
| `ReadQueue` | `0` |             |
| `WriteQueue` | `0` |             |
| `GlobalSQLiteMemoryHighWater` | `0` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "DiskQueueReplaceFile"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588967689.669706` |             |
| `Type` | `DiskQueueReplaceFile` |             |
| `ID` | `ebfd05340047e002` |             |
| `Filename` | `/mnt/fdb/transaction/4519/logqueue-V_3_LS_2-ebfd05340047e0023ebfd5976921797d-0.fdq` |             |
| `OldFileSize` | `27211550720` |             |
| `ElidedTruncateSize` | `21211549696` |             |
| `Machine` | `10.180.50.179:4519` |             |
| `LogGroup` | `default` |             |
| `Roles` | `TL` |             |

## "DiskQueueReplaceTruncateEnded"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588967744.860605` |             |
| `Type` | `DiskQueueReplaceTruncateEnded` |             |
| `ID` | `0000000000000000` |             |
| `Filename` | `/mnt/fdb/transaction/4519/logqueue-V_3_LS_2-ebfd05340047e0023ebfd5976921797d-0.fdq` |             |
| `Machine` | `10.180.50.179:4519` |             |
| `LogGroup` | `default` |             |
| `Roles` | `TL` |             |

## "DumpToken"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620806.382418` |             |
| `Type` | `DumpToken` |             |
| `ID` | `ef3357ccedce9d99` |             |
| `Name` | `recruited.commit` |             |
| `Token` | `ef3357ccedce9d99` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMP` |             |

## "EndpointNotFound"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620888.228939` |             |
| `Type` | `EndpointNotFound` |             |
| `ID` | `0000000000000000` |             |
| `SuppressedEventCount` | `0` |             |
| `Address` | `10.180.50.77:4516` |             |
| `Token` | `0cc6c04fad8cdccf` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMP` |             |

## "FKBlockFail"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588951097.176744` |             |
| `Type` | `FKBlockFail` |             |
| `ID` | `739f9922184049d5` |             |
| `Error` | `operation_cancelled` |             |
| `ErrorDescription` | `Asynchronous operation cancelled` |             |
| `ErrorCode` | `1101` |             |
| `SuppressedEventCount` | `0` |             |
| `FKID` | `fa9327589855f12d` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "FSyncParentDir"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588967689.672385` |             |
| `Type` | `FSyncParentDir` |             |
| `ID` | `0000000000000000` |             |
| `Folder` | `/mnt/fdb/transaction/4519/` |             |
| `File` | `/mnt/fdb/transaction/4519/logqueue-V_3_LS_2-ebfd05340047e0023ebfd5976921797d-0.fdq` |             |
| `Machine` | `10.180.50.179:4519` |             |
| `LogGroup` | `default` |             |
| `Roles` | `TL` |             |

## "FailureMonitorClientSlow"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `20` |             |
| `Time` | `1589440609.332510` |             |
| `Type` | `FailureMonitorClientSlow` |             |
| `ID` | `0000000000000000` |             |
| `Elapsed` | `1.33938` |             |
| `Expected` | `0.1` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "FailureMonitoringServerDown"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `20` |             |
| `Time` | `1588621263.584732` |             |
| `Type` | `FailureMonitoringServerDown` |             |
| `ID` | `0000000000000000` |             |
| `OldServerID` | `71f062b5aa2e75b9` |             |
| `Machine` | `10.180.50.80:4514` |             |
| `LogGroup` | `default` |             |

## "FailureMonitoringServerUp"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588621263.886816` |             |
| `Type` | `FailureMonitoringServerUp` |             |
| `ID` | `0000000000000000` |             |
| `OldServer` | `71f062b5aa2e75b9` |             |
| `Machine` | `10.180.50.80:4514` |             |
| `LogGroup` | `default` |             |

## "FetchKeysTooLong"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `30` |             |
| `Time` | `1588970499.320355` |             |
| `Type` | `FetchKeysTooLong` |             |
| `ID` | `0000000000000000` |             |
| `Duration` | `600.003` |             |
| `Phase` | `1` |             |
| `Begin` | `mako065404742xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx\x00` |             |
| `End` | `mako0654306` |             |
| `Machine` | `10.180.50.59:4501` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "FetchPast"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `20` |             |
| `Time` | `1589227564.994779` |             |
| `Type` | `FetchPast` |             |
| `ID` | `4c48cfbd569beedc` |             |
| `TotalAttempts` | `1` |             |
| `FKID` | `ede17487d7eb7ec2` |             |
| `V` | `7856448270943` |             |
| `N` | `7856448270943` |             |
| `E` | `7856448270943` |             |
| `Machine` | `10.180.50.179:4501` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "FinishMoveKeysTooLong"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `30` |             |
| `Time` | `1588951754.826600` |             |
| `Type` | `FinishMoveKeysTooLong` |             |
| `ID` | `0000000000000000` |             |
| `Duration` | `600` |             |
| `Servers` | `673a4fea98c33d79bd4a92cfcf3ff0eca89027238077abaed423b976c88806d5,b0037425027a811f4ab8ac1b8e92510f` |             |
| `Machine` | `10.180.50.133:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `DD` |             |

## "FullSnapshotEnd"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620806.359413` |             |
| `Type` | `FullSnapshotEnd` |             |
| `ID` | `d233af26b0ac14a9` |             |
| `PreviousSnapshotEndLoc` | `0.595359` |             |
| `SnapshotSize` | `1390` |             |
| `SnapshotElements` | `1` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CD` |             |

## "GenerationRegReadReply"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620806.358701` |             |
| `Type` | `GenerationRegReadReply` |             |
| `ID` | `0000000000000000` |             |
| `RVSize` | `1351` |             |
| `VWG` | `56` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CD` |             |

## "GenerationRegReadRequest"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620806.358701` |             |
| `Type` | `GenerationRegReadRequest` |             |
| `ID` | `0000000000000000` |             |
| `From` | `10.180.50.133:4518` |             |
| `K` | `fdb_chaos_testing:8CYRO6j9` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CD` |             |

## "GenerationRegWrote"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620806.362043` |             |
| `Type` | `GenerationRegWrote` |             |
| `ID` | `0000000000000000` |             |
| `From` | `10.180.50.133:4518` |             |
| `Key` | `fdb_chaos_testing:8CYRO6j9` |             |
| `ReqGen` | `57` |             |
| `Returning` | `57` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CD` |             |

## "GetDurableResult"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624381.223495` |             |
| `Type` | `GetDurableResult` |             |
| `ID` | `610cf5205c59d595` |             |
| `Required` | `2` |             |
| `Present` | `1` |             |
| `ServerState` | `fafff` |             |
| `RecoveryVersion` | `-1` |             |
| `EndVersion` | `7252781666373` |             |
| `SafeBegin` | `0` |             |
| `SafeEnd` | `0` |             |
| `NewSafeBegin` | `0` |             |
| `KnownCommittedVersion` | `7252779663229` |             |
| `EpochEnd` | `9223372036854775807` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "GetDurableResultWaiting"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624381.222850` |             |
| `Type` | `GetDurableResultWaiting` |             |
| `ID` | `610cf5205c59d595` |             |
| `Required` | `2` |             |
| `Present` | `0` |             |
| `ServerState` | `fffff` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "GetLeaderReply"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588486349.726138` |             |
| `Type` | `GetLeaderReply` |             |
| `ID` | `0000000000000000` |             |
| `SuppressedEventCount` | `0` |             |
| `Coordinator` | `10.180.50.80:4516` |             |
| `Nominee` | `622c813b77d23c79` |             |
| `ClusterKey` | `fdb_chaos_testing:8CYRO6j9` |             |
| `Machine` | `10.180.50.179:4514` |             |
| `LogGroup` | `default` |             |

## "GetMagazineSample"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588952423.949376` |             |
| `Type` | `GetMagazineSample` |             |
| `ID` | `0000000000000000` |             |
| `Size` | `128` |             |
| `Backtrace` | `addr2line -e fdbserver.debug -p -C -f -i 0x199945c 0x195f588 0x195f7d1 0x18bada4 0x18b2e32 0x18b5bb2 0x711564 0x746640 0x756378 0x7564e6 0x7565db 0x75668c 0xb5badf 0xb5d4fa 0xb5e10b 0xa38856 0xa353e9 0x189da86 0x7fbe95498140` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "GetTLogTeamDone"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1589306128.017844` |             |
| `Type` | `GetTLogTeamDone` |             |
| `ID` | `0000000000000000` |             |
| `Completed` | `1` |             |
| `Policy` | `data_hall^2 x zoneid^2 x 1` |             |
| `Results` | `6` |             |
| `Processes` | `6` |             |
| `Workers` | `72` |             |
| `Required` | `4` |             |
| `Desired` | `6` |             |
| `RatingTests` | `200` |             |
| `PolicyGenerations` | `100` |             |
| `Machine` | `10.180.50.59:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CCCD` |             |

## "GetValueAttachID"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1589032664.326002` |             |
| `Type` | `GetValueAttachID` |             |
| `ID` | `8cd1b5993774ae29` |             |
| `To` | `c8343088d8219a7e` |             |
| `Machine` | `10.180.50.59:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CCCD` |             |

## "GetValueDebug"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588974947.417118` |             |
| `Type` | `GetValueDebug` |             |
| `ID` | `42e97f74dbc76a76` |             |
| `Location` | `storageServer.received` |             |
| `Machine` | `10.180.50.179:4503` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "GotServerDBInfoChange"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588950044.938079` |             |
| `Type` | `GotServerDBInfoChange` |             |
| `ID` | `0000000000000000` |             |
| `ChangeID` | `300f5203b4b3ba9f` |             |
| `MasterID` | `1bb55f8b45a73d07` |             |
| `RatekeeperID` | `3ebe1a9f1f09a897` |             |
| `DataDistributorID` | `47cedbda4d178447` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "HugeArenaSample"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588951071.557801` |             |
| `Type` | `HugeArenaSample` |             |
| `ID` | `0000000000000000` |             |
| `Count` | `1` |             |
| `Size` | `411480` |             |
| `Backtrace` | `addr2line -e fdbserver.debug -p -C -f -i 0x1957f87 0x69c0ec 0x18deb12 0x19d8d88 0x663015 0x7fbe95472505` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "IncomingConnection"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588953503.058843` |             |
| `Type` | `IncomingConnection` |             |
| `ID` | `3c385b767912e1d8` |             |
| `SuppressedEventCount` | `0` |             |
| `FromAddr` | `10.180.50.59:34208` |             |
| `CanonicalAddr` | `10.180.50.59:34208` |             |
| `IsPublic` | `0` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "IncomingConnectionError"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620845.918082` |             |
| `Type` | `IncomingConnectionError` |             |
| `ID` | `b13613d198545c6e` |             |
| `Error` | `connection_failed` |             |
| `ErrorDescription` | `Network connection failed` |             |
| `ErrorCode` | `1026` |             |
| `SuppressedEventCount` | `0` |             |
| `FromAddress` | `10.180.50.80:34600` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMP` |             |

## "KVCommit10sSample"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588951198.673726` |             |
| `Type` | `KVCommit10sSample` |             |
| `ID` | `739f9922184049d5` |             |
| `Queued` | `0.0461066` |             |
| `Commit` | `0.0101311` |             |
| `Checkpoint` | `0.168605` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "KVSMemRecovered"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620806.404859` |             |
| `Type` | `KVSMemRecovered` |             |
| `ID` | `ef3357ccedce9d99` |             |
| `SnapshotItems` | `0` |             |
| `SnapshotEnd` | `0` |             |
| `Mutations` | `0` |             |
| `Commits` | `0` |             |
| `TimeTaken` | `0` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMP` |             |

## "KVSMemRecoveryComplete"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620806.404859` |             |
| `Type` | `KVSMemRecoveryComplete` |             |
| `ID` | `ef3357ccedce9d99` |             |
| `Reason` | `Non-header sized data read` |             |
| `DataSize` | `0` |             |
| `ZeroFillSize` | `0` |             |
| `SnapshotEndLocation` | `0.1` |             |
| `NextReadLoc` | `0.1` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMP` |             |

## "KVSMemRecoveryStarted"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620806.404859` |             |
| `Type` | `KVSMemRecoveryStarted` |             |
| `ID` | `ef3357ccedce9d99` |             |
| `SnapshotEndLocation` | `0.1` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMP` |             |

## "KVSMemStartingSnapshot"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620806.404859` |             |
| `Type` | `KVSMemStartingSnapshot` |             |
| `ID` | `ef3357ccedce9d99` |             |
| `StartKey` | `` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMP` |             |

## "KVSMemSwitchingToLargeTransactionMode"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620806.359413` |             |
| `Type` | `KVSMemSwitchingToLargeTransactionMode` |             |
| `ID` | `d233af26b0ac14a9` |             |
| `TransactionSize` | `1417` |             |
| `DataSize` | `2120` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CD` |             |

## "LayerStatusError"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `20` |             |
| `Time` | `1589227424.258954` |             |
| `Type` | `LayerStatusError` |             |
| `ID` | `0000000000000000` |             |
| `Error` | `transaction_timed_out` |             |
| `ErrorDescription` | `Operation aborted because the transaction timed out` |             |
| `ErrorCode` | `1031` |             |
| `Machine` | `10.180.50.59:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CCCD` |             |

## "LayerStatusFetcher"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1589032656.242950` |             |
| `Type` | `LayerStatusFetcher` |             |
| `ID` | `0000000000000000` |             |
| `Duration` | `0.00563216` |             |
| `StatusSize` | `3022` |             |
| `Machine` | `10.180.50.59:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CCCD` |             |

## "LeaderChanged"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620801.624767` |             |
| `Type` | `LeaderChanged` |             |
| `ID` | `62734ed33127b4f7` |             |
| `ToID` | `002c813b77d23c79` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "MachineLoadDetail"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588949829.583142` |             |
| `Type` | `MachineLoadDetail` |             |
| `ID` | `0000000000000000` |             |
| `User` | `57406479` |             |
| `Nice` | `2418390` |             |
| `System` | `39988960` |             |
| `Idle` | `11992251032` |             |
| `IOWait` | `2063309` |             |
| `IRQ` | `0` |             |
| `SoftIRQ` | `8985462` |             |
| `Steal` | `37523` |             |
| `Guest` | `0` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "MachineMetrics"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588949824.773677` |             |
| `OriginalTime` | `1588949824.583129` |             |
| `Type` | `MachineMetrics` |             |
| `ID` | `0000000000000000` |             |
| `Elapsed` | `5.00001` |             |
| `MbpsSent` | `2.72133` |             |
| `MbpsReceived` | `2.14191` |             |
| `OutSegs` | `14067` |             |
| `RetransSegs` | `0` |             |
| `CPUSeconds` | `0.0450846` |             |
| `TotalMemory` | `133652574208` |             |
| `CommittedMemory` | `52253396992` |             |
| `AvailableMemory` | `81399177216` |             |
| `ZoneID` | `60062d710b037cb0bf737e2d7278790d` |             |
| `MachineID` | `60062d710b037cb0bf737e2d7278790d` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |
| `TrackLatestType` | `Rolled` |             |

## "MasterCommittedTLogs"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588621409.821659` |             |
| `Type` | `MasterCommittedTLogs` |             |
| `ID` | `880566f6d4ddee15` |             |
| `TLogs` | `0: adcaec5a089596b096b5a18b206c9841 95d40059bdb8bfd0cba435415e532921, 70552e191c5685331d3016ddfff999e9, 4366e563e34a058e2b99e6246bf4e7a3, b3f6da478d8a9cf40e90bec614a71c68, c26b9bf32aac5c9ba76f3069a5b42b7f ` |             |
| `RecoveryCount` | `45` |             |
| `RecoveryTransactionVersion` | `7249738881113` |             |
| `Machine` | `10.180.50.179:4518` |             |
| `LogGroup` | `default` |             |
| `Roles` | `MS` |             |

## "MasterLifetime"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624381.219712` |             |
| `Type` | `MasterLifetime` |             |
| `ID` | `610cf5205c59d595` |             |
| `LifetimeToken` | `71f062b5aa2e75b9#22` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "MasterProxyTerminated"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620809.679012` |             |
| `Type` | `MasterProxyTerminated` |             |
| `ID` | `ef3357ccedce9d99` |             |
| `Error` | `tlog_stopped` |             |
| `ErrorDescription` | `TLog stopped` |             |
| `ErrorCode` | `1011` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMP` |             |

## "MasterRecoveredConfig"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588606950.607957` |             |
| `OriginalTime` | `1586587214.484365` |             |
| `Type` | `MasterRecoveredConfig` |             |
| `ID` | `c93a9d5aa846ac9b` |             |
| `Conf` | `{\log_spill\:2\logs\:6,
edundancy_mode\:	hree_data_hall\,\storage_engine\:\ssd-2\,\usable_regions\:1}` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |
| `TrackLatestType` | `Rolled` |             |

## "MasterRecovering"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624381.235072` |             |
| `Type` | `MasterRecovering` |             |
| `ID` | `610cf5205c59d595` |             |
| `LastEpochEnd` | `7252781666373` |             |
| `RecoveryTransactionVersion` | `7252881666373` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "MasterRecovery"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624381.219712` |             |
| `Type` | `MasterRecovery` |             |
| `ID` | `610cf5205c59d595` |             |
| `BeginPair` | `0c5e5d4863f3ba9a` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "MasterRecoveryCommit"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588621409.775470` |             |
| `Type` | `MasterRecoveryCommit` |             |
| `ID` | `880566f6d4ddee15` |             |
| `Machine` | `10.180.50.179:4518` |             |
| `LogGroup` | `default` |             |
| `Roles` | `MS` |             |

## "MasterRecoveryDuration"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588606950.607957` |             |
| `OriginalTime` | `1586587214.555439` |             |
| `Type` | `MasterRecoveryDuration` |             |
| `ID` | `c93a9d5aa846ac9b` |             |
| `RecoveryDuration` | `0.0903919` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |
| `TrackLatestType` | `Rolled` |             |

## "MasterRecoveryState"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588606950.607957` |             |
| `OriginalTime` | `1586587225.075300` |             |
| `Type` | `MasterRecoveryState` |             |
| `ID` | `c93a9d5aa846ac9b` |             |
| `StatusCode` | `14` |             |
| `Status` | `fully_recovered` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |
| `TrackLatestType` | `Rolled` |             |

## "MasterTerminated"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620806.355769` |             |
| `Type` | `MasterTerminated` |             |
| `ID` | `c93a9d5aa846ac9b` |             |
| `Error` | `master_tlog_failed` |             |
| `ErrorDescription` | `Master terminating because a TLog failed` |             |
| `ErrorCode` | `1205` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "MasterUpdateRegistration"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624381.226471` |             |
| `Type` | `MasterUpdateRegistration` |             |
| `ID` | `610cf5205c59d595` |             |
| `RecoveryCount` | `48` |             |
| `Logs` | `anti: 0 replication: 4 local: 1 routers: 0 tLogs: 701adf5893b590716c046170438ae7704b24114eba5b6c6c161121f96c764bfa,5af8954c2e85d21d50cb9472a392c008,f77128b5c4256d72d9968c7d8d523c38,d4d6e33e212b440a214c51d4feda4319 locality: -1` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "MemoryMetrics"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588949829.583142` |             |
| `Type` | `MemoryMetrics` |             |
| `ID` | `0000000000000000` |             |
| `TotalMemory16` | `262144` |             |
| `ApproximateUnusedMemory16` | `0` |             |
| `ActiveThreads16` | `1` |             |
| `TotalMemory32` | `7208960` |             |
| `ApproximateUnusedMemory32` | `4325376` |             |
| `ActiveThreads32` | `1` |             |
| `TotalMemory64` | `216268800` |             |
| `ApproximateUnusedMemory64` | `166985728` |             |
| `ActiveThreads64` | `3` |             |
| `TotalMemory96` | `284880960` |             |
| `ApproximateUnusedMemory96` | `49533120` |             |
| `ActiveThreads96` | `1` |             |
| `TotalMemory128` | `219676672` |             |
| `ApproximateUnusedMemory128` | `114163712` |             |
| `ActiveThreads128` | `1` |             |
| `TotalMemory256` | `9961472` |             |
| `ApproximateUnusedMemory256` | `9306112` |             |
| `ActiveThreads256` | `1` |             |
| `TotalMemory512` | `7864320` |             |
| `ApproximateUnusedMemory512` | `7602176` |             |
| `ActiveThreads512` | `1` |             |
| `TotalMemory1024` | `7602176` |             |
| `ApproximateUnusedMemory1024` | `7340032` |             |
| `ActiveThreads1024` | `1` |             |
| `TotalMemory2048` | `9568256` |             |
| `ApproximateUnusedMemory2048` | `9306112` |             |
| `ActiveThreads2048` | `1` |             |
| `TotalMemory4096` | `5375131648` |             |
| `ApproximateUnusedMemory4096` | `49938432` |             |
| `ActiveThreads4096` | `1` |             |
| `TotalMemory8192` | `323354624` |             |
| `ApproximateUnusedMemory8192` | `322174976` |             |
| `ActiveThreads8192` | `1` |             |
| `HugeArenaMemory` | `103468` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "MonitorLeaderChange"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620801.624710` |             |
| `Type` | `MonitorLeaderChange` |             |
| `ID` | `0000000000000000` |             |
| `NewLeader` | `002c813b77d23c79` |             |
| `Machine` | `10.180.50.179:4514` |             |
| `LogGroup` | `default` |             |

## "MonitorLeaderForProxiesChange"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620801.624767` |             |
| `Type` | `MonitorLeaderForProxiesChange` |             |
| `ID` | `0000000000000000` |             |
| `NewLeader` | `002c813b77d23c79` |             |
| `Key` | `fdb_chaos_testing:8CYRO6j9` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "MonitorLeaderForProxiesGotClientInfo"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588606950.634456` |             |
| `Type` | `MonitorLeaderForProxiesGotClientInfo` |             |
| `ID` | `71f062b5aa2e75b9` |             |
| `Proxy0` | `85655d71658d880b` |             |
| `ClientID` | `a6b7ed2b5da6bee6` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "MovingData"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588935347.800644` |             |
| `OriginalTime` | `1588935347.593266` |             |
| `Type` | `MovingData` |             |
| `ID` | `47cedbda4d178447` |             |
| `InFlight` | `0` |             |
| `InQueue` | `0` |             |
| `AverageShardSize` | `44982850` |             |
| `UnhealthyRelocations` | `0` |             |
| `HighestPriority` | `0` |             |
| `BytesWritten` | `1854082563511` |             |
| `PriorityRecoverMove` | `0` |             |
| `PriorityRebalanceUnderutilizedTeam` | `0` |             |
| `PriorityRebalanceOverutilizedTeam` | `0` |             |
| `PriorityTeamHealthy` | `0` |             |
| `PriorityTeamContainsUndesiredServer` | `0` |             |
| `PriorityTeamRedundant` | `0` |             |
| `PriorityMergeShard` | `0` |             |
| `PriorityTeamUnhealthy` | `0` |             |
| `PriorityTeam2Left` | `0` |             |
| `PriorityTeam1Left` | `0` |             |
| `PriorityTeam0Left` | `0` |             |
| `PrioritySplitShard` | `0` |             |
| `Machine` | `10.180.50.133:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `DD` |             |
| `TrackLatestType` | `Rolled` |             |

## "N2_ConnectError"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `20` |             |
| `Time` | `1588620913.463151` |             |
| `Type` | `N2_ConnectError` |             |
| `ID` | `50b3dd1421b256ae` |             |
| `SuppressedEventCount` | `0` |             |
| `Message` | `125` |             |
| `Machine` | `10.180.50.179:4514` |             |
| `LogGroup` | `default` |             |

## "N2_ReadError"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `20` |             |
| `Time` | `1588950096.127790` |             |
| `Type` | `N2_ReadError` |             |
| `ID` | `2ca7bfdaeffe987a` |             |
| `SuppressedEventCount` | `0` |             |
| `Message` | `2` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "N2_ReadProbeError"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `20` |             |
| `Time` | `1588950095.007774` |             |
| `Type` | `N2_ReadProbeError` |             |
| `ID` | `562454f4e1afb8be` |             |
| `SuppressedEventCount` | `0` |             |
| `Message` | `125` |             |
| `Machine` | `10.180.50.179:4501` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "Net2SlowTaskTrace"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `20` |             |
| `Time` | `1589222264.244907` |             |
| `Type` | `Net2SlowTaskTrace` |             |
| `ID` | `0000000000000000` |             |
| `TraceTime` | `1589222264.383268` |             |
| `Trace` | `addr2line -e fdbserver.debug -p -C -f -i 0x7fbe95d375f0 0x69c3d0 0xf648ca 0xfa933e 0xfaa7f7 0xf6b111 0xf69469 0xfad5ec 0xf69a19 0xf6a2ab 0xfada46 0xfb6cac 0xf8602e 0xf865eb 0xf871bb 0xf87697 0x69f938 0xf64ef3 0xf650f1 0xf72e8b 0xf72ffc 0x69f938 0xdd1a79 0xb1be48 0xf9fb54 0xb52a51 0x19d8d88 0x663015 0x7fbe95472505 0x68f2f5` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "NetworkMetrics"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588949824.773677` |             |
| `OriginalTime` | `1588949824.583129` |             |
| `Type` | `NetworkMetrics` |             |
| `ID` | `0000000000000000` |             |
| `Elapsed` | `5.00001` |             |
| `CantSleep` | `0` |             |
| `WontSleep` | `0` |             |
| `Yields` | `5` |             |
| `YieldCalls` | `1434` |             |
| `YieldCallsTrue` | `0` |             |
| `SlowTaskSignals` | `0` |             |
| `YieldBigStack` | `0` |             |
| `RunLoopIterations` | `2590` |             |
| `TimersExecuted` | `2920` |             |
| `TasksExecuted` | `3479` |             |
| `ASIOEventsProcessed` | `3888` |             |
| `ReadCalls` | `1426` |             |
| `WriteCalls` | `712` |             |
| `ReadProbes` | `713` |             |
| `WriteProbes` | `0` |             |
| `PacketsRead` | `713` |             |
| `PacketsGenerated` | `712` |             |
| `WouldBlock` | `713` |             |
| `LaunchTime` | `0.0011158` |             |
| `ReactTime` | `0.00257254` |             |
| `SlowTask1M` | `1` |             |
| `SlowTask2M` | `1` |             |
| `PriorityBusy1` | `0.0246766` |             |
| `PriorityMaxBusy1` | `0.000935555` |             |
| `PriorityBusy2050` | `0.0246766` |             |
| `PriorityMaxBusy2050` | `0.000935555` |             |
| `PriorityBusy3050` | `0.0205729` |             |
| `PriorityMaxBusy3050` | `0.000935555` |             |
| `PriorityBusy4050` | `0.0205729` |             |
| `PriorityMaxBusy4050` | `0.000935555` |             |
| `PriorityBusy4950` | `0.0205729` |             |
| `PriorityMaxBusy4950` | `0.000935555` |             |
| `PriorityBusy5050` | `0.0189734` |             |
| `PriorityMaxBusy5050` | `0.000935555` |             |
| `PriorityBusy7050` | `0.014112` |             |
| `PriorityMaxBusy7050` | `0.000935555` |             |
| `PriorityBusy8050` | `0.014112` |             |
| `PriorityMaxBusy8050` | `0.000935555` |             |
| `PriorityBusy10050` | `0.00535178` |             |
| `PriorityMaxBusy10050` | `0.000935555` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |
| `TrackLatestType` | `Rolled` |             |

## "NewEpochStartVersion"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624381.236639` |             |
| `Type` | `NewEpochStartVersion` |             |
| `ID` | `610cf5205c59d595` |             |
| `StartVersion` | `7252779663230` |             |
| `EpochEnd` | `7252779663230` |             |
| `Locality` | `-1` |             |
| `OldLogRouterTags` | `0` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "NotifyAddressFailed"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620806.335458` |             |
| `Type` | `NotifyAddressFailed` |             |
| `ID` | `0000000000000000` |             |
| `SuppressedEventCount` | `0` |             |
| `Address` | `10.180.50.80:4519` |             |
| `Machine` | `10.180.50.179:4514` |             |
| `LogGroup` | `default` |             |

## "NotifyAddressHealthy"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620809.176447` |             |
| `Type` | `NotifyAddressHealthy` |             |
| `ID` | `0000000000000000` |             |
| `SuppressedEventCount` | `0` |             |
| `Address` | `10.180.50.80:4519` |             |
| `Machine` | `10.180.50.179:4514` |             |
| `LogGroup` | `default` |             |

## "PeekNextEnd"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624381.235072` |             |
| `Type` | `PeekNextEnd` |             |
| `ID` | `0000000000000000` |             |
| `Queue` | `0` |             |
| `Bytes` | `12` |             |
| `Loc` | `7252781666374` |             |
| `End` | `7252781666374` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "PeekNextGetMore"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624381.230646` |             |
| `Type` | `PeekNextGetMore` |             |
| `ID` | `0000000000000000` |             |
| `Total` | `0` |             |
| `Queue` | `0` |             |
| `Bytes` | `12` |             |
| `Loc` | `7252777665578` |             |
| `End` | `7252781666374` |             |
| `HasMessage` | `1` |             |
| `Version` | `7252777665578` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "PeerDestroy"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588950096.127790` |             |
| `Type` | `PeerDestroy` |             |
| `ID` | `0000000000000000` |             |
| `Error` | `connection_failed` |             |
| `ErrorDescription` | `Network connection failed` |             |
| `ErrorCode` | `1026` |             |
| `SuppressedEventCount` | `0` |             |
| `PeerAddr` | `10.180.50.77:4518` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "ProcessMetrics"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588949824.773677` |             |
| `OriginalTime` | `1588949824.583129` |             |
| `Type` | `ProcessMetrics` |             |
| `ID` | `0000000000000000` |             |
| `Elapsed` | `5.00001` |             |
| `CPUSeconds` | `0.045374` |             |
| `MainThreadCPUSeconds` | `0.044557` |             |
| `UptimeSeconds` | `7.57623e+06` |             |
| `Memory` | `7174557696` |             |
| `ResidentMemory` | `6983024640` |             |
| `UnusedAllocatedMemory` | `741200064` |             |
| `MbpsSent` | `0.103321` |             |
| `MbpsReceived` | `0.0856574` |             |
| `DiskTotalBytes` | `1056755048448` |             |
| `DiskFreeBytes` | `979928698880` |             |
| `DiskQueueDepth` | `0` |             |
| `DiskIdleSeconds` | `4.93201` |             |
| `DiskReads` | `107` |             |
| `DiskWrites` | `29` |             |
| `DiskReadsCount` | `45720243` |             |
| `DiskWritesCount` | `112056016` |             |
| `DiskWriteSectors` | `1520` |             |
| `DiskReadSectors` | `856` |             |
| `FileWrites` | `200` |             |
| `FileReads` | `107` |             |
| `CacheReadBytes` | `81920` |             |
| `CacheFinds` | `678` |             |
| `CacheWritesBlocked` | `0` |             |
| `CacheReadsBlocked` | `107` |             |
| `CachePageReadsMerged` | `0` |             |
| `CacheWrites` | `381` |             |
| `CacheReads` | `127` |             |
| `CacheHits` | `562` |             |
| `CacheMisses` | `107` |             |
| `CacheEvictions` | `0` |             |
| `ZoneID` | `60062d710b037cb0bf737e2d7278790d` |             |
| `MachineID` | `60062d710b037cb0bf737e2d7278790d` |             |
| `AIOSubmitCount` | `118` |             |
| `AIOCollectCount` | `126` |             |
| `AIOSubmitLag` | `4.35922e-09` |             |
| `AIODiskStall` | `1.19493e-05` |             |
| `CurrentConnections` | `58` |             |
| `ConnectionsEstablished` | `0` |             |
| `ConnectionsClosed` | `0` |             |
| `ConnectionErrors` | `0` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |
| `TrackLatestType` | `Rolled` |             |

## "ProcessTimeOffset"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588949862.540402` |             |
| `Type` | `ProcessTimeOffset` |             |
| `ID` | `0000000000000000` |             |
| `ProcessTime` | `1588949862.540403` |             |
| `SystemTime` | `1588949862.540403` |             |
| `OffsetFromSystemTime` | `0.000000` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "ProgramStart"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588949824.773677` |             |
| `OriginalTime` | `1581373597.325596` |             |
| `Type` | `ProgramStart` |             |
| `ID` | `0000000000000000` |             |
| `RandomSeed` | `2847564695` |             |
| `SourceVersion` | `20566f2ff06a7e822b30e8cfd91090fbd863a393` |             |
| `Version` | `6.2.15` |             |
| `PackageName` | `6.2` |             |
| `FileSystem` | `` |             |
| `DataFolder` | `/mnt/fdb/storage/4500` |             |
| `WorkingDirectory` | `/` |             |
| `ClusterFile` | `/etc/foundationdb/fdb.cluster` |             |
| `ConnectionString` | `fdb_chaos_testing:8CYRO6j9@10.180.50.50:451610.180.50.59:4516,10.180.50.77:4516,10.180.50.80:4516,10.180.50.179:4516` |             |
| `ActualTime` | `1581373597` |             |
| `CommandLine` | `/usr/sbin/fdbserver --cache_memory=5GiB --cluster_file=/etc/foundationdb/fdb.cluster --datadir=/mnt/fdb/storage/4500 --listen_address=public --locality_data_hall=3 --logdir=/var/log/foundationdb --logsize=50MiB --maxlogssize=800MiB --memory=13GiB --public_address=auto:4500 --trace_format=json` |             |
| `BuggifyEnabled` | `0` |             |
| `MemoryLimit` | `13958643712` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `TrackLatestType` | `Rolled` |             |

## "ProxyMetrics"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588606950.607957` |             |
| `OriginalTime` | `1586587210.082944` |             |
| `Type` | `ProxyMetrics` |             |
| `ID` | `d8ea53f2da943a23` |             |
| `Elapsed` | `5.00001` |             |
| `TxnStartIn` | `1.2 3.05246 282` |             |
| `TxnStartOut` | `1.2 3.05327 282` |             |
| `TxnStartBatch` | `5.39999 8.84786 1084` |             |
| `TxnSystemPriorityStartIn` | `0.399999 2.07089 61` |             |
| `TxnSystemPriorityStartOut` | `0.399999 2.07146 61` |             |
| `TxnBatchPriorityStartIn` | `0 0 2` |             |
| `TxnBatchPriorityStartOut` | `0 0 2` |             |
| `TxnDefaultPriorityStartIn` | `0.799999 2.49219 219` |             |
| `TxnDefaultPriorityStartOut` | `0.799999 2.49272 219` |             |
| `TxnCommitIn` | `0 0 10` |             |
| `TxnCommitVersionAssigned` | `0 0 10` |             |
| `TxnCommitResolving` | `0 0 10` |             |
| `TxnCommitResolved` | `0 0 10` |             |
| `TxnCommitOut` | `0 0 10` |             |
| `TxnCommitOutSuccess` | `0 0 10` |             |
| `TxnConflicts` | `0 0 0` |             |
| `CommitBatchIn` | `0.2 0.209116 52` |             |
| `CommitBatchOut` | `0.2 0.209867 52` |             |
| `MutationBytes` | `0 0 7164` |             |
| `Mutations` | `0 0 16` |             |
| `ConflictRanges` | `0 0 38` |             |
| `KeyServerLocationRequests` | `0.399999 1.93754 60` |             |
| `LastAssignedCommitVersion` | `5214997671825` |             |
| `Version` | `5214997671825` |             |
| `CommittedVersion` | `5214997671825` |             |
| `CommitBatchesMemBytesCount` | `0` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMP` |             |
| `TrackLatestType` | `Rolled` |             |

## "ProxyRatekeeperChanged"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620806.459838` |             |
| `Type` | `ProxyRatekeeperChanged` |             |
| `ID` | `ef3357ccedce9d99` |             |
| `RKID` | `3ebe1a9f1f09a897` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMP` |             |

## "ProxyReadyForReads"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620806.462527` |             |
| `Type` | `ProxyReadyForReads` |             |
| `ID` | `ef3357ccedce9d99` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMP` |             |

## "ProxyReadyForTxnStarts"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620806.459838` |             |
| `Type` | `ProxyReadyForTxnStarts` |             |
| `ID` | `ef3357ccedce9d99` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMP` |             |

## "ProxyReplies"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624381.236639` |             |
| `Type` | `ProxyReplies` |             |
| `ID` | `610cf5205c59d595` |             |
| `WorkerID` | `8931592061f8bc6b` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "RTSSComplete"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624381.235072` |             |
| `Type` | `RTSSComplete` |             |
| `ID` | `610cf5205c59d595` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "RecSnapshotEnd"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624381.230646` |             |
| `Type` | `RecSnapshotEnd` |             |
| `ID` | `610cf5205c59d595` |             |
| `NextKey` | `\xff/tagLocalityList/\x00\x00` |             |
| `Nextlocation` | `0.7252777665578` |             |
| `IsSnapshotEnd` | `1` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "RecruitStorageNotAvailable"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `20` |             |
| `Time` | `1589306128.020088` |             |
| `Type` | `RecruitStorageNotAvailable` |             |
| `ID` | `71f062b5aa2e75b9` |             |
| `Error` | `no_more_servers` |             |
| `ErrorDescription` | `Not enough physical servers available` |             |
| `ErrorCode` | `1008` |             |
| `Machine` | `10.180.50.59:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CCCD` |             |

## "RecruitedMasterWorker"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1589032655.510371` |             |
| `OriginalTime` | `1588624446.749546` |             |
| `Type` | `RecruitedMasterWorker` |             |
| `ID` | `71f062b5aa2e75b9` |             |
| `Address` | `10.180.50.77:4516` |             |
| `Machine` | `10.180.50.59:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CCCD` |             |
| `TrackLatestType` | `Rolled` |             |

## "RedundantConnection"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620801.775621` |             |
| `Type` | `RedundantConnection` |             |
| `ID` | `e78534b52842eb94` |             |
| `SuppressedEventCount` | `1` |             |
| `FromAddr` | `10.180.50.80:33774` |             |
| `CanonicalAddr` | `10.180.50.80:4517` |             |
| `LocalAddr` | `10.180.50.179:4516` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "RelocateShard"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588947771.083477` |             |
| `Type` | `RelocateShard` |             |
| `ID` | `47cedbda4d178447` |             |
| `BeginPair` | `2e60eacc0d8324b0` |             |
| `KeyBegin` | `\x15\x01\x02\x02\x05\x0d\x00\x00\x00\x00\x00\x00\x00+` |             |
| `KeyEnd` | `\x15\x01\x02\x02\x05\x0d\x00\x00\x00\x00\x00\x00\x01J` |             |
| `Priority` | `950` |             |
| `RelocationID` | `2e60eacc0d8324b0` |             |
| `SuppressedEventCount` | `0` |             |
| `Machine` | `10.180.50.133:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `DD` |             |

## "RelocateShardHasDestination"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588947771.102311` |             |
| `Type` | `RelocateShardHasDestination` |             |
| `ID` | `47cedbda4d178447` |             |
| `PairId` | `2e60eacc0d8324b0` |             |
| `DestinationTeam` | `3f07c3c89688db6849c4e6e98ac35bc5753172b1ec946a9016a993c2270a8c91,ec81cb9448fdee9c84611a1757a148c0` |             |
| `ExtraIds` | `[no items]` |             |
| `Machine` | `10.180.50.133:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `DD` |             |

## "RelocateShardMergeMetrics"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588948041.077504` |             |
| `Type` | `RelocateShardMergeMetrics` |             |
| `ID` | `47cedbda4d178447` |             |
| `OldKeys` | `mako005282 - mako0054021` |             |
| `NewKeys` | `mako005282 - mako0123825` |             |
| `EndingSize` | `0` |             |
| `BatchedMerges` | `79` |             |
| `LastLowBandwidthStartTime` | `1.58889e+09` |             |
| `ShardCount` | `79` |             |
| `Machine` | `10.180.50.133:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `DD` |             |

## "RelocateShardStartSplitx100"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588947771.086890` |             |
| `Type` | `RelocateShardStartSplitx100` |             |
| `ID` | `47cedbda4d178447` |             |
| `Begin` | `\x15\x06\x02\x02\x05\x0d\x00\x00\x00\x00\x00\x00\xfd\x99` |             |
| `End` | `\x15\x06\x02\x02\x05\x0d\x00\x00\x00\x00\x00\x01\x00M` |             |
| `MaxBytes` | `35664020` |             |
| `MetricsBytes` | `35927694` |             |
| `Bandwidth` | `Low` |             |
| `BytesPerKSec` | `0` |             |
| `NumShards` | `2` |             |
| `Machine` | `10.180.50.133:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `DD` |             |

## "RelocateShardTooLong"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `30` |             |
| `Time` | `1588952239.804462` |             |
| `Type` | `RelocateShardTooLong` |             |
| `ID` | `0000000000000000` |             |
| `Duration` | `606.35` |             |
| `Dest` | `1ddcb14a4183c13170c7fc8b0ce1f8be673a4fea98c33d79bd4a92cfcf3ff0ec,9e20cee080b698117a03822b46bc4bdb` |             |
| `Src` | `1ddcb14a4183c13170c7fc8b0ce1f8be669c1758985b5952094370cdae7fcbaf,e05471afd96a7c806a3bcd7d9173f08c` |             |
| `Machine` | `10.180.50.133:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `DD` |             |

## "RelocateShard_FinishMoveKeysRetrying"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `20` |             |
| `Time` | `1588951378.208062` |             |
| `Type` | `RelocateShard_FinishMoveKeysRetrying` |             |
| `ID` | `bb8989e8b32b1696` |             |
| `Error` | `transaction_too_old` |             |
| `ErrorDescription` | `Transaction is too old to perform reads or be committed` |             |
| `ErrorCode` | `1007` |             |
| `KeyBegin` | `mako1604058` |             |
| `KeyEnd` | `mako1611403` |             |
| `IterationBegin` | `mako1604058` |             |
| `IterationEnd` | `mako1611403` |             |
| `Machine` | `10.180.50.133:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `DD` |             |

## "ResolverInit"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624414.664221` |             |
| `Type` | `ResolverInit` |             |
| `ID` | `eb714dfc38eaa791` |             |
| `RecoveryCount` | `56` |             |
| `Machine` | `10.180.50.179:4517` |             |
| `LogGroup` | `default` |             |
| `Roles` | `RV` |             |

## "ResolverReplies"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624381.236639` |             |
| `Type` | `ResolverReplies` |             |
| `ID` | `610cf5205c59d595` |             |
| `WorkerID` | `4e8dade3aca5e1cf` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "ResolverTerminated"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624428.691057` |             |
| `Type` | `ResolverTerminated` |             |
| `ID` | `eb714dfc38eaa791` |             |
| `Error` | `worker_removed` |             |
| `ErrorDescription` | `Normal worker shut down` |             |
| `ErrorCode` | `1202` |             |
| `Machine` | `10.180.50.179:4517` |             |
| `LogGroup` | `default` |             |
| `Roles` | `RV` |             |

## "RkUpdate"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1589177956.122590` |             |
| `OriginalTime` | `1589177956.048386` |             |
| `Type` | `RkUpdate` |             |
| `ID` | `0000000000000000` |             |
| `TPSLimit` | `6.7099e+07` |             |
| `Reason` | `2` |             |
| `ReasonServerID` | `07e2bd4103ad63a4` |             |
| `ReleasedTPS` | `7.23594` |             |
| `ReleasedBatchTPS` | `0.222651` |             |
| `TPSBasis` | `7.23594` |             |
| `StorageServers` | `36` |             |
| `Proxies` | `3` |             |
| `TLogs` | `6` |             |
| `WorstFreeSpaceStorageServer` | `907272409498` |             |
| `WorstFreeSpaceTLog` | `886403637658` |             |
| `WorstStorageServerQueue` | `5995` |             |
| `LimitingStorageServerQueue` | `5904` |             |
| `WorstTLogQueue` | `1755` |             |
| `TotalDiskUsageBytes` | `1537087093944` |             |
| `WorstStorageServerVersionLag` | `0` |             |
| `LimitingStorageServerVersionLag` | `0` |             |
| `WorstStorageServerDurabilityLag` | `13965172` |             |
| `LimitingStorageServerDurabilityLag` | `13951194` |             |
| `Machine` | `10.180.50.80:4518` |             |
| `LogGroup` | `default` |             |
| `Roles` | `RK` |             |
| `TrackLatestType` | `Rolled` |             |

## "RkUpdateBatch"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1589177956.122590` |             |
| `OriginalTime` | `1589177956.048386` |             |
| `Type` | `RkUpdateBatch` |             |
| `ID` | `0000000000000000` |             |
| `TPSLimit` | `4.84604e+07` |             |
| `Reason` | `2` |             |
| `ReasonServerID` | `07e2bd4103ad63a4` |             |
| `ReleasedTPS` | `7.23594` |             |
| `ReleasedBatchTPS` | `0.222651` |             |
| `TPSBasis` | `7.23594` |             |
| `StorageServers` | `36` |             |
| `Proxies` | `3` |             |
| `TLogs` | `6` |             |
| `WorstFreeSpaceStorageServer` | `907272409498` |             |
| `WorstFreeSpaceTLog` | `886403637658` |             |
| `WorstStorageServerQueue` | `5995` |             |
| `LimitingStorageServerQueue` | `5904` |             |
| `WorstTLogQueue` | `1755` |             |
| `TotalDiskUsageBytes` | `1537087093944` |             |
| `WorstStorageServerVersionLag` | `0` |             |
| `LimitingStorageServerVersionLag` | `0` |             |
| `WorstStorageServerDurabilityLag` | `13965172` |             |
| `LimitingStorageServerDurabilityLag` | `13951194` |             |
| `Machine` | `10.180.50.80:4518` |             |
| `LogGroup` | `default` |             |
| `Roles` | `RK` |             |
| `TrackLatestType` | `Rolled` |             |

## "Role"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588967689.669706` |             |
| `Type` | `AsyncFileKAIOOpen` |             |
| `ID` | `0000000000000000` |             |
| `Filename` | `/mnt/fdb/transaction/4519/logqueue-V_3_LS_2-ebfd05340047e0023ebfd5976921797d-0.fdq` |             |
| `Flags` | `983046` |             |
| `Mode` | `1408` |             |
| `Fd` | `76` |             |
| `Machine` | `10.180.50.179:4519` |             |
| `LogGroup` | `default` |             |
| `Roles` | `TL` |             |

## "SecondCommitBatch"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624438.608650` |             |
| `Type` | `SecondCommitBatch` |             |
| `ID` | `b2ca1c090d12d855` |             |
| `DebugID` | `c005e9c6479e71db` |             |
| `Machine` | `10.180.50.179:4517` |             |
| `LogGroup` | `default` |             |
| `Roles` | `MP` |             |

## "ShardServerFutureVersion1000x"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `20` |             |
| `Time` | `1588948086.506063` |             |
| `Type` | `ShardServerFutureVersion1000x` |             |
| `ID` | `15e62ed9c0f0e5df` |             |
| `Version` | `7576974507598` |             |
| `MyVersion` | `7576974506620` |             |
| `ServerID` | `15e62ed9c0f0e5df` |             |
| `Machine` | `10.180.50.50:4503` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "SlowKAIOLaunch"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588951241.348125` |             |
| `Type` | `SlowKAIOLaunch` |             |
| `ID` | `0000000000000000` |             |
| `IOSubmitTime` | `0.016397` |             |
| `TruncateTime` | `5.00679e-06` |             |
| `TruncateCount` | `0` |             |
| `TruncateBytes` | `0` |             |
| `LargestTruncate` | `0` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "SlowKAIOTruncate"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588970316.811875` |             |
| `Type` | `SlowKAIOTruncate` |             |
| `ID` | `0000000000000000` |             |
| `TruncateTime` | `0.0778663` |             |
| `TruncateBytes` | `14774272` |             |
| `Machine` | `10.180.50.179:4519` |             |
| `LogGroup` | `default` |             |
| `Roles` | `TL` |             |

## "SlowSSLoopx100"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `20` |             |
| `Time` | `1588949830.494709` |             |
| `Type` | `SlowSSLoopx100` |             |
| `ID` | `739f9922184049d5` |             |
| `Elapsed` | `0.0617683` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "SlowTask"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `20` |             |
| `Time` | `1589222264.244907` |             |
| `Type` | `Net2SlowTaskTrace` |             |
| `ID` | `0000000000000000` |             |
| `TraceTime` | `1589222264.383268` |             |
| `Trace` | `addr2line -e fdbserver.debug -p -C -f -i 0x7fbe95d375f0 0x69c3d0 0xf648ca 0xfa933e 0xfaa7f7 0xf6b111 0xf69469 0xfad5ec 0xf69a19 0xf6a2ab 0xfada46 0xfb6cac 0xf8602e 0xf865eb 0xf871bb 0xf87697 0x69f938 0xf64ef3 0xf650f1 0xf72e8b 0xf72ffc 0x69f938 0xdd1a79 0xb1be48 0xf9fb54 0xb52a51 0x19d8d88 0x663015 0x7fbe95472505 0x68f2f5` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "SomewhatSlowRunLoopBottom"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1589244944.324415` |             |
| `Type` | `SomewhatSlowRunLoopBottom` |             |
| `ID` | `0000000000000000` |             |
| `Elapsed` | `0.0427301` |             |
| `Machine` | `10.180.50.179:4502` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "SomewhatSlowRunLoopTop"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588950070.505679` |             |
| `Type` | `SomewhatSlowRunLoopTop` |             |
| `ID` | `0000000000000000` |             |
| `Elapsed` | `0.0206292` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "SpringCleaningMetrics"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588949825.432928` |             |
| `Type` | `SpringCleaningMetrics` |             |
| `ID` | `739f9922184049d5` |             |
| `SpringCleaningCount` | `7601254` |             |
| `LazyDeletePages` | `10386661` |             |
| `VacuumedPages` | `23618478` |             |
| `SpringCleaningTime` | `8966.72` |             |
| `LazyDeleteTime` | `4754.18` |             |
| `VacuumTime` | `4199.48` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "StorageMetrics"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588949824.773677` |             |
| `OriginalTime` | `1588949822.486929` |             |
| `Type` | `StorageMetrics` |             |
| `ID` | `739f9922184049d5` |             |
| `Elapsed` | `5.00001` |             |
| `QueryQueue` | `0 0 136693665` |             |
| `GetKeyQueries` | `0 0 0` |             |
| `GetValueQueries` | `0 0 124184553` |             |
| `GetRangeQueries` | `0 0 12509112` |             |
| `FinishedQueries` | `0 0 136693665` |             |
| `RowsQueried` | `0 0 1635435284` |             |
| `BytesQueried` | `0 0 979447889012` |             |
| `WatchQueries` | `0 0 21` |             |
| `EmptyQueries` | `0 0 11247314` |             |
| `BytesInput` | `0 0 262719843608` |             |
| `BytesDurable` | `0 0 262719843608` |             |
| `BytesFetched` | `0 0 170977964670` |             |
| `MutationBytes` | `0 0 132895506551` |             |
| `SampledBytesCleared` | `0 0 203599898330` |             |
| `Mutations` | `0 0 127402905` |             |
| `SetMutations` | `0 0 88396221` |             |
| `ClearRangeMutations` | `0 0 39006684` |             |
| `AtomicMutations` | `0 0 0` |             |
| `UpdateBatches` | `0.599999 1.90249 50512542` |             |
| `UpdateVersions` | `0 0 10420748` |             |
| `Loops` | `10.6 2.0473 264484588` |             |
| `FetchWaitingMS` | `0 0 100233602` |             |
| `FetchWaitingCount` | `0 0 91888` |             |
| `FetchExecutingMS` | `0 0 574783160` |             |
| `FetchExecutingCount` | `0 0 89939` |             |
| `ReadsRejected` | `0 0 0` |             |
| `LastTLogVersion` | `7578710932602` |             |
| `Version` | `7578710932602` |             |
| `StorageVersion` | `7578705932602` |             |
| `DurableVersion` | `7578705932602` |             |
| `DesiredOldestVersion` | `7578705932602` |             |
| `VersionLag` | `633531` |             |
| `LocalRate` | `100` |             |
| `FetchKeysFetchActive` | `0` |             |
| `FetchKeysWaiting` | `0` |             |
| `QueryQueueMax` | `0` |             |
| `BytesStored` | `3092723975` |             |
| `ActiveWatches` | `0` |             |
| `WatchBytes` | `0` |             |
| `KvstoreBytesUsed` | `23042601712` |             |
| `KvstoreBytesFree` | `979928698880` |             |
| `KvstoreBytesAvailable` | `999224475648` |             |
| `KvstoreBytesTotal` | `1056755048448` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |
| `TrackLatestType` | `Rolled` |             |

## "StorageServerNoLongerBehind"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1589227661.943201` |             |
| `Type` | `StorageServerNoLongerBehind` |             |
| `ID` | `4c48cfbd569beedc` |             |
| `CursorVersion` | `7856550574648` |             |
| `TLogVersion` | `7856550574647` |             |
| `Machine` | `10.180.50.179:4501` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "StorageServerRecruitment"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588935347.800644` |             |
| `OriginalTime` | `1585946133.285731` |             |
| `Type` | `StorageServerRecruitment` |             |
| `ID` | `47cedbda4d178447` |             |
| `State` | `Idle` |             |
| `Machine` | `10.180.50.133:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `DD` |             |
| `TrackLatestType` | `Rolled` |             |

## "StorageServerUpdateLag"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `20` |             |
| `Time` | `1589227527.665466` |             |
| `Type` | `StorageServerUpdateLag` |             |
| `ID` | `4c48cfbd569beedc` |             |
| `Version` | `7856416307986` |             |
| `DurableVersion` | `7856335382578` |             |
| `Machine` | `10.180.50.179:4501` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "TLogJoinedMe"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624381.223162` |             |
| `Type` | `TLogJoinedMe` |             |
| `ID` | `610cf5205c59d595` |             |
| `TLog` | `70552e191c568533` |             |
| `Address` | `10.180.50.179:4519` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "TLogJoinedMeUnknown"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624381.237857` |             |
| `Type` | `TLogJoinedMeUnknown` |             |
| `ID` | `610cf5205c59d595` |             |
| `TLog` | `42ea2e110cb30ee0` |             |
| `Address` | `10.180.50.179:4519` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "TLogLockStarted"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624381.222850` |             |
| `Type` | `TLogLockStarted` |             |
| `ID` | `610cf5205c59d595` |             |
| `TLog` | `701adf5893b59071` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "TLogLocked"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624381.223495` |             |
| `Type` | `TLogLocked` |             |
| `ID` | `610cf5205c59d595` |             |
| `TLog` | `4b24114eba5b6c6c` |             |
| `End` | `7252781666373` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "TLogMetrics"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588964390.566463` |             |
| `OriginalTime` | `1588964387.589247` |             |
| `Type` | `TLogMetrics` |             |
| `ID` | `d168134a9dfed8e7` |             |
| `Elapsed` | `5.00001` |             |
| `BytesInput` | `199.999 367.144 358402462588` |             |
| `BytesDurable` | `784.598 172.76 358402461588` |             |
| `Version` | `7593276200217` |             |
| `QueueCommittedVersion` | `7593276200217` |             |
| `PersistentDataVersion` | `7593273726639` |             |
| `PersistentDataDurableVersion` | `7593273726639` |             |
| `KnownCommittedVersion` | `7593274051719` |             |
| `QueuePoppedVersion` | `7593265945322` |             |
| `MinPoppedTagVersion` | `7593265945322` |             |
| `MinPoppedTagLocality` | `0` |             |
| `MinPoppedTagId` | `1` |             |
| `SharedBytesInput` | `1179255431786` |             |
| `SharedBytesDurable` | `1179255430786` |             |
| `SharedOverheadBytesInput` | `54142495985` |             |
| `SharedOverheadBytesDurable` | `54142453570` |             |
| `KvstoreBytesUsed` | `106118352` |             |
| `KvstoreBytesFree` | `952354414592` |             |
| `KvstoreBytesAvailable` | `952354414592` |             |
| `KvstoreBytesTotal` | `1056755048448` |             |
| `QueueDiskBytesUsed` | `50510909440` |      bytes used on disk for the files used by a particular instance       |
| `QueueDiskBytesFree` | `952354414592` |    free space on disk (e.g. as reported by the OS)         |
| `QueueDiskBytesAvailable` | `952354414592` |       amount available for storage engine use, to include free space on disk and any internal space within the storage engine’s files that’s not currently used but is reusable      |
| `QueueDiskBytesTotal` | `1056755048448` |     total size of the disk         |
| `PeekMemoryReserved` | `0` |             |
| `PeekMemoryRequestsStalled` | `0` |             |
| `Machine` | `10.180.50.179:4519` |             |
| `LogGroup` | `default` |             |
| `Roles` | `TL` |             |
| `TrackLatestType` | `Rolled` |             |

## "TLogPeekAllAddingCurrent"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624420.962159` |             |
| `Type` | `TLogPeekAllAddingCurrent` |             |
| `ID` | `0000000000000000` |             |
| `Tag` | `-1:1` |             |
| `Begin` | `7252987965976` |             |
| `End` | `7253101514298` |             |
| `BestLogs` | `6562755249e03c5948296a5fb89a1da0 fd9ec644fe1a887e92f37eacca89e1e0, fcc74bd989146f9fec729f2986fa8591, 8e0b2719c40e23c8b080eb0f43aeea5c, 4e875de1e062f8b5c11510f911a2adc6` |             |
| `Machine` | `10.180.50.179:4518` |             |
| `LogGroup` | `default` |             |
| `Roles` | `MS` |             |

## "TLogPeekAllAddingOld"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624420.962159` |             |
| `Type` | `TLogPeekAllAddingOld` |             |
| `ID` | `0000000000000000` |             |
| `Tag` | `-1:1` |             |
| `Begin` | `7252987965976` |             |
| `End` | `7253101514298` |             |
| `BestLogs` | `60f915066a11b332df1bf98ae3f29b3d 33a3221be249eb338ef4540aed763ce7, c1d924e2f8406ff83301a25a1586bcb8, adf74fe090a23a9e2df7ea184f5fbf0f, db3ff73dcb39cfbe80903214d3ef896d` |             |
| `LastBegin` | `7252993510677` |             |
| `ThisBegin` | `7252987965976` |             |
| `Machine` | `10.180.50.179:4518` |             |
| `LogGroup` | `default` |             |
| `Roles` | `MS` |             |

## "TLogPeekAllCurrentOnly"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624381.225630` |             |
| `Type` | `TLogPeekAllCurrentOnly` |             |
| `ID` | `0000000000000000` |             |
| `Tag` | `-1:1` |             |
| `Begin` | `7252777665578` |             |
| `End` | `7252781666374` |             |
| `BestLogs` | `701adf5893b590716c046170438ae770 4b24114eba5b6c6c161121f96c764bfa, 5af8954c2e85d21d50cb9472a392c008, f77128b5c4256d72d9968c7d8d523c38, d4d6e33e212b440a214c51d4feda4319` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "TLogPeekTxs"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624381.225630` |             |
| `Type` | `TLogPeekTxs` |             |
| `ID` | `0000000000000000` |             |
| `Begin` | `7252777665578` |             |
| `End` | `7252781666374` |             |
| `LocalEnd` | `7252779663229` |             |
| `PeekLocality` | `-99` |             |
| `CanDiscardPopped` | `1` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "TLogQueueCommitSlow"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `20` |             |
| `Time` | `1588970191.282965` |             |
| `Type` | `TLogQueueCommitSlow` |             |
| `ID` | `ebfd05340047e002` |             |
| `LateProcessCount` | `30` |             |
| `LoggingDelay` | `1` |             |
| `Machine` | `10.180.50.179:4519` |             |
| `LogGroup` | `default` |             |
| `Roles` | `TL` |             |

## "TeamCollectionInfo"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588935347.800644` |             |
| `OriginalTime` | `1585946140.458718` |             |
| `Type` | `TeamCollectionInfo` |             |
| `ID` | `47cedbda4d178447` |             |
| `Primary` | `1` |             |
| `AddedTeams` | `0` |             |
| `TeamsToBuild` | `0` |             |
| `CurrentTeams` | `180` |             |
| `DesiredTeams` | `180` |             |
| `MaxTeams` | `900` |             |
| `StorageTeamSize` | `3` |             |
| `CurrentMachineTeams` | `8` |             |
| `CurrentHealthyMachineTeams` | `8` |             |
| `DesiredMachineTeams` | `30` |             |
| `MaxMachineTeams` | `150` |             |
| `TotalHealthyMachines` | `6` |             |
| `MinTeamsOnServer` | `10` |             |
| `MaxTeamsOnServer` | `17` |             |
| `MinMachineTeamsOnMachine` | `4` |             |
| `MaxMachineTeamsOnMachine` | `4` |             |
| `DoBuildTeams` | `0` |             |
| `Machine` | `10.180.50.133:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `DD` |             |
| `TrackLatestType` | `Rolled` |             |

## "TimeKeeperCommit"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1589032664.325156` |             |
| `Type` | `TimeKeeperCommit` |             |
| `ID` | `8cd1b5993774ae29` |             |
| `Machine` | `10.180.50.59:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CCCD` |             |

## "TotalDataInFlight"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588935347.800644` |             |
| `OriginalTime` | `1588935347.593266` |             |
| `Type` | `TotalDataInFlight` |             |
| `ID` | `47cedbda4d178447` |             |
| `Primary` | `1` |             |
| `TotalBytes` | `0` |             |
| `UnhealthyServers` | `0` |             |
| `ServerCount` | `36` |             |
| `StorageTeamSize` | `3` |             |
| `HighestPriority` | `140` |             |
| `Machine` | `10.180.50.133:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `DD` |             |
| `TrackLatestType` | `Rolled` |             |

## "TransactionAttachID"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620842.930019` |             |
| `Type` | `TransactionAttachID` |             |
| `ID` | `4ac2144aefd496c6` |             |
| `To` | `edd8cd7acb37f07f` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMP` |             |

## "TransactionCommit"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1589032664.326260` |             |
| `Type` | `TransactionCommit` |             |
| `ID` | `0000000000000000` |             |
| `BeginPair` | `95aa1ffaebc10be3` |             |
| `Parent` | `8cd1b5993774ae29` |             |
| `Machine` | `10.180.50.59:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CCCD` |             |

## "TransactionDebug"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588620806.471218` |             |
| `Type` | `TransactionDebug` |             |
| `ID` | `9d42d60dd934fe08` |             |
| `Location` | `MasterProxyServer.masterProxyServerCore.GetRawCommittedVersion` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMP` |             |

## "TransactionMetrics"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588949825.792440` |             |
| `Type` | `TransactionMetrics` |             |
| `ID` | `189fd7818f8615af` |             |
| `Elapsed` | `5.00001` |             |
| `Cluster` | `` |             |
| `Internal` | `1` |             |
| `ReadVersions` | `0 0 0` |             |
| `LogicalUncachedReads` | `0 0 2133637` |             |
| `PhysicalReadRequests` | `0 0 2134174` |             |
| `CommittedMutations` | `0 0 1` |             |
| `CommittedMutationBytes` | `0 0 567` |             |
| `CommitStarted` | `0 0 1` |             |
| `CommitCompleted` | `0 0 1` |             |
| `TooOld` | `0 0 0` |             |
| `FutureVersions` | `0 0 0` |             |
| `NotCommitted` | `0 0 0` |             |
| `MaybeCommitted` | `0 0 0` |             |
| `ResourceConstrained` | `0 0 0` |             |
| `ProcessBehind` | `0 0 0` |             |
| `MeanLatency` | `0` |             |
| `MedianLatency` | `0` |             |
| `Latency90` | `0` |             |
| `Latency98` | `0` |             |
| `MaxLatency` | `0` |             |
| `MeanRowReadLatency` | `0` |             |
| `MedianRowReadLatency` | `0` |             |
| `MaxRowReadLatency` | `0` |             |
| `MeanGRVLatency` | `0` |             |
| `MedianGRVLatency` | `0` |             |
| `MaxGRVLatency` | `0` |             |
| `MeanCommitLatency` | `0` |             |
| `MedianCommitLatency` | `0` |             |
| `MaxCommitLatency` | `0` |             |
| `MeanMutationsPerCommit` | `0` |             |
| `MedianMutationsPerCommit` | `0` |             |
| `MaxMutationsPerCommit` | `0` |             |
| `MeanBytesPerCommit` | `0` |             |
| `MedianBytesPerCommit` | `0` |             |
| `MaxBytesPerCommit` | `0` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "UpdatedLocalityForDcId"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588624381.225630` |             |
| `Type` | `UpdatedLocalityForDcId` |             |
| `ID` | `0000000000000000` |             |
| `DcId` | `[not set]` |             |
| `Locality0` | `-99` |             |
| `Locality1` | `-99` |             |
| `Version` | `7252779663229` |             |
| `Machine` | `10.180.50.179:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `CDMS` |             |

## "WaitForVersion1000x"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `10` |             |
| `Time` | `1588951217.218532` |             |
| `Type` | `WaitForVersion1000x` |             |
| `ID` | `0000000000000000` |             |
| `Machine` | `10.180.50.179:4500` |             |
| `LogGroup` | `default` |             |
| `Roles` | `SS` |             |

## "WaitStorageMetricsPenalty"
| Metric Name | Example | Description |
| ----------- | ------- | ----------- |
| `Severity` | `20` |             |
| `Time` | `1588948118.311610` |             |
| `Type` | `WaitStorageMetricsPenalty` |             |
| `ID` | `0000000000000000` |             |
| `Keys` | `mako09685116 - mako1626817` |             |
| `Limit` | `100` |             |
| `JitteredSecondsOfPenitence` | `15` |             |
| `Machine` | `10.180.50.133:4516` |             |
| `LogGroup` | `default` |             |
| `Roles` | `DD` |             |

