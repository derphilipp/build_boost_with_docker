FROM centos:latest

# EVERYTHING WE NEED FOR BUILDING boost (even with python)
RUN yum -y update
RUN yum -y upgrade
RUN yum -y install epel-release
RUN yum -y install deltarpm
RUN yum -y groupinstall "Development Tools"
RUN yum -y install wget
RUN yum -y install python34 python34-devel
RUN yum -y install icu libicu libicu-devel 
RUN yum -y install openmpi-devel mpich-devel 
RUN yum -y install zlib zlib-devel zlib-static
RUN yum -y install openmpi

#boost-mpich boost-mpich-devel boost-openmpi boost-openmpi-devel
RUN mkdir /tmp/boost

# Add configuration script to target, as python paths are not correctly configured
ADD project-config.jam /tmp/project-config.jam
ADD build_boost.sh /tmp/build_boost.sh

# Run this script to build boost
#CMD /bin/bash

ENV PATH /usr/lib64/openmpi/bin/:$PATH
CMD /tmp/build_boost.sh
