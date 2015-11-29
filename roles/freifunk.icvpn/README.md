Freifunk IC-VPN
===============

A role to connect a server to the Freifunk Intercity VPN.
You find all information at the [Freifunk Wiki](http://wiki.freifunk.net/IC-VPN).

Requirements
------------

You need a Freifunk Gateway that should be connected to the Intercity VPN.

Role Variables
--------------
Default variables:
```
icvpn_meta_path    = '/var/lib/freifunk'
icvpn_scripts_path = '/opt/icvpn-scripts'

icvpn_kernel_table = 202
```

Group variables:
```
icvpn_hostname  = 'koeln1'
icvpn_ownas     = 65528
icvpn_community = 'kbu'
```

Host variables:
```
icvpn_ipv4_addr = 10.207.0.57
icvpn_ipv6_addr = fec0::a:cf:0:57
router_id       = 10.207.0.57
icvpn_ipv4_net  = 172.26.0.0/15
icvpn_ipv6_net  = fdd3:5d16:b5dd::/48
```

see also defaults/main.yml

Example Playbook
----------------

    - hosts: supernodes
      roles:
         - freifunk.icvpn

License
-------

BSD
