# Sets up HTML files for a dummy site to serve as the default nginx vhost.

/var/www/dummy-site/index.html:
  file.managed:
    - source: salt://nginx/dummy-page.html
    - makedirs: true
    - user: http
    - group: http
    - mode: 0644
