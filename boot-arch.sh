#!/bin/bash

REPO_URL= # TODO

if [ "$(id -u)" != "0" ]; then
    echo "You are not root." 1>&2
    exit 1
fi

case $1 in
    "" )
	echo "Please specify a Salt master host or '--master' to make this server the master."
	exit 1
	;;
    "--master" )
	MASTER_HOST=localhost
	I_AM_THE_MASTER=1
	echo "Setting up server as Salt master."
	;;
    * )
	MASTER_HOST=$1
	I_AM_THE_MASTER=0
	echo "Setting up server as Salt minion with master at $MASTER_HOST."
	;;
esac


read -p 'Did you remember to upgrade all your packages first? (Press enter to continue.)'


# Arch Linux server bootstrapping script.
# Installs salt and sets up initial configuration.

set -e

# First, install Salt and git.
pacman -S salt-zmq git

# Next, set the salt master.
sed -i "/master:/c\master: $MASTER_HOST" /etc/salt/minion


# If we're setting up a master, clone the repo 
git clone https://github.com/Forkk/fnet-salt /srv/salt

# If we are the salt master, set up the Salt master.
if [ $I_AM_THE_MASTER ]; then
    systemctl enable salt-master
    systemctl start salt-master
fi

# Start the minion.
echo "Starting Salt daemon..."
systemctl enable salt-minion
systemctl start  salt-minion

salt-call test.ping || true

# Tell the user to accept the key.
if [ $I_AM_THE_MASTER ]; then
    # If we are the salt master, accept the minion's connection.
    salt-key -A
else
    # Otherwise, tell the user to accept the key.
    read -p "Please accept the minion's key on the master and then press enter to continue."
fi

salt-call test.ping


# Run the bootstrap state in order to bootstrap salt states with required packages.
echo "Bootstrapping Salt..."
salt-call state.sls boot

# We're ready to run highstate. We'll let the user do that.
echo "Ready! Please run 'salt-call state.highstate' to set up the server."
