Prometheus
=========

Setup Prometheus service, should be setup together with Alertmanager in stand alone mode

Requirements
------------

None

Role Variables
--------------

3 variables for this role:

* PROMETHEUS_VERSION: {{ version }}
* RETENTION_TIME: "90d"
* CONSUL_SERVER: {{ server_ip }}
* ALERTMANAGER_SERVER: {{ server_ip }}
* THANOS_TEAM: "cloudcraft-devops"
* THANOS_ENV: {{ env }}
* THANOS_REPLICA_TAG: {{ tag_for_deduplication }}

Dependencies
------------

None

Example Playbook
----------------

Edit in target.yml

    - hosts: someGroups
      roles:
         - prometheus

License
-------

BSD

Author Information
------------------

nduytg@gmail.com
