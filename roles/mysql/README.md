# MySQL role

## Overview
Installs the distribution MySQL server packages on Debian and Ubuntu hosts,
starts the service, and opens the firewall so the instance can be reached from
your internal network.

## Requirements
- Ansible 2.10 or newer.
- Debian or Ubuntu hosts with access to the distribution repositories.
- iptables-services installed when persisting firewall rules via
  `/etc/sysconfig/iptables`.

## Role Variables
This role does not define any defaults. Use group or host variables if you need
to adjust package names, firewall networks, or service options.

## Dependencies
None.

## Example Playbook
```yaml
- hosts: mysql
  become: true
  roles:
    - role: mysql
```

## License
BSD

## Author Information
nduytg@gmail.com
