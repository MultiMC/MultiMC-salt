# Ubuntu with a Buildbot Slave and NodeJS for buidling the static website

# Start with Ubuntu Precise
FROM ubuntu:trusty
MAINTAINER Petr Mrázek, peterix@gmail.com

# We need "apt-add-repository"
RUN apt-get update && apt-get install -y \
    software-properties-common \
    python-software-properties \
    curl \
    git \
    wget \
    python-dev \
    python-pip

# Download and install hugo
ENV HUGO_VERSION 0.31.1
ENV HUGO_BINARY hugo_${HUGO_VERSION}_Linux-64bit.deb

# Get and install hugo
ADD https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/${HUGO_BINARY} /tmp/hugo.deb
RUN dpkg -i /tmp/hugo.deb && rm /tmp/hugo.deb

# Install Buildbot
RUN pip install buildbot-slave==0.8.10

# Create the buildslave
RUN buildslave create-slave -r /slave MASTERHOST:9989 SLAVENAME PASSWORD

# Add hacky stuff to load slave info.
COPY bbinfo.py /slave/bbinfo.py

RUN cat /slave/bbinfo.py /slave/buildbot.tac > /slave/buildbot.tac.tmp && \
    rm /slave/buildbot.tac && \
    mv /slave/buildbot.tac.tmp /slave/buildbot.tac && \
    sed -i s/\'MASTERHOST\'/bbinfo[\'master_host\']/ /slave/buildbot.tac && \
    sed -i s/9989/bbinfo[\'master_port\']/ /slave/buildbot.tac && \
    sed -i s/\'PASSWORD\'/bbinfo[\'password\']/ /slave/buildbot.tac && \
    sed -i s/\'SLAVENAME\'/bbinfo[\'name\']/ /slave/buildbot.tac

CMD ["buildslave", "start", "--nodaemon", "/slave"]
