# Pushgateway role

## Overview
Installs the Prometheus Pushgateway binary, configures it as a systemd service,
and opens the firewall so job exporters can push metrics. This role is intended
for environments where ephemeral jobs need to expose Prometheus metrics.

## Requirements
- Ansible 2.10 or newer.
- RHEL/CentOS compatible hosts with `systemd` and iptables-services.

## Role Variables
The role exposes a single variable that controls which Pushgateway release is
downloaded. `defaults/main.yml` provides the baseline value and `vars/main.yml`
pins the version used in the sample inventory.

| Variable | Default | Description |
| --- | --- | --- |
| `PUSHGATEWAY_VERSION` | `0.9.0` (defaults) / `0.9.1` (vars) | Pushgateway release to install. |

## Dependencies
None.

## Example Playbook
```yaml
- hosts: pushgateway
  become: true
  roles:
    - role: pushgateway
```

## License
BSD

## Author Information
nduytg@gmail.com
