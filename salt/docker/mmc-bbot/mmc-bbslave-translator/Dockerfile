# Ubuntu with a Buildbot Slave and an ssh key pair for git access

FROM forkk/mmc-env-ubu64
MAINTAINER Petr Mrázek, peterix@gmail.com

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

# Set things up for github access
RUN cat /dev/zero | ssh-keygen -q -N '' -f /root/.ssh/id_rsa -C 'MultiMC Translator'
RUN ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN git config --global user.name "MultiMC Translator"
RUN git config --global user.email mmc-translator@dethware.org

CMD ["buildslave", "start", "--nodaemon", "/slave"]
