# Elasticsearch role

## Overview
Installs Elasticsearch from the official Elastic package repositories and
configures the service to run under systemd. The role is currently tailored for
single-node deployments but the templates can be adapted for clustered
installations as required.

## Requirements
- Ansible 2.10 or newer.
- RHEL/CentOS compatible hosts with internet access to the Elastic RPM
  repository.
- Java 8 or newer must be available on the managed hosts.

## Role Variables
The effective Elasticsearch version is determined by values in both
`defaults/main.yml` and `vars/main.yml`. Override the variable in your
inventory or playbook if you need a different release.

| Variable | Default | Description |
| --- | --- | --- |
| `es_version` | `6.7.2` (defaults) / `7.4.0` (vars) | Elasticsearch version to install. |

Additional settings such as cluster name, node roles, and JVM options are
managed through the templates in the role and should be customised to match your
environment.

## Dependencies
None.

## Example Playbook
```yaml
- hosts: elasticsearch
  become: true
  roles:
    - role: elasticsearch
```

## License
BSD

## Author Information
nduytg@gmail.com
