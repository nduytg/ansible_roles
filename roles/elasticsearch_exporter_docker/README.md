# Elasticsearch exporter (Docker) role

## Overview
Runs the Prometheus Elasticsearch exporter inside a Docker container. The role
creates the container with the desired image tag, exposes the metrics port, and
configures the target Elasticsearch endpoint that should be scraped.

## Requirements
- Ansible 2.10 or newer.
- Docker Engine installed on the target host (for example via the accompanying
  `docker` role).
- Connectivity from the container host to the Elasticsearch cluster.

## Role Variables
All defaults are defined in `defaults/main.yml`.

| Variable | Default | Description |
| --- | --- | --- |
| `EXPORTER_VERSION` | `1.1.0` | Elasticsearch exporter container tag. |
| `HOST_PORT` | `9116` | Host port that exposes the exporter metrics endpoint. |
| `LISTEN_PORT` | `9114` | Container port used by the exporter process. |
| `LISTEN_IP` | `0.0.0.0` | Interface inside the container to bind. |
| `LISTEN_URI` | `{{ LISTEN_IP }}:{{ LISTEN_PORT }}` | Computed listen URI passed to the container. |
| `ES_IP` | `10.0.0.5` | Elasticsearch host address. |
| `ES_PORT` | `30200` | Elasticsearch HTTP port. |
| `ES_URI` | `http://{{ ES_IP }}:{{ ES_PORT }}` | Full Elasticsearch endpoint used by the exporter. |
| `ES_TIMEOUT` | `120s` | Timeout for Elasticsearch requests. |
| `PROJECT_NAME` | `monitor3` | Docker Compose project name used for container naming. |
| `CONTAINER_NAME` | `{{ ES_IP }}_{{ ES_PORT }}64646` | Container name allocated to the exporter instance. |

Adjust these values to point at your own Elasticsearch deployment or supply
custom container labels and naming.

## Dependencies
None.

## Example Playbook
```yaml
- hosts: monitoring
  become: true
  roles:
    - role: docker
    - role: elasticsearch_exporter_docker
      vars:
        ES_IP: 10.20.30.40
        ES_PORT: 9200
```

## License
BSD

## Author Information
nduytg@gmail.com
