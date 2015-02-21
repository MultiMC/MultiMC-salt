# ========
# nginx.ng
# ========

nginx:
  ng:
    install_from_ppa: False
    
    # These are usually set by grains in map.jinja
    lookup:
      package: nginx
      service: nginx
      webuser: http
      conf_file: /etc/nginx/nginx.conf
      vhost_available: /etc/nginx/sites-available
      vhost_enabled: /etc/nginx/sites-enabled
      vhost_use_symlink: True

    from_source: False

    service:
      enable: True

    server:
      # nginx.conf (main server) declarations
      # dictionaries map to blocks {} and lists cause the same declaration to
      # repeat with different values
      config: 
        worker_processes: 4
        pid: null
        events:
          worker_connections: 768
        http:
          sendfile: 'on'
          include:
            - /etc/nginx/mime.types
            - /etc/nginx/conf.d/*.conf
            - /etc/nginx/sites-enabled/*

    vhosts:
      # vhost declarations
      # vhosts will default to being placed in vhost_available
      managed:
        dummy-site:
          enabled: True
          config:
            - server:
              - server_name: '_'
              - listen:
                - 80
                - default_server
              - root: /var/www/dummy-site/
              - index:
                - index.html
                - index.htm
              - try_files:
                - $uri
                - $uri/
                - /index.html =404
        fnet-site:
          enabled: False
          config:
            - server:
              - server_name: www.forkk.net
              - listen: 80
              - rewrite: ^ http://forkk.net$request_uri redirect
            - server:
              - server_name: forkk.net
              - listen: 80
              - root: /var/www/forkk.net
              - index:
                - index.html
              - location /:
                - try_files:
                  - $uri
                  - $uri/ =404
        mmc-site:
          enabled: False
          config:
            - server:
              - server_name: www.multimc.org
              - listen: 80
              - rewrite: ^ http://multimc.org$request_uri redirect
            - server:
              - server_name: multimc.org
              - listen: 80
              - root: /var/www/multimc.org
              - index:
                - index.html
              - location /:
                - try_files:
                  - $uri
                  - $uri/ =404
