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
        mmc-ci:
          enabled: True
          config:
            - server:
              - server_name: ci.multimc.org
              - listen: 80
              - location /:
                - proxy_pass: http://localhost:8010
                - proxy_set_header: Host $host
                - proxy_set_header: X-Real-IP $remote_addr
                - proxy_set_header: X-Forwarded-for $remote_addr

        mmc-translate:
          enabled: True
          config:
            - server:
              - server_name: translate.multimc.org
              - listen: 80
              - location /:
                - proxy_pass: http://localhost:8000
                - proxy_set_header: Host $host
                - proxy_set_header: X-Real-IP $remote_addr
        mcarch-ipfs:
          enabled: True
          config:
            - server:
              - server_name: test-ipfs.mcarchive.net
              - listen: 80
              - location /:
                - proxy_pass: http://localhost:5000
                - proxy_set_header: Host $host
                - proxy_set_header: X-Real-IP $remote_addr
                - proxy_set_header: X-Forwarded-for $remote_addr

