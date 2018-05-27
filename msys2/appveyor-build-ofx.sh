#! /bin/sh

app_env=/appveyor.environment
if test -f $app_env; then
	source /appveyor.environment
	export MYSTEM
fi

export PATH=$PATH:/tmp/inst/bin
cd ..
./autogen.sh
./configure --with-opensp-includes=/tmp/inst/include/OpenSP --with-opensp-libs=/tmp/inst/ --prefix=/tmp/inst
make -j 2
make install

if test -f $app_env; then
	zip -9r libofx_$MSYSTEM.zip /tmp/inst
fi
