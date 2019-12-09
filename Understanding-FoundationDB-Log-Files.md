# Trace Event Descriptions

# Mandatory Fields

Type

LogGroup

Severity

ID

Machine

Time

Roles

# Common Fields

Error

Backtrace

TrackLatestType

SuppressedEventCount

# Severity Levels

10

20

30

40

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