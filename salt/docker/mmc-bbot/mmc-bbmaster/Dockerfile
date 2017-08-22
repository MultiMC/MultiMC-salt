# Ubuntu with MultiMC Buildbot
#
# VERSION 1.0

FROM ubuntu:zesty
MAINTAINER Petr Mrazek, peterix@gmail.com

# Install basic python tools
RUN apt-get update && apt-get install -y python-dev python-pip python-requests python3-dev python3-pip python3-requests git wget zip unzip s3cmd

# Install Buildbot
RUN pip install buildbot==0.8.14 txgithub
RUN pip3 install 'git+https://github.com/MultiMC/repoman2.git'

# Symlink s3 configs (boto is required by python scripts, s3cmd by website uploads triggered by buildbot)
RUN ln -s /buildbot/private/boto.cfg /etc/boto.cfg
RUN ln -s /buildbot/private/s3cmd.cfg /etc/s3cmd.cfg

# add patron scraper script so it can be used by schedulers
RUN pip3 install patreon
WORKDIR /usr/bin
RUN wget https://raw.githubusercontent.com/MultiMC/patronupdater/master/patronupdater.py
RUN chmod +x patronupdater.py

RUN pip3 install iso8601 lockfile cachecontrol

EXPOSE 8010 9989

