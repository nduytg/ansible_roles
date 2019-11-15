ElasticSearch
=========

Setup single node of ElasticSearch service

Requirements
------------

Don't have any requirements

Role Variables
--------------

Only have one variable: **es_version**, can install version 6.x.x and 7.x.x

Dependencies
------------

None

Example Playbook
----------------

Edit in target.yml

    - hosts: someGroups
      roles:
         - elasticsearch

License
-------

BSD

Author Information
------------------

nduytg@gmail.com
