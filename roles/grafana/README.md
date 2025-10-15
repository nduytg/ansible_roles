# Grafana role

## Overview
Installs the Grafana OSS repository, packages, and service on Debian/Ubuntu
hosts. The role also deploys the customised `grafana.ini` configuration file and
opens the firewall port so dashboards are reachable within the network.

## Requirements
- Ansible 2.10 or newer.
- Debian or Ubuntu hosts with `systemd`.
- Internet access to `packages.grafana.com`.

## Role Variables
This role does not define any overridable defaults. Adjust the template files in
`templates/` (for example `grafana.ini.j2`) if you need to customise Grafana
settings such as authentication or data sources.

## Dependencies
None.

## Example Playbook
```yaml
- hosts: grafana
  become: true
  roles:
    - role: grafana
```

## License
BSD

## Author Information
nduytg@gmail.com
