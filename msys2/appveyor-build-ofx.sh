#! /bin/sh

export PATH=$PATH:/inst-64/bin
cd ..
./configure --with-opensp-includes=/inst/include/OpenSP --with-opensp-libs=/inst/ --prefix=/inst
make
make install
