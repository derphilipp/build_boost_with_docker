FROM centos:latest

# EVERYTHING WE NEED FOR BUILDING boost (even with python)
RUN yum -y update
RUN yum -y upgrade
RUN yum -y install epel-release
RUN yum -y groupinstall "Development Tools"
# Install "old" boost including all dependencies
# Then remove boost, so the dependencies remain
RUN yum -y install boost*  && \
    yum -y remove  boost*
RUN yum -y install wget
# Python 3
RUN yum -y install python34 python34-devel
# Dependencies for building
RUN yum -y install icu libicu libicu-devel bzip2-devel texinfo zlib zlib-devel zlib-static openmpi openmpi-devel mpich-devel

#boost-mpich boost-mpich-devel boost-openmpi boost-openmpi-devel
RUN mkdir /tmp/boost

# Add configuration script to target, as python paths are not correctly configured
ADD project-config.jam /tmp/project-config.jam
ADD build_boost.sh /tmp/build_boost.sh

# Run this script to build boost
#CMD /bin/bash

ENV PATH /usr/lib64/openmpi/bin/:$PATH
CMD /tmp/build_boost.sh
