MultiMC server setup
====================

This is a set of Salt state configs for setting up the server.

You will need a machine with salt, docker and git installed, with grabbing of additional modules from git enabled.

Some private settings have to be added to make this work. Namely, buildbot build slave passwords and S3 access keys.

Look for templates in the private section of the salt pillar.

