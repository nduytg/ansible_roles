# Thanos Sidecar role

## Overview
Installs the Thanos sidecar binary next to Prometheus, configures the systemd
service, and exposes the gRPC/HTTP ports used by Thanos Query. The role assumes
Prometheus is already deployed and exporting data locally.

## Requirements
- Ansible 2.10 or newer.
- RHEL/CentOS compatible hosts with `systemd`.
- A running Prometheus instance whose data directory will be read by the sidecar.

## Role Variables
Defaults live in `defaults/main.yml` with example overrides in `vars/main.yml`.

| Variable | Default | Description |
| --- | --- | --- |
| `THANOS_VERSION` | `0.6.0` (defaults) / `0.8.1` (vars) | Thanos release installed on the host. |

Adjust the templates to reference your object storage credentials and Prometheus
data directory if they differ from the defaults.

## Dependencies
None.

## Example Playbook
```yaml
- hosts: prometheus
  become: true
  roles:
    - role: prometheus
    - role: thanos-sidecar
```

## License
BSD

## Author Information
nduytg@gmail.com
