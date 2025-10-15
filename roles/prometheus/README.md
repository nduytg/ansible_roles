# Prometheus role

## Overview
Installs the Prometheus server, configures its service unit, deploys the
configuration files, and opens firewall access so metrics can be scraped. The
role is designed to work alongside the Alertmanager, Thanos sidecar, and Thanos
query roles in this repository.

## Requirements
- Ansible 2.10 or newer.
- RHEL/CentOS compatible hosts with `systemd` and iptables-services.
- Sufficient storage for the configured retention period.

## Role Variables
Defaults reside in `defaults/main.yml`, while `vars/main.yml` shows sample values
for a production deployment. Override these variables in your inventory to suit
your topology.

| Variable | Default | Description |
| --- | --- | --- |
| `PROMETHEUS_VERSION` | `2.10.0` (defaults) / `2.12.0` (vars) | Prometheus release to download. |
| `RETENTION_TIME` | `21d` (defaults) / `90d` (vars) | Data retention window for TSDB blocks. |
| `CONSUL_SERVER` | `localhost` (defaults) / `10.0.0.18` (vars) | Consul server that supplies service discovery data. |
| `ALERTMANAGER_SERVER` | `localhost` (defaults) / `10.0.0.180` (vars) | Address of the Alertmanager instance. |
| `THANOS_TEAM` | `cloudcraft-devops` | Metadata label applied to Prometheus for Thanos deduplication. |
| `THANOS_ENV` | `TEST` (defaults) / `live` (vars) | Environment label sent to Thanos. |
| `THANOS_REPLICA_TAG` | `Z` (defaults) / `C` (vars) | Replica label used when running multiple Prometheus instances. |

Update the templates in `templates/` to declare scrape jobs, alerting rules, and
Thanos integration that match your environment.

## Dependencies
None.

## Example Playbook
```yaml
- hosts: prometheus
  become: true
  roles:
    - role: prometheus
```

## License
BSD

## Author Information
nduytg@gmail.com
