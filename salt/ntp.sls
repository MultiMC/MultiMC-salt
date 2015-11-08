ntp:
  service:
    - name: ntpd
    - running
    - enable: True
    - reload: True
    - watch:
      - pkg: ntp
  pkg:
    - installed

