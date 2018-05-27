#! /bin/sh

source /appveyor.environment
export MYSTEM

cp gengetopt_$MSYSTEM.exe /usr/bin/gengetopt.exe

export PATH=$PATH:/inst/bin
cd ..
./autogen.sh
./configure --with-opensp-includes=/inst/include/OpenSP --with-opensp-libs=/inst/ --prefix=/inst
make -j 2
make install

zip -9r libofx_$MSYSTEM.zip /inst
