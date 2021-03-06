#!/bin/bash


target=${TARGET-/usr/local}
hash="753c109e31818dcf7aa8a2c8ecdac4fa43d2ab9b"

if [[ $# -eq 0 ]] ; then
    echo 'install_cufflinks.sh <git commit hash>'
    exit 0
fi


if [[ $# -ne 0 ]] ; then
        hash=$1
        shift
fi



#wget -O ./master.zip https://github.com/cole-trapnell-lab/cufflinks/archive/master.zip
#unzip -o master.zip
#cd cufflinks-master

#yum install epel-release
yum install -y gcc-c++
yum install -y automake autoconf glibc samtools samtools-libs boost-devel boost-thread libgcc coreutils libstdc++ zlib glibc zlib-devel.x86_64 ncurses-devel ncurses eigen3-devel.noarch
yum install -y samtools-devel.x86_64 samtools-libs.x86_64 samtools.x86_64 
#rm -rf htslib
#git clone https://github.com/samtools/htslib.git
#cd htslib
#make
#mkdir -p /usr/local/include/htslib
#cp ./htslib/*.h /usr/local/include/htslib

#cd ../
#rm -rf samtools
#git clone https://github.com/samtools/samtools
#cd samtools
#make
#mkdir -p /usr/local/include/bam
#cp ./libbam.a /usr/local/lib/
#cp ./*.h /usr/local/include/bam
#ln -s ./version.h /usr/local/include/bam/version.hpp
#cp ./samtools /usr/local/bin/

#cd ../
#wget -O ./eigen.tar.gz http://bitbucket.org/eigen/eigen/get/3.2.5.tar.gz
#rm -rf ./eigen
#mkdir ./eigen
#tar -zxvf ./eigen.tar.gz -C ./eigen --strip-components=1
#cp -r ./eigen/Eigen /usr/local/include/
#export EIGEN3_CFLAGS=/usr/local/include/eigen3
#export EIGEN3_LIBS=/usr/local/include/eigen3
#ln -s /usr/lib64/libbam.so.1 /usr/local/lib/libbam.a 
rm -rf cufflinks
git clone https://github.com/cole-trapnell-lab/cufflinks.git

cd cufflinks
git checkout $hash
#export BAM_ROOT=/usr/local/include/bam
./autogen.sh
./configure --with-bam=/usr/lib64 --prefix=$target --with-boost-thread=/usr/lib64/libboost_thread-mt.so --with-boost=/usr/include/boost --with-boost-libdir=/usr/lib64

make
make install
