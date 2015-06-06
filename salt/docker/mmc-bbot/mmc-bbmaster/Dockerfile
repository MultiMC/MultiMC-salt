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
RUN pip install buildbot==0.8.10

# Install Python 3 tools
RUN apt-get install -y \
    python3-dev \
    python3-pip

RUN apt-get install -y \
    python-requests \
    python-lxml

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

# make sure wget and stuff for the patreon script is available
RUN apt-get install -y \
    wget \
    python-requests \
    python-lxml

RUN pip install boto

# add patron scraper script so it can be used by schedulers
WORKDIR /usr/bin
RUN wget https://rawgit.com/MultiMC/PatronScraper2/master/patronscraper.py
RUN chmod +x patronscraper.py

EXPOSE 8010 9989

