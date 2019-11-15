My Personal Ansible Roles
===============

# How to use

1. List your hosts in **hosts** file
2. Edit roles which you want to install in target.yml
3. Run `ansible-playbook -i hosts targets.yml`

## 1/ Check your syntax before running

```bash
ansible-playbook --syntax-check targets.yml
```

## 2/ Dry-run mode

```bash
ansible-playbook --check targets.yml
```

## 3/ Run it

```bash
ansible-playbook -i hosts targets.yml
```

# Information

Supported Roles

- Prometheus Stack
  - [x] Prometheus
  - [x] AlertManager
  - [x] Pushgateway
  - [x] Grafana
  - [x] Thanos (Query)
  - [x] Thanos (Sidecar)
  - [x] Prometheus Exporters
    - [x] ElasitcSearch Exporter
    - [x] ElasitcSearch Exporter (Docker)
- [ ] Proxy/LB
  - [x] Nginx
  - [ ] NginxMonitor
    - [ ] VTS Module
    - [ ] Nginx Exporters
      - [ ] 1..
      - [ ] 2..
- [ ] High Availability
  - [x] keepalived
- [x] Service Discovery
  - [x] Consul
- [ ] ELK Stack
  - [x] ElasticSearch
  - [x] LogStack
  - [x] Kibana
  - [ ] Filebeat
  - [ ] MetricBeat
- [x] Misc
  - [x] MySQL
  - [x] Docker

Suported OS

- [x] Ubuntu
- [ ] Centos
- [ ] Debian
