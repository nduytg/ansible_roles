# Alertmanager role

## Overview
Installs and configures Prometheus Alertmanager as a systemd service. The role
creates the dedicated user, deploys the Alertmanager binaries and configuration
files, and opens the service port in the host firewall so that Prometheus
servers can deliver alert notifications.

## Requirements
- Ansible 2.10 or newer.
- A RHEL/CentOS compatible host with `systemd` and iptables-services.
- Prometheus should already be deployed and configured to point to the
  Alertmanager instance provisioned by this role.

## Role Variables
The role exposes a single variable for managing the Alertmanager release that
is installed. The base default lives in `defaults/main.yml`, while
`vars/main.yml` pins the version used by the sample inventory. Override the
value in your inventory or playbook if you need a different release.

| Variable | Default | Description |
| --- | --- | --- |
| `ALERTMANAGER_VERSION` | `0.17.0` (defaults) / `0.19.0` (vars) | Prometheus Alertmanager version to download and install. |

Alertmanager configuration and notification templates can be customised by
providing alternative versions of `templates/alertmanager.yml.j2` and
`files/notifications.tmpl`.

## Dependencies
None.

## Example Playbook
```yaml
- hosts: monitoring
  become: true
  roles:
    - role: alertmanager
```

## License
BSD

## Author Information
nduytg@gmail.com
