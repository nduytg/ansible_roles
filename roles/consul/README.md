Consul
=========

Setup single node of Consul service

Requirements
------------

Don't have any requirements

Role Variables
--------------

Variables: 
* **CONSUL_VERSION**: 1.6.1
* **CONSUL_CLUSTER**: false/true

Generate consul keygen for cluster

```bash
consul keygen
pUqJrVyVRj5jsiYEkM/tFQYfWyJIv4s3XkvDwy7Cu5s=
```

Dependencies
------------

None

Example Playbook
----------------

Edit in target.yml

    - hosts: someGroups
      roles:
         - consul
      vars:
        CONSUL_CLUSTER: false

License
-------

BSD

Author Information
------------------

nduytg@gmail.com
