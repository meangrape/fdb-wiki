# Prerequisites

The easiest way to build FoundationDB on Linux is through Docker. If you plan to do any development work you probably want to make use of CCACHE as it can improve build times significantly.

These instructions assume that you have a working Docker installation. These instructions are tested on a recent Fedora installation - but other distributions should work the same way.

Before you start check out the FoundationDB source code from github:

```
git clone https://github.com/apple/foundationdb.git
```

Or if you have a fork, you might want to check out this:

```
git clone git@github.com:github-username/foundationdb.git
```

Some developers use a remote machine for compilation and testing and a local MacOS machine for development. In that case you might want to use `rsync` to push your code to the dev machine. Snowflake employees use the following script:

```
#!/usr/bin/env bash
set -o errexit -o noclobber -o pipefail

host=$SSYNC_DEFAULT_HOST
user=$USER
local=$SSYNC_DEFAULT_LOCAL_DIR
remote=$SSYNC_DEFAULT_REMOTE_DIR

while getopts "H:u:l:r:" opt
do
    echo "Parsing $opt with $OPTARG"
    case $opt in
        H)
            host=$OPTARG
            echo "Host is now $host"
            ;;
        u)
            user=$OPTARG
            ;;
        l)
            local=$OPTARG
            ;;
        r)
            remote=$OPTARG
            ;;
        \?)
            echo "Unknown option: $1" >& 2
            exit 1
            ;;
    esac
done

echo "Host is now $host"

echo "$(date) -- syncing repo from $local to $user@$host:$remote"

while :
do
    echo -n "Syncing..."
    rsync --checksum -a --delete --exclude=.ccls-cache $local $user@$host:$remote
    echo " done ($(date))"
    notifywait $local
done
```

For this to work you need to first install [fsevent-tools](https://github.com/ggreer/fsevents-tools) which you can install through [Homebrew](https://brew.sh).

These instructions assume that your source directory is under `~/foundationdb`.

You can now run it like this: 
```
ssync.sh -H <IP of the dev vm> -l <PATH to local fdb source> -r <PATH to the fdb source on dev vm>
```

Do make sure that ```sshd``` is running on the dev vm. If not you can do: 
```
sudo systemctl enable sshd
sudo systemctl start sshd
```

# Building the Image

You can use the published docker image at `foundationdb/foundationdb-build:latest` but to make sure you have the newest image (or if you want to make changes to it) you should build it yourself (in this example we name the image `docker-build` but of course you can chose any other name):

```
cd ~/foundationdb/build
sudo docker build -t fdb-build .
```

# Setting up CCACHE

If you don't want to use ccache, you can skip this section.

These instructions assume you share your ccache with other users. If you don't, these instructions will still work for you.

## Create a Shared Directory

First you need a group where all users that you want to share with are in. We assume this group is called `devel`. Then create a shared directory:

```
sudo mkdir /shared/ccache
sudo chgr devel /shared/ccache
sudo chmod 770 /shared/ccache
sudo chmod g+s /shared/ccache 
```

## Create a Config

You need to create two configs - a system wide one and one for your user.

### Systemwide Config

CCACHE by default only caches the last 5GiB. This is not enough for FDB - so you want to set this to something higher. To set it to 100GiB execute the following commands:

```
echo "max_size = 100.0G" > /shared/ccache/ccache.conf
```

### User Config

The user config is set through environment variables. Add the following to your `~/.bashrc`, `~/.zshrc`, `~/.profile` (depending on your shell and config):

```
export CCACHE_DIR=/shared/ccache
export CCACHE_UMASK=002
export CCACHE_BASEDIR=$HOME
```

# Starting the Docker Container

First you need to know the groupid for your shared group. To get this, run the following command:

```
getent group devel | awk -F: '{printf "%d\n", $3}'
```

In this example, we assume the gid is 1003.

To start the container, edit the following command to your liking and execute it:

```
sudo docker run --rm -it -m 50g --privileged=true --cap-add=SYS_PTRACE --security-opt seccomp=unconfined -v '/home:/home' -v '/shared:/shared' -u "$UID:$UID" '-e' "LOGNAME=$(whoami)" '-e' "CCACHE_DIR=$CCACHE_DIR" '-e' "CCACHE_UMASK=$CCACHE_UMASK" '-e' 'USER=$(whoami)'  -e "HOME=$HOME" --group-add=1003 fdb-build
```

The parameter `-m 50g` will limit the memory usage of the container to 50 GiB. If your machine has less memory, you might want to set this to something smaller.

This should greet you with a shell and you can now build fdb.

# Build FoundationDB

This should be the easiest part. You just create a build directory and run cmake in it - `cmake` should find all dependencies by itself (if it doesn't, please file a bug).

It is recommended to build with [Ninja](https://ninja-build.org) as it will build much faster, but make will also work just fine. Run the following commands to build:

```
cd # docker will start up in /
mkdir build
cd build
cmake -G Ninja -DUSE_CCACHE=ON ../foundationdb
ninja
```

Sadly, building FoundationDB currently uses quite a lot of memory, so you might get OOM errors (we're working on solutions for that, but for now it is what it is...). If this happens to you, you might want to parallelism to a lower value (3-4GiB per process usually works - but you can get unlucky and you might need to limit it even further). To run with at most two parallel processes, run:

```
ninja -j2
```