Thanos sidecar
=========

Setup Thanos sidecar on Prometheus servers

This role will not setup Prometheus, if you want to setup Prometheus, use the Prometheus role

Requirements
------------

Prometheus

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
         - thanos-sidecar

License
-------

BSD

Author Information
------------------

duy.nguyen@shopee.com
