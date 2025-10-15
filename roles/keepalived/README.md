# Keepalived role

## Overview
Builds and configures Keepalived from source to provide VRRP based virtual IP
failover across a fleet of Linux hosts. The role compiles the requested
Keepalived version, renders configuration files based on the VIP definitions in
`vars/main.yml`, deploys tracking scripts, and ensures the service is managed by
systemd.

## Requirements
- Ansible 2.10 or newer.
- RHEL/CentOS compatible hosts with build tooling (gcc, make) available.
- Shared network segments for the VIPs defined in the inventory.

## Role Variables
The defaults in `defaults/main.yml` define installation paths and the
Keepalived version. Detailed VIP and script settings are captured in
`vars/main.yml`; update them to mirror your environment before running the role.

| Variable | Default | Description |
| --- | --- | --- |
| `keepalived_version` | `2.0.19` | Keepalived version compiled from source. |
| `keepalived_build_dir` | `/tmp/keepalived` | Working directory for compiling Keepalived. |
| `keepalived_conf_dir` | `/etc/keepalived` | Destination directory for configuration files. |
| `keepalived_sbin_dir` | `/usr/local/sbin` | Directory where the Keepalived binary is installed. |
| `track_scripts` | see `vars/main.yml` | Scripts Keepalived will execute for health checks. |
| `VIPs` | see `vars/main.yml` | Definition of VRRP instances, priorities, and owners. |

Adjust `track_scripts` and `VIPs` to reflect your hosts and desired VRRP
configuration, including interface names, virtual router IDs, and priority
weights.

## Dependencies
None.

## Example Playbook
```yaml
- hosts: keepalived_nodes
  become: true
  roles:
    - role: keepalived
```

## License
BSD

## Author Information
nduytg@gmail.com
