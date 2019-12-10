# Trace Event Descriptions

# Mandatory Fields

**Type** - The name of the trace event.

**LogGroup** - The value of the `--loggroup` parameter passed to `fdbserver`. This is useful when trace logs from multiple databases are ingested into the same system. 

**Severity:**
* 10 - SevInfo - General information events
* 20 - SevWarn - Indicates a generally rare event, but not indicate a actual problem
* 30 - SevWarnAlways - Indicates an event that could be causing performance problems in a cluster
* 40 - SevError - Indicates one of the assumptions of the database has been violated. Generally caused by hardware failures.

**ID** - The ID of the role which produced the event. For instance, messages logged by the master will contain the master's ID.

**Machine** - The IP address and port of the process which produced the event. For client trace logs the pid of the process is logged instead of the port.

**Time** - The time at which the event happened.

# Common Fields

Error 

Backtrace

TrackLatestType

SuppressedEventCount

Roles

# Periodic Messages

TLogMetrics

ProxyMetrics

StorageMetrics

ProcessMetrics

MachineMetrics

NetworkMetrics

MemoryMetrics

LogRouterMetrics

ClusterControllerMetrics

MovingData

TotalDataInFlight

DDTrackerStats

RkUpdate

RkUpdateBatch

DatacenterVersionDifference

SpringCleaningMetrics

# Edge Triggered Messages

## Generic Failure Info

SlowTask

Net2SlowTaskTrace

FailureDetectionStatus

ConnectingTo

ConnectionClosed

ConnectionTimedOut

ConnectionTimeout

ProgramStart

Role

TLogDegraded

LargeTransaction

ProxyCommitBatchMemoryThresholdExceeded

TooManyNotifications

TooManyStatusRequests

LargePacketSent

LargePacketReceived

HugeArenaSample

GetMagazineSample

SlowKAIOTruncate

SlowKAIOLaunch

KVCommit10sSample

StorageServerUpdateLag

TLogUpdateLag

TraceEventThrottle_*

TLS*

## Master Recovery

MasterRecoveryState

MasterRecovering

MasterRecoveredConfig

MasterRegistrationReceived

MasterRecoveryDuration

MasterTerminated

BetterMasterExists

CCWDB

## TLog Recovery

TLogRestorePersistentState

TLogRestorePersistentStateDone

TLogRecover

TLogReady

TLogPoppedTag

TLogLockStarted

TLogLocked

TLogStop

GetDurableResult

GetDurableResultWaiting

## Storage Server Recovery

Rollback

ReadingDurableState

RestoringDurableState

SSTimeRestoreDurableState

StorageServerStartingCore

## Data Distribution

StatusMapChange

TeamHealthChanged

BuildTeamsBegin

ServerTeamRemover

MachineTeamRemover

DDInitTakingMoveKeysLock

DDInitTookMoveKeysLock

## Coordination

NominatingLeader

ReplacedAsLeader

LeaderTrueHeartbeat

LeaderFalseHeartbeat

LeaderNoHeartbeat

ReleasingLeadership

## Client Messages

ClientStart

TransactionMetrics