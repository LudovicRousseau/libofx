#! /bin/sh

open_sp_version=1.5.2

wget -O /OpenSP-$open_sp_version.tar.gz "https://sourceforge.net/projects/openjade/files/opensp/1.5.2/OpenSP-$open_sp_version.tar.gz/download"

mpwd=`pwd`
cd /
tar xzvf OpenSP-$open_sp_version.tar.gz
cd $mpwd

cp opensp-$open_sp_version-msys2.patch.gz /OpenSP-$open_sp_version/
cd /OpenSP-$open_sp_version
gunzip opensp-$open_sp_version-msys.patch.gz
patch -s -p1 < opensp-1.5.2-msys.patch
./autoinit.sh
./configure --prefix=/inst --disable-doc-build
make && make install

export PATH=$PATH:/inst-64/bin
../libofx/configure --with-opensp-includes=/home/Karin/libofx/inst-64/include/OpenSP --with-opensp-libs=/home/Karin/libofx//inst-64/ --prefix=/home/Karin/libofx/inst-64 && make

