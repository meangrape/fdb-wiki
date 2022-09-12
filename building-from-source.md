# Building From Source
If a developer would like to build FoundationDB from source, the following steps are required to FoundationDB.

## Dependencies
The following need to be installed:

* cmake
* mono
* Boost 1.67 (Optional, FDB will download this as a build step)
* LibreSSL if you want to support ssl
* JDK (FoundationDB currently builds with Java 8) [Java Download link](http://www.oracle.com/technetwork/java/javase/downloads/index.html)

### Installing  dependencies macOS

$ brew install mono cmake LibreSSL

### Building source code

1. Create a build directory (you can have the build directory anywhere you like): `mkdir build`
1. `cd build` 
1. `cmake <PATH_TO_FOUNDATIONDB_DIRECTORY>`

If you want to use **LibreSSL** it is recommended to pass the LibreSSL path as an argument:

```
cmake -DLibreSSL_ROOT=<PATH_TO_LIBRE_SSL> <PATH_TO_FOUNDATIONDB_DIRECTORY>
```

**Improving build times with ccache**

FoundationDB can take a while to build, using ccache will improve the build performance. To use ccache, make sure it is installed `brew install ccache` on macOS. Then add it as a parameter to the cmake command:

```
cmake -DUSE_CCACHE=ON -DLibreSSL_ROOT=<PATH_TO_LIBRE_SSL>  <PATH_TO_FOUNDATIONDB_DIRECTORY>
```

Finally to build the source code run `make`. It is possible to build individual parts of FoundationDB by running `make <FDB_PROJECT>` e.g `make fdbcli`

### Creating a package

To generate an installable package, you have to call CMake with the corresponding arguments for the operating system package nd then use cpack to generate the package.

For macOS you need to do `-DINSTALL_LAYOUT=OSX` and for a Debian package `-DINSTALL_LAYOUT=deb`

```sh
cmake -DINSTALL_LAYOUT=<OS_CHOICE>  <FDB_SOURCE_DIR>
make
cpack
```

### Building the source on Windows

Under Windows, the build instructions are very similar, with the main difference
that Visual Studio is used to compile.

1. Install Visual Studio 2017 (Community Edition is tested)
1. Install cmake Version 3.12 or higher [CMake](https://cmake.org/)
1. Download version 1.67 of [Boost](https://sourceforge.net/projects/boost/files/boost/1.67.0/).
1. Unpack boost (you don't need to compile it)
1. Install [Mono](http://www.mono-project.com/download/stable/).
1. Install a [JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html). FoundationDB currently builds with Java 8.
1. Set `JAVA_HOME` to the unpacked location and JAVA_COMPILE to
   `$JAVA_HOME/bin/javac`.
1. Install [Python](https://www.python.org/downloads/) if it is not already installed by Visual Studio.
1. (Optional) Install [WIX](http://wixtoolset.org/). Without it Visual Studio
   won't build the Windows installer.
1. Create a build directory (you can have the build directory anywhere you
   like): `mkdir build`
1. `cd build`
1. `cmake -G "Visual Studio 15 2017 Win64" -DBOOST_ROOT=<PATH_TO_BOOST> <PATH_TO_FOUNDATIONDB_DIRECTORY>`
1. This should succeed. In which case you can build using msbuild:
   `msbuild /p:Configuration=Release foundationdb.sln`. You can also open the resulting solution in Visual Studio and compile from there. However, be aware that using Visual Studio for development is currently not supported as Visual  Studio will only know about the generated files. `msbuild` is located at `c:\Program Files (x86)\MSBuild\14.0\Bin\MSBuild.exe` for Visual Studio 15.

If you want TLS support to be enabled under Windows you currently have to build and install LibreSSL yourself as the newer LibreSSL versions are not provided for download from the LibreSSL homepage. To build LibreSSL:

1. Download and unpack libressl (>= 2.8.2)
2. `cd libressl-2.8.2`
3. `mkdir build`
4. `cd build`
5. `cmake -G "Visual Studio 15 2017 Win64" ..`
6. Open the generated `LibreSSL.sln` in Visual Studio as administrator (this is necessary for the install)
7. Build the `INSTALL` project in `Release` mode

This will install LibreSSL under `C:\Program Files\LibreSSL`. After that cmake will automatically find it and build with TLS support.

If you installed WIX before running cmake you should find the
`FDBInstaller.msi` in your build directory under `packaging/msi`. 

### Language Bindings

The language bindings that are supported by cmake will have a corresponding
`README.md` file in the corresponding `bindings/lang` directory.

cmake will build all language bindings for which it can find all
necessary dependencies. After each successful cmake run, cmake will tell you
which language bindings it is going to build.



