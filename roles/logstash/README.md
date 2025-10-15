# Logstash role

## Overview
Installs Logstash from the Elastic package repositories, configures Beats input
and Elasticsearch output pipelines, deploys optional local syslog ingestion, and
ensures the service is enabled. The role can also install additional Logstash
plugins defined in `logstash_install_plugins`.

## Requirements
- Ansible 2.10 or newer.
- Debian/Ubuntu or RHEL/CentOS hosts with access to the Elastic repositories.
- Elasticsearch must be reachable at the addresses defined in
  `logstash_elasticsearch_hosts`.

## Role Variables
Defaults live in `defaults/main.yml`.

| Variable | Default | Description |
| --- | --- | --- |
| `logstash_version` | `7.4.0` | Logstash package version to install. |
| `logstash_listen_port_beats` | `5044` | Port for Beats input. |
| `logstash_elasticsearch_hosts` | `["http://localhost:9200"]` | Elasticsearch hosts for output. |
| `logstash_local_syslog_path` | `/var/log/syslog` | Path to the local syslog file when monitoring local logs. |
| `logstash_monitor_local_syslog` | `true` | Toggle ingestion of the local syslog file. |
| `logstash_dir` | `/usr/share/logstash` | Base Logstash installation directory. |
| `logstash_ssl_dir` | `/etc/pki/logstash` | Directory that stores SSL materials. |
| `logstash_ssl_certificate_file` | `""` | Path to the SSL certificate presented to Beats clients. |
| `logstash_ssl_key_file` | `""` | Path to the SSL private key. |
| `logstash_enabled_on_boot` | `true` | Enable Logstash on boot. |
| `logstash_install_plugins` | `['logstash-input-beats']` | List of plugins to install via `bin/logstash-plugin`. |

Extend the templates and files within the role to configure your own pipelines,
filters, and certificate handling.

## Dependencies
None.

## Example Playbook
```yaml
- hosts: logstash
  become: true
  vars:
    logstash_elasticsearch_hosts:
      - https://es01.example.com:9200
      - https://es02.example.com:9200
  roles:
    - role: logstash
```

## License
BSD

## Author Information
nduytg@gmail.com
