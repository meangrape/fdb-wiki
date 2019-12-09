This document describes how cluster coordination works. This should answer the following questions:

* What happens when a `fdbserver` process joins a cluster?
* How are node failures and network partitions detected?
* How can a process find processes of a specific role?

# Important Roles

All server nodes within a cluster participate in the cluster coordination process. Servers join the cluster by participating in the leader election process (or rather by submitting a candidacy) and then stay in the cluster by sending an occasional heartbeat to the leader.

The three roles (explained in more detail below) that participate in this process are:

1. The **coordinators** those are typically chosen by the administrator and a cluster typically runs between one and 5 of those.
1. The **cluster controller** is the leader and is elected by the coordinators. Any node in the cluster can become leader, but an administrator can make the election of certain processes much more likely by setting a role.

## The Coordinators

The coordinators run in the processes that are listed in the `fdb.cluster` file. Coordinators are the first entry point and, apart from other things, they elect the leader (called cluster controller).

When a `fdbserver` process starts, it will send a candidacy to become leader to all coordinators. This means that all nodes in the cluster will try to become leader. Each coordinator will reply with a `LeaderInfo` object - containing the interface of what it chose to become leader. If a majority of all coordinators agree on the leader, this node will start the cluster controller role and all other nodes will connect to it.

The relevant actor here is `tryBecomeLeaderInternal` which can be found in `fdbserver/LeaderElection.actor.cpp`.

If everything goes well, the server will afterwards have knowledge of the leader.

## The Cluster Controller

The cluster controller is the leader which got elected by the coordinators. The definition of its RPC interface can be found in `fdbserver/ClusterRecruitmentInterface.h` (part of it is reachable from the client side - this can be found in `ClusterInterface` in `fdbclient/ClusterInterface.h`).

The cluster controller has many responsibilities (and not all of them will be explained in this document):

1. It keeps a list of all server nodes that are currently running in the cluster.
1. It broadcasts the `ServerDBInfo` to all nodes in the cluster (see below for more explanations).
1. It monitors all servers and decides on failures - it is the main authority to resolve network partitions.
1. It kicks off recovery by electing a master (only very briefly explained later).
1. It recruits workers for certain roles (not explained in this document).
1. It serves as the endpoint to clients for opening the database (not explained in this document).
1. It can generate the `status` json document for `fdbcli` and clients (not explained in this document).

