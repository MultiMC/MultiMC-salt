cronie:
  service:
  - running
  - enable: True
  - reload: True
  - watch:
    - pkg: cronie
  pkg:
    - installed       
