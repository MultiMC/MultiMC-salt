# MultiMC 64-bit Ubuntu Precise Build Environment
#
# VERSION 1.0

# Start with Ubuntu Precise
FROM ubuntu:precise
MAINTAINER Andrew Okin, forkk@forkk.net

# We need "apt-add-repository"
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties curl

# Install node.js
RUN curl -sL https://deb.nodesource.com/setup | bash -
RUN apt-get install -y nodejs

# Install the site builder packages
RUN npm install -g grunt-cli
RUN npm install -g docpad@6.69.0

# Install Qt
RUN apt-add-repository -y ppa:beineri/opt-qt551
RUN apt-add-repository -y ppa:beineri/opt-qt542
RUN apt-get update
RUN apt-get install -y qt55base qt55svg qt55tools qt55x11extras qt55webkit
RUN apt-get install -y qt54base qt54svg qt54tools qt54x11extras qt54webkit

# Install Other Dependencies
RUN apt-get install -y zlib1g-dev

# Install Build Tools
RUN apt-add-repository -y ppa:kalakris/cmake
RUN apt-add-repository -y ppa:ubuntu-toolchain-r/test
RUN apt-get update
RUN apt-get install -y g++-5 git build-essential
RUN apt-get install wget
RUN wget --no-check-certificate https://cmake.org/files/v3.3/cmake-3.3.2-Linux-x86_64.sh
RUN sh cmake-3.3.2-Linux-x86_64.sh --skip-license --prefix=/

# Install Java
RUN apt-get install -y openjdk-7-jdk

# Install extra packages
RUN apt-get install -y mesa-common-dev libglu1-mesa-dev libgtk2.0-dev vim

