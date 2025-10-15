# vsftpd role

## Overview
Installs and configures the Very Secure FTP Daemon (vsftpd) on Ubuntu hosts.
The role enables passive mode with a configurable port range, creates the FTP
user, and deploys the associated configuration files and firewall rules.

## Requirements
- Ansible 2.10 or newer.
- Ubuntu hosts with `systemd` and iptables-services available.

## Role Variables
Defaults are provided in `vars/main.yml` to demonstrate a working configuration.
Override these values in your inventory before running the role in production.

| Variable | Default | Description |
| --- | --- | --- |
| `FTP_USER` | `ftpuser` | Username created for FTP access. |
| `FTP_PASSWORD` | `password` | Password assigned to the FTP user. |
| `PASV_MIN_PORT` | `10100` | Lower bound of the passive FTP port range. |
| `PASV_MAX_PORT` | `10150` | Upper bound of the passive FTP port range. |

## Dependencies
None.

## Example Playbook
```yaml
- hosts: ftp_servers
  become: true
  vars:
    PASV_MIN_PORT: 40100
    PASV_MAX_PORT: 40150
  roles:
    - role: vsftpd
```

## License
BSD

## Author Information
nduytg@gmail.com
