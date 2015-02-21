# Clone the MultiMC buildbot git repo
mmc-bbot-image:
  git.latest:
    - name: https://github.com/MultiMC/MultiMC-Buildbot
    - target: /root/mmc-bbot-git
  docker.built:
    - name: mmc-bbot
    - path: /root/mmc-bbot-git/
    - require:
      - git: mmc-bbot-image


mmc-bbot-data:
  docker.installed:
    - name: mmc-bbot-data
    - image: mmc-bbot
    - volumes:
      - /buildbot
    - require:
      - docker: mmc-bbot-image

mmc-bbot:
  file.managed:
    - name: /etc/systemd/system/mmc-bbot.service
    - source: salt://docker/mmc-bbot/mmc-bbot.service
    - user: root
    - group: root
    - mode: 0644
  service.running:
    - enable: True
    - require:
      - file: mmc-bbot
      - docker: mmc-bbot-data


mmc-bbslave-service:
  file.managed:
    - name: /etc/systemd/system/mmc-bbslave@.service
    - source: salt://docker/mmc-bbot/mmc-bbslave@.service
    - user: root
    - group: root
    - mode: 0644

mmc-env-ubu64:
  file.recurse:
    - name: /root/mmc-env-ubu64
    - source: salt://docker/mmc-bbot/mmc-env-ubu64/
    - clean: true
  docker.built:
    - name: forkk/mmc-env-ubu64
    - path: /root/mmc-env-ubu64/
    - require:
      - file: mmc-env-ubu64

mmc-bbslave-ubu64:
  file.recurse:
    - name: /root/mmc-bbslave-ubu64
    - source: salt://docker/mmc-bbot/mmc-bbslave-ubu64/
    - clean: true
  docker.built:
    - name: forkk/mmc-bbslave-ubu64
    - path: /root/mmc-bbslave-ubu64/
    - require:
      - file: mmc-bbslave-ubu64
  service.running:
    - name: mmc-bbslave@ubu64
    - enable: True
    - require:
      - file: mmc-bbslave-service
      - docker: mmc-bbslave-ubu64


# Slave info files.

# Boto config for Amazon S3 access
/etc/private/mmc-bbot/boto.cfg:
  file.managed:
    - source: salt://docker/mmc-bbot/boto.cfg
    - template: jinja
    - makedirs: true
    - user: root
    - group: root
    - mode: 0600

/etc/private/mmc-bbot/passwords.json:
  file.managed:
    - source: salt://docker/mmc-bbot/passwords.json
    - template: jinja
    - makedirs: true
    - user: root
    - group: root
    - mode: 0600

/etc/private/mmc-bbslave-ubu64/info.json:
  file.managed:
    - source: salt://docker/mmc-bbot/ubu64-info.json
    - template: jinja
    - makedirs: true
    - user: root
    - group: root
    - mode: 0600

/etc/private/mmc-bbslave-ubu32/info.json:
  file.managed:
    - source: salt://docker/mmc-bbot/ubu32-info.json
    - template: jinja
    - makedirs: true
    - user: root
    - group: root
    - mode: 0600
