#! /bin/sh

source /appveyor.environment
export MYSTEM

cp gengetopt_$MSYSTEM.exe /usr/bin/gengetopt.exe

export PATH=$PATH:/tmp/inst/bin
cd ..
./autogen.sh
./configure --with-opensp-includes=/tmp/inst/include/OpenSP --with-opensp-libs=/tmp/inst/ --prefix=/tmp/inst
make -j 2
make install

zip -9r libofx_$MSYSTEM.zip /tmp/inst
