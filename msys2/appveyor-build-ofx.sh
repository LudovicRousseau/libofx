#! /bin/sh

export PATH=$PATH:/inst/bin
./configure --with-opensp-includes=/inst/include/OpenSP --with-opensp-libs=/inst/ --prefix=/inst
make
make install

source /appveyor.environment
export MSYSTEM

zip -9r /libofx_$MSYSTEM.zip /inst
