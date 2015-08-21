#!/bin/bash

BOOST_MAJ_VERSION=1
BOOST_MIN_VERSION=59
BOOST_REL_VERSION=0

bootstrap_options=""
bootstrap_options+="--with-python-version=3.4 "
bootstrap_options+="--with-python=/usr/bin/python3.4 "

b2_options=""
b2_options+="--prefix=/usr/local "
b2_options+="-j8 "






# Build Download URL
sf_url="http://sourceforge.net/projects/boost/files/boost/"
dl_url="${sf_url}${BOOST_MAJ_VERSION}.${BOOST_MIN_VERSION}.${BOOST_REL_VERSION}/boost_${BOOST_MAJ_VERSION}_${BOOST_MIN_VERSION}_${BOOST_REL_VERSION}.tar.bz2/download"
# Build temporary dir, where the sources are extracted
tmp_dir="/tmp/boost/boost_${BOOST_MAJ_VERSION}_${BOOST_MIN_VERSION}_${BOOST_REL_VERSION}/"


# Overwrite the boost configuration file,
# because python paths are not filled in otherwise

cd /tmp/boost && \
wget -c $dl_url && \
tar -xvjf download && \
cd $tmp_dir && \
./bootstrap.sh $bootstrap_options && \
cp -f /tmp/project-config.jam $tmp_dir && \
./b2 install $b2_options && \
echo "All done"

