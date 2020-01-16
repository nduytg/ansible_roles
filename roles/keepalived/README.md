Ansible Keepalived
=========

I have looked around at available keepalived roles on Github but none meet my expectation, so I create my own role here.

`Priority`, `Weight` will be automatically caculated based on `number of nodes, VIPs` and `internal_priority` settings. You only need to change all your variables in `vars/main.yml`. Try it and have fun^^.

PRs are welcomed

Requirements
------------

None

Role Variables
--------------

Change your variables at `vars`

Change the host group `groups` name in `vars/main.yml`

Example config:

```yaml
keepalived_version: 2.0.19

keepalived_build_dir: "/tmp/keepalived"
keepalived_conf_dir: "/etc/keepalived"
keepalived_sbin_dir: "/usr/local/sbin"

track_scripts:
  check_thanos:
    script: "/etc/keepalived/check_thanos.sh"
    interval: 1
    rise: 1
    fall: 1

VIPs:
  VIP_1:
    VIP: 10.0.0.98
    virtual_router_id: 11
    master: 10.0.0.81
    vip_group: ["10.0.0.81", "10.0.0.82", "10.0.0.83"]
    interface: bond0.1000
    internal_priority:
      "10.0.0.81": 1
      "10.0.0.82": 2
      "10.0.0.83": 3
    track_script: [check_thanos]

  VIP_2:
    VIP: 10.0.0.99
    virtual_router_id: 22
    master: 10.0.0.82
    vip_group: ["10.0.0.81", "10.0.0.82", "10.0.0.83"]
    interface: bond0.1000
    internal_priority:
      "10.0.0.81": 2
      "10.0.0.82": 3
      "10.0.0.83": 1
    track_script: [check_thanos]
  
  # Can add as many VIPs/nodes as you want
  VIP_3:
    VIP: 10.0.0.100
    virtual_router_id: 33
    master: 10.0.0.83
    vip_group: ["10.0.0.81", "10.0.0.82", "10.0.0.83"]
    interface: bond0.1000
    internal_priority:
      "10.0.0.81": 3
      "10.0.0.82": 1
      "10.0.0.83": 2
    track_script: [check_thanos]
```

Dependencies
------------

None

Example Playbook
----------------

    - hosts: yourGroup1
        roles:
            - keepalived

License
-------

BSD

Author Information
------------------

nduytg@gmail.com
