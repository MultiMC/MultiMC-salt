# Ubuntu with a Buildbot Slave
#
# VERSION 1.0

FROM forkk/mmc-env-ubu64
MAINTAINER Andrew Okin, forkk@forkk.net

# Install pip
RUN apt-get update && apt-get install -y \
    python-dev \
    python-pip

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
