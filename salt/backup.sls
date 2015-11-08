/root/scripts/backup.sh:
  cron.present:
    - user: root
    - minute: random
    - hour: 2
