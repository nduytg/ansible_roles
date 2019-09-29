My Personal Ansible Roles
===============

# How to use

1. List your hosts in **hosts** file
2. Edit roles which you want to install in target.yml
3. Run `ansible-playbook -i hosts targets.yml`

## Check your syntax before running

```bash
ansible-playbook --syntax-check targets.yml
```

## Dry-run mode

```bash
ansible-playbook --check targets.yml
```

## How to use it

```bash
ansible-playbook -i hosts targets.yml
```
