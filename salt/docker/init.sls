docker:
  pkg.installed: []
  service.running:
    - require:
      - pkg: docker

python2-pip:
  pkg.installed: []

docker-py:
  pip.installed:
    - name: docker-py
    - bin_env: /bin/pip2
    - reload_modules: True
    - require:
      - pkg: python2-pip
