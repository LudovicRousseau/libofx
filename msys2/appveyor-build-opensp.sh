#! /bin/sh

open_sp_version=1.5.2


wget -O /tmp/OpenSP-$open_sp_version.tar.gz "https://sourceforge.net/projects/openjade/files/opensp/1.5.2/OpenSP-$open_sp_version.tar.gz/download"

opwd=`pwd`

echo "Extracting..."
cd /tmp
tar xzvf OpenSP-$open_sp_version.tar.gz > /dev/null
cd $opwd

echo "Patching..."
cp opensp-$open_sp_version-msys2.patch.gz /tmp/OpenSP-$open_sp_version/
cd /tmp/OpenSP-$open_sp_version
gunzip opensp-$open_sp_version-msys2.patch.gz
patch -s -p1 < opensp-1.5.2-msys2.patch

echo "Initialise..."
./autoinit.sh
./configure --prefix=/tmp/inst --disable-doc-build
make -j 2 && make install
