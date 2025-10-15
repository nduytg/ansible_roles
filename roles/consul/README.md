# Consul role

## Overview
Deploys HashiCorp Consul in server mode on a single node or as part of a
cluster. The role handles user and directory creation, retrieves the desired
Consul release, manages the configuration file for standalone or clustered
setups, and opens the firewall ports required for gossip, RPC, and HTTP access.

## Requirements
- Ansible 2.10 or newer.
- RHEL/CentOS compatible hosts with `systemd`, iptables-services, and outbound
  internet access to download Consul releases.
- (Optional) A Consul gossip encryption key when running in clustered mode.

## Role Variables
Most role behaviour is controlled through `CONSUL_VERSION` and the
`CONSUL_CLUSTER` toggle. The default value is defined in `defaults/main.yml` and
`vars/main.yml` pins the version used by the sample inventory. When
`CONSUL_CLUSTER` is set to `true`, ensure that the accompanying templates under
`templates/` are updated with the correct cluster membership information.

| Variable | Default | Description |
| --- | --- | --- |
| `CONSUL_VERSION` | `1.5.0` (defaults) / `1.6.1` (vars) | Consul release downloaded from releases.hashicorp.com. |
| `CONSUL_CLUSTER` | `false` | Toggle between standalone (`false`) and clustered (`true`) configuration templates. |

Additional values such as encryption keys and server lists are sourced from the
Jinja templates. Update those templates or provide overrides via the inventory
as needed.

## Dependencies
None.

## Example Playbook
```yaml
- hosts: consul_servers
  become: true
  vars:
    CONSUL_CLUSTER: true
  roles:
    - role: consul
```

## License
BSD

## Author Information
nduytg@gmail.com
