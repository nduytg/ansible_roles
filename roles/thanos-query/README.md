# Thanos Query role

## Overview
Installs the Thanos Query component alongside Prometheus, deploys configuration
for the store API peers it should fan out to, and enables the service under
systemd.

## Requirements
- Ansible 2.10 or newer.
- RHEL/CentOS compatible hosts with `systemd`.
- Existing Thanos sidecar or store gateway instances reachable over the network.

## Role Variables
Defaults are defined in `defaults/main.yml`, with sample production overrides in
`vars/main.yml`.

| Variable | Default | Description |
| --- | --- | --- |
| `THANOS_VERSION` | `0.6.0` (defaults) / `0.9.0` (vars) | Thanos release to install. |
| `STORE_LIST` | `['localhost:19090']` (defaults) / see `vars/main.yml` | List of Thanos store API endpoints that Query will connect to. |

Ensure that `STORE_LIST` reflects the sidecar and store gateway endpoints in
your environment.

## Dependencies
None.

## Example Playbook
```yaml
- hosts: thanos_query
  become: true
  vars:
    STORE_LIST:
      - 10.1.2.2:19090
      - 10.1.2.3:19090
  roles:
    - role: thanos-query
```

## License
BSD

## Author Information
nduytg@gmail.com
