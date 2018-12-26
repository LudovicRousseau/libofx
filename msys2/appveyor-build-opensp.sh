#! /bin/sh

open_sp_version=1.5.2

wget -O /OpenSP-$open_sp_version.tar.gz "https://sourceforge.net/projects/openjade/files/opensp/1.5.2/OpenSP-$open_sp_version.tar.gz/download"

mpwd=`pwd`

echo "Extracting..."
cd /
tar xzvf OpenSP-$open_sp_version.tar.gz > /dev/null
cd $mpwd

echo "Patching..."
cp opensp-$open_sp_version-msys2.patch.gz /OpenSP-$open_sp_version/
cd /OpenSP-$open_sp_version
gunzip opensp-$open_sp_version-msys2.patch.gz
patch -s -p1 < opensp-1.5.2-msys2.patch

echo "Initialise..."
./autoinit.sh
./configure --prefix=/tmp/inst --disable-doc-build
make -j 2 && make install
