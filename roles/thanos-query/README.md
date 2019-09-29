Thanos Query
=========

Setup Thanos Query on Prometheus servers

This role will not setup Prometheus nor Thanos Sidecar, if you want to setup Prometheus, use the Prometheus role

Requirements
------------

* Prometheus
* Thanos Sidecar

Role Variables
--------------

Variables for this role:

* **THANOS_VERSION**: "0.6.1"

Dependencies
------------

None

Example Playbook
----------------

Edit in target.yml

    - hosts: someGroups
      roles:
         - thanos-query

License
-------

BSD

Author Information
------------------

nduytg@gmail.com
