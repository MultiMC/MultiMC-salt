forkk:
  group.present:
    - gid: 1000
    - system: False
  user.present:
    - fullname: Forkk
    - shell: /bin/fish
    - home: /home/forkk
    - uid: 1000
    - gid: 1000
    - groups:
      - wheel
      - docker
    - require:
      - group: docker-grp

# Forkk's SSH keys.
forkk-sshkey:
  ssh_auth.present:
    - user: forkk
    - source: salt://users/forkk.id_ecdsa.pub
    - require:
      - user: forkk


# Groups
docker-grp:
  group.present:
    - name: docker
    - gid: 142
    - system: True
