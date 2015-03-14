# MultiMC 64-bit Ubuntu Precise Build Environment
#
# VERSION 1.0

# Start with Ubuntu Precise
FROM ubuntu:precise
MAINTAINER Andrew Okin, forkk@forkk.net

# We need "apt-add-repository"
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties

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
RUN apt-get install -y cmake g++-4.8 git build-essential

# Install Java
RUN apt-get install -y openjdk-7-jdk

# Install extra packages
RUN apt-get install -y mesa-common-dev libglu1-mesa-dev libgtk2.0-dev vim

