# this is a workaround for this bug: https://github.com/saltstack/salt/issues/18955
systemctl restart salt-master.service:
  cron.present:
    - user: root
    - minute: random
    - hour: 3

