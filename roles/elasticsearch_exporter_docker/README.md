Elastic Search Exporter on Docker
=========

This role is used for installing elastic search exporter on Docker

Requirements
------------

Have to be installed on Docker

Role Variables
--------------

Variables:

* EXPORTER_VERSION: "1.1.0"
* HOST_PORT: "9116"
* LISTEN_PORT: "9114"
* ES_IP: "10.0.0.5
* ES_PORT: "30200"
* PROJECT_NAME: "monitor3"
* CONTAINER_NAME: "{{ES_IP}}_{{ES_PORT}}64646"
* LISTEN_URI: "{{LISTEN_IP}}:{{LISTEN_PORT}}"
* ES_URI: "http://{{ES_IP}}:{{ES_PORT}}"
* LISTEN_IP: "0.0.0.0"
* ES_TIMEOUT: "120s"

Dependencies
------------

None

Example Playbook
----------------

Edit in target.yml

    - hosts: someGroups
      roles:
         - elasticsearch_exporter_docker

License
-------

BSD

Author Information
------------------

nduytg@gmail.com
