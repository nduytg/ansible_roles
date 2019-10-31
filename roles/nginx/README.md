Nginx Role
=========

Setup nginx on physical servers

Requirements
------------

None

Role Variables
--------------

List of variables:
* nginx_version: 1.16.1
* nginx_user: "nginx"
* nginx_group: "nginx"
* nginx_build_dir: "/tmp/nginx"
* nginx_conf_dir: "/etc/nginx"
* nginx_var_dir: "/var/nginx"
* nginx_log_dir: "/var/nginx/logs"
* nginx_http_log_dir: "/var/nginx/logs/http"
* nginx_stream_log_dir: "/var/nginx/logs/stream"
* nginx_bin_path: "/usr/local/bin/nginx"
* nginx_conf_path: "/etc/nginx/nginx.conf"
* nginx_upstream_dir: "/etc/nginx/conf.d"
* nginx_custom_modules: List of add-on modules for Nginx

Dependencies
------------

None

Example Playbook
----------------

    - hosts: servers
      roles:
         - nginx

License
-------

BSD

Author Information
------------------

duy.nguyen@shopee.com
