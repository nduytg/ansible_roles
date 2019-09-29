Alert Manager
=========

Setup Alert Manager service

Requirements
------------

Need to have Prometheus server. Should be used as a combo with Prometheus role

Role Variables
--------------

Only have one variable: **ALERTMANAGER_VERSION**

Dependencies
------------

None

Example Playbook
----------------

Edit in target.yml

    - hosts: someGroups
      roles:
         - alertmanager

License
-------

BSD

Author Information
------------------

duy.nguyen@shopee.com
