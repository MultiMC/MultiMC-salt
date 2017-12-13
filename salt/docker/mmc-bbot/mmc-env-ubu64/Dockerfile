# MultiMC 64-bit Ubuntu Precise Build Environment

# Start with Ubuntu Precise
FROM ubuntu:trusty
MAINTAINER Petr Mrázek, peterix@gmail.com

# We need "apt-add-repository"
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties curl

# Install Qt
RUN apt-add-repository -y ppa:beineri/opt-qt542-trusty
RUN apt-get update
RUN apt-get install -y qt54base qt54svg qt54tools qt54x11extras

# Install Other Dependencies
RUN apt-get install -y zlib1g-dev

# Install Build Tools
RUN apt-add-repository -y ppa:ubuntu-toolchain-r/test
RUN apt-get update
RUN apt-get install -y g++-5 git build-essential
RUN apt-get install wget
RUN wget --no-check-certificate https://cmake.org/files/v3.10/cmake-3.10.0-Linux-x86_64.sh
RUN sh cmake-3.10.0-Linux-x86_64.sh --skip-license --prefix=/

# Install Java
RUN apt-get install -y openjdk-7-jdk

# Install extra packages
RUN apt-get install -y mesa-common-dev libglu1-mesa-dev libgtk2.0-dev vim
