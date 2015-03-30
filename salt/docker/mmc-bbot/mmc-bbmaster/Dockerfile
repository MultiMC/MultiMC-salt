# Ubuntu with MultiMC Buildbot
#
# VERSION 1.0

FROM ubuntu
MAINTAINER Andrew Okin, forkk@forkk.net

# Install pip
RUN apt-get update && apt-get install -y \
    python-dev \
    python-pip

# Install Buildbot
RUN pip install buildbot

# Install Python 3 tools
RUN apt-get install -y \
    python3-dev \
    python3-pip

# Install git
RUN apt-get install -y \
    git

RUN pip3 install 'git+https://github.com/MultiMC/repoman2.git'

RUN apt-get install -y zip unzip s3cmd

RUN pip install awscli

# Symlink Boto config (this file will be injected into the container in the
# /buildbot/private folder.
RUN ln -s /buildbot/private/boto.cfg /etc/boto.cfg
RUN ln -s /buildbot/private/s3cmd.cfg /etc/s3cmd.cfg

EXPOSE 8010 9989

