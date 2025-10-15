# Docker role

## Overview
Installs the Docker Engine and Docker Compose on Debian/Ubuntu and
RHEL/CentOS/Fedora hosts. The role configures the official Docker repository,
installs the engine packages, ensures the daemon is running, and optionally
installs Docker Compose. Users can be added to the `docker` group so they can
interact with the daemon without root privileges.

## Requirements
- Ansible 2.10 or newer.
- Supported operating systems: Debian/Ubuntu or RHEL/CentOS/Fedora.
- Internet access to reach the Docker package repositories.

## Role Variables
All defaults are defined in `defaults/main.yml` and can be overridden from the
inventory or playbook as needed.

| Variable | Default | Description |
| --- | --- | --- |
| `docker_edition` | `ce` | Docker edition to install (`ce` or `ee`). |
| `docker_package` | `docker-{{ docker_edition }}` | Package name to install. |
| `docker_package_state` | `present` | State passed to the package module. |
| `docker_service_state` | `started` | Desired Docker service state. |
| `docker_service_enabled` | `true` | Whether Docker starts on boot. |
| `docker_install_compose` | `true` | Controls if Docker Compose should be installed. |
| `docker_compose_version` | `1.24.1` | Docker Compose release downloaded from GitHub. |
| `docker_compose_path` | `/usr/local/bin/docker-compose` | Path where the compose binary is written. |
| `docker_apt_release_channel` | `stable` | Debian/Ubuntu repository channel. |
| `docker_apt_arch` | `amd64` | Architecture for the apt repository. |
| `docker_apt_repository` | `deb [arch={{ docker_apt_arch }}] https://download.docker.com/linux/{{ ansible_distribution\|lower }} {{ ansible_distribution_release }} {{ docker_apt_release_channel }}` | Docker apt repository definition. |
| `docker_apt_ignore_key_error` | `true` | Whether to ignore apt key import errors. |
| `docker_yum_repo_url` | `https://download.docker.com/linux/{{ (ansible_distribution == "Fedora") \| ternary("fedora","centos") }}/docker-{{ docker_edition }}.repo` | Docker yum/dnf repository URL. |
| `docker_yum_repo_enable_edge` | `0` | Enable the edge repository. |
| `docker_yum_repo_enable_test` | `0` | Enable the test repository. |
| `docker_users` | `[]` | Users added to the `docker` group after installation. |

## Dependencies
None.

## Example Playbook
```yaml
- hosts: docker_hosts
  become: true
  vars:
    docker_users:
      - deploy
  roles:
    - role: docker
```

## License
BSD

## Author Information
nduytg@gmail.com
