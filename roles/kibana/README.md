# Kibana role

## Overview
Installs Kibana from the official Elastic package repositories, deploys the
primary configuration file, and ensures the service is running. The defaults
provide a single instance listening on all interfaces with anonymous access to a
local Elasticsearch node.

## Requirements
- Ansible 2.10 or newer.
- Debian/Ubuntu or RHEL/CentOS hosts with access to the Elastic repositories
  (adjust the tasks if using a different distribution).
- Elasticsearch reachable at the URL specified by `kibana_elasticsearch_url`.

## Role Variables
Defaults reside in `defaults/main.yml` and can be overridden in your inventory.

| Variable | Default | Description |
| --- | --- | --- |
| `kibana_version` | `7.4.0` | Kibana package version to install. |
| `kibana_package` | `kibana` | Name of the Kibana package. |
| `kibana_package_state` | `present` | State passed to the package module. |
| `kibana_service_state` | `started` | Desired service state. |
| `kibana_service_enabled` | `true` | Start the service on boot. |
| `kibana_config_template` | `kibana.yml.j2` | Template used to render the Kibana config. |
| `kibana_config_file_path` | `/etc/kibana/kibana.yml` | Destination path for the rendered config. |
| `kibana_server_port` | `5601` | HTTP port Kibana listens on. |
| `kibana_server_host` | `0.0.0.0` | Bind address for Kibana. |
| `kibana_elasticsearch_url` | `http://localhost:9200` | URL of the Elasticsearch cluster. |
| `kibana_elasticsearch_username` | `""` | Optional username for Elasticsearch authentication. |
| `kibana_elasticsearch_password` | `""` | Optional password for Elasticsearch authentication. |

## Dependencies
None.

## Example Playbook
```yaml
- hosts: kibana
  become: true
  vars:
    kibana_elasticsearch_url: https://es.internal.example.com:9200
  roles:
    - role: kibana
```

## License
BSD

## Author Information
nduytg@gmail.com
