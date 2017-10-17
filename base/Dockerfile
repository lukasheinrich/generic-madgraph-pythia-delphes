FROM centos

#
# Generic Infrastructure
#

RUN yum --assumeyes groupinstall "Development Tools"
RUN yum --assumeyes install gcc gcc-gfortran graphviz-devel make perl tar nano wget which boost boost-devel zlib zlib-devel libstdc++-static python-devel
RUN curl -s https://bootstrap.pypa.io/get-pip.py | python

ARG MG5VERSION=2.6.0
ARG HEPMCVERSION=2.06.09
ARG PYTHIAVERSION=8215
ARG ROOTVERSION=6-04-14
ARG DELPHESVERSION=3.4.1

#
# Madgraph
#

WORKDIR /code
RUN curl -sSL https://launchpad.net/mg5amcnlo/2.0/2.6.x/+download/MG5_aMC_v${MG5VERSION}.tar.gz | tar -xzvf - && \
    ln -s $PWD/MG5_aMC_*/bin/mg5_aMC /usr/local/bin && \
    ln -s $PWD/MG5_aMC_*/bin/mg5 /usr/local/bin
RUN echo "install lhapdf6" | mg5
RUN echo "install pythia8" | mg5
RUN echo "install MadAnalysis5" | mg5

RUN yum install -y gcc-gfortran openssl-devel pcre-devel \
	mesa-libGL-devel mesa-libGLU-devel glew-devel ftgl-devel mysql-devel \
	fftw-devel cfitsio-devel graphviz-devel \
	avahi-compat-libdns_sd-devel libldap-dev python-devel \
	libxml2-devel gsl-static  git make gcc-c++ gcc binutils \
	libX11-devel libXpm-devel libXft-devel libXext-devel

ENV ROOTSYS /usr/local

RUN git clone --quiet http://root.cern.ch/git/root.git /code/rootproject &&\
    cd  /code/rootproject &&\
    git checkout v${ROOTVERSION} &&\
    ./configure --all &&\
    make -j4 &&\
    make -j4 install
