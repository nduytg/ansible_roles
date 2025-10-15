# Nginx role

## Overview
Compiles and installs the Nginx web server from source with a curated set of
modules, lays out configuration directories, and deploys service units. The role
is intended for scenarios where a specific Nginx version or build flags are
required beyond what distribution packages provide.

## Requirements
- Ansible 2.10 or newer.
- RHEL/CentOS compatible hosts with compiler toolchains installed.
- Internet access to download the Nginx source tarball and optional modules.

## Role Variables
Defaults can be overridden via inventory as needed. Refer to
`defaults/main.yml` for the authoritative list.

| Variable | Default | Description |
| --- | --- | --- |
| `nginx_version` | `1.16.1` | Nginx source version to compile. |
| `nginx_user` | `nginx` | User account running the nginx process. |
| `nginx_group` | `nginx` | Group owning the nginx process. |
| `nginx_build_dir` | `/tmp/nginx` | Working directory used during compilation. |
| `nginx_conf_dir` | `/etc/nginx` | Directory for configuration files. |
| `nginx_var_dir` | `/var/nginx` | Base directory for runtime data. |
| `nginx_log_dir` | `/var/nginx/logs` | Base logging directory. |
| `nginx_http_log_dir` | `/var/nginx/logs/http` | Directory for HTTP access logs. |
| `nginx_stream_log_dir` | `/var/nginx/logs/stream` | Directory for stream access logs. |
| `nginx_bin_path` | `/usr/local/bin/nginx` | Path to the compiled nginx binary. |
| `nginx_conf_path` | `/etc/nginx/nginx.conf` | Location of the main nginx configuration file. |
| `nginx_upstream_dir` | `/etc/nginx/conf.d` | Directory for upstream/server snippets. |
| `nginx_custom_modules` | see defaults | Extra `./configure` flags appended when building nginx. |
| `nginx_modules` | `{ geoip: false }` | Toggle installation of optional modules. |

Update the templates under `templates/` to match your site configuration,
upstreams, and TLS settings.

## Dependencies
None.

## Example Playbook
```yaml
- hosts: web
  become: true
  vars:
    nginx_version: 1.21.6
  roles:
    - role: nginx
```

## License
BSD

## Author Information
nduytg@gmail.com
