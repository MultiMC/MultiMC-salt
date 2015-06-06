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
RUN apt-add-repository -y ppa:beineri/opt-qt541
RUN apt-get update
RUN apt-get install -y qt54base qt54svg qt54tools qt54x11extras qt54webkit

# Install Other Dependencies
RUN apt-get install -y zlib1g-dev

# Install Build Tools
RUN apt-add-repository -y ppa:kalakris/cmake
RUN apt-add-repository -y ppa:ubuntu-toolchain-r/test
RUN apt-get update
RUN apt-get install -y g++-5 git build-essential
RUN apt-get install wget
RUN wget http://www.cmake.org/files/v3.2/cmake-3.2.3-Linux-x86_64.sh
RUN sh cmake-3.2.3-Linux-x86_64.sh --skip-license --prefix=/

# Install Java
RUN apt-get install -y openjdk-7-jdk

# Install extra packages
RUN apt-get install -y mesa-common-dev libglu1-mesa-dev libgtk2.0-dev vim

