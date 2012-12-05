Creating Go Build Environment in Windows
========================================

Install Python
--------------


Install Perl (Strawberry Perl)
------------------------------


Install Mercurial (TortoiseHg)
------------------------------


Install Git
-----------
* Make sure that line endings are "checkout as is"


Install Go
----------
  
Install MinGW with all addons.  -- this will take a really long time.
---------------------------------------------------------------------
* Add the following to the windows PATH:
* `C:\MinGW\bin;C:\MinGW\msys\1.0\bin;`


Install Z-lib in MinGW
----------------------
In MinGW shell (Administrator mode):
```
$> mingw-get install msys-zlib
```
  
  
Install curl from source in MinGW (since it doesn't come with msys or mingw)
----------------------------------------------------------------------------
Download and unzip the source somewhere (anywhere, doesn't matter)

In MinGW shell:
```
$> ./configure --prefix=/mingw
$> make
$> make install
```

Check your installations
------------------------
Make sure python, go, curl, perl, hg, and git are in your path.
In MinGW shell:
```
$> python --version
$> go version
$> curl --version
$> perl --version
$> hg --version
$> git --version
```

Create your workspace
---------------------
We will use the variable `WORKSPACE` to denote the directory where you keep all your projects.  We will be creating a moovweb project which will contain our code.  But first, we'll have to set a few variables.

In MinGW shell:
```
$> export MOOV_HOME=$WORKSPACE/moovweb
$> mkdir -p $MOOV_HOME/src
$> cd $MOOV_HOME/src
$> git clone git@github.com:moovweb/manhattan
```

Building
--------

In MinGW shell:
```
$> cd $MOOV_HOME/src/manhattan/build
$> bash ./nogo clibs all         # builds all the clibs, to build just one, do ./nogo clibs libsass
$> bash ./nogo build powermoov   # builds the powermoov target, also available: mps, moov, and servermoov
```

Running compiled binaries:
===========================
To run powermoov, windows doesn't have an `LD_LIBRARY_PATH`, you have to use `PATH`.

In MinGW shell:
```
$> export PATH=$MOOV_HOME/clibs/bin:$PATH
```
Note that you're adding the "bin" directory, and not the lib one.  This is a windows thing.

