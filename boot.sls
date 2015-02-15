# Bootstrap state. Installs packages that we need to use our Salt states.

python2-pip:
  pkg.installed: []

docker-py:
  pip.installed:
    - name: docker-py >= 0.5.0, < 0.6.0
    - bin_env: /bin/pip2
    - require:
      - pkg: python2-pip