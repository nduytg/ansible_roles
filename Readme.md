# Personal Ansible Roles

This repository contains a collection of reusable roles that I use to bootstrap monitoring, observability, and supporting services in my lab environments. The content has been refreshed to follow the [Ansible 2.10+ best practices](https://docs.ansible.com/ansible/latest/user_guide/playbooks_best_practices.html), including modern task syntax, the new `group_vars` layout, and explicit use of the `ansible.builtin` collection.

## Repository Layout

```text
ansible_roles/
├── group_vars/          # Group specific variable files (e.g. staging/)
├── hosts                # Example inventory file
├── roles/               # Individual roles for services such as Prometheus, Nginx, etc.
├── target.yml           # Example playbook that wires the roles together
└── Readme.md            # This document
```

Each role follows the standard Ansible role structure (`defaults`, `tasks`, `templates`, and so on). The `target.yml` playbook now declares the `ansible.builtin` collection and uses modern task syntax so it is ready to run with Ansible 2.10 or newer.

## Getting Started

1. **Install dependencies**
   * Python 3.9+
   * Ansible 2.10 or newer (`pip install ansible`)

2. **Inventory**
   * Update the `hosts` file with your infrastructure details.
   * Place per-environment variables in `group_vars/<group>/`.

3. **Select roles**
   * Enable the roles you want in `target.yml` by uncommenting them under the `roles` section.

4. **Run the playbook**
   ```bash
   ansible-playbook -i hosts target.yml
   ```

## Recommended Workflow

| Step | Command | Purpose |
| --- | --- | --- |
| 1 | `ansible-playbook --syntax-check target.yml` | Validate the playbook parses correctly. |
| 2 | `ansible-playbook --check -i hosts target.yml` | Perform a dry run without applying changes. |
| 3 | `ansible-playbook -i hosts target.yml` | Apply the roles to the selected hosts. |

## Available Roles

The repository currently includes roles for:

- **Prometheus Stack**: Prometheus, Alertmanager, Pushgateway, Thanos (query & sidecar), and Elasticsearch exporters (VM and Docker).
- **Proxy / Load Balancing**: Nginx with monitoring extensions.
- **High Availability**: Keepalived.
- **Service Discovery**: Consul (stand-alone or clustered).
- **Elastic Stack**: Elasticsearch, Logstash, Kibana.
- **Miscellaneous**: MySQL, Docker, VSFTPD, and more.

Refer to each role's `README.md` (where provided) for configuration specifics.

## Contributing Improvements

* Use `ansible-lint` or `yamllint` when modifying roles to maintain consistency.
* Ensure new tasks use `loop`/`include_tasks` and Fully Qualified Collection Names (FQCNs) where appropriate.
* Document any new variables or dependencies in the relevant role README.

## Supported Platforms

- ✅ Ubuntu (primary test target)
- ⚠️ CentOS / Debian (not fully validated yet, contributions welcome!)

Feel free to open issues or pull requests with suggestions, fixes, or additional roles.
