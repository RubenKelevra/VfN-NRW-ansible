-- Site Conf for xyz
-- Ansible generated
{
  -- Used for generated hostnames, e.g. freifunk-abcdef123456. (optional)
  hostname_prefix = '{{ hostname_prefix }}',

  -- Name of the community.
  site_name = '{{ site_name }}',

  -- Shorthand of the community.
  site_code = '{{ site_code }}',

  -- Prefixes used within the mesh. Both are required.
  prefix4 = '{{ item.value.subnet4 }}',
  {% if item.value.subnet6 %}
  prefix6 = '{{ item.value.subnet6 }}',
  {% else %}
  prefix6 = 'fddf:ebfd:a801:{{ item.value.areacode }}::/64',
  {% endif %}

  -- Timezone of your community.
  -- See http://wiki.openwrt.org/doc/uci/system#time_zones
  timezone = '{{ timezone }}',

  -- List of NTP servers in your community.
  -- Must be reachable using IPv6!
  ntp_servers = {'1.ntp.services.ffxx'},

  -- Wireless regulatory domain of your community.
  regdom = '{{ regdom }}',

  -- Wireless configuration for 2.4 GHz interfaces.
  wifi24 = {
    -- Wireless channel.
    channel = {{ channel }},

    -- Specifies the channel width in 802.11n and 802.11ac mode.
    -- Possible values are:
    -- HT20 (single 20MHz channel),
    -- HT40- (2x 20MHz channels, secondary below)
    -- HT40+ (2x 20MHz channels, secondary above)
    htmode = '{{ htmode }}',

    -- ESSID used for client network.
    ap = {
      ssid = '{{ ssid }}',
      -- disabled = true, (optional)
    },

    mesh = {
      -- Adjust these values!
      id = '{{ mesh_essid }}',
      mcast_rate = {{ mesh_mcast_rate }},
      -- disabled = true, (optional)
    },
  },

  -- Wireless configuration for 5 GHz interfaces.
  -- This should be equal to the 2.4 GHz variant, except
  -- for channel and htmode.
  wifi5 = {
    channel = {{ channel5 }},
    htmode = '{{ htmode5 }}',
    ap = {
      ssid = '{{ ssid5 }}',
    },
    mesh = {
      id = '{{ mesh5_essid }}',
      mcast_rate = {{ mesh5_mcast_rate }},
    },
  },

  -- The next node feature allows clients to always reach the node it is
  -- connected to using a known IP address.
  next_node = {
    -- anycast IPs of all nodes
    ip4 = '{{ next_node_ip4 }}',
    ip6 = '{{ next_node_ip6 }}',

    -- anycast MAC of all nodes
    mac = '{{ next_node_mac }}',
  },

  -- Refer to http://fastd.readthedocs.org/en/latest/ to better understand
  -- what these options do.
  fastd_mesh_vpn = {
    -- List of crypto-methods to use.
    methods = {'salsa2012+umac'},
    -- enabled = true,
    -- configurable = true,

    mtu = {{ fastd_mtu }},
    groups = {
      backbone = {
        -- Limit number of connected peers to reduce bandwidth.
        limit = 2,

        -- List of peers.
        peers = {
          peer1 = {
            key = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',

            -- This is a list, so you might add multiple entries.
            remotes = {'ipv4 "xxx.somehost.invalid" port xxxxxx'},
          },
          peer2 = {
            key = 'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
            -- You can also omit the ipv4 to allow both connection via ipv4 and ipv6
            remotes = {'"xxx.somehost2.invalid" port xxxxx'},
          },
        },

        -- Optional: nested peer groups
        -- groups = {
        --   backbone_sub = {
        --     ...
        --   },
        --   ...
        -- },
      },
      -- Optional: additional peer groups, possibly with other limits
      -- backbone2 = {
      --   ...
      -- },
    },
  },

  autoupdater = {
    -- Default branch. Don't forget to set GLUON_BRANCH when building!
    branch = 'stable',

    -- List of branches. You may define multiple branches.
    branches = {
      stable = {
        name = 'stable',

        -- List of mirrors to fetch images from. IPv6 required!
        mirrors = {'http://1.updates.services.ffhl/stable/sysupgrade'},

        -- Number of good signatures required.
        -- Have multiple maintainers sign your build and only
        -- accept it when a sufficient number of them have
        -- signed it.
        good_signatures = 2,

        -- List of public keys of maintainers.
        pubkeys = {
                'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', -- Alice
                'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', -- Bob
                'xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx', -- Mary
        },
      },
    },
  },

  -- Node roles
  -- roles = {
  --   default = 'node',
  --   list = {
  --     'node',
  --     'test',
  --     'backbone',
  --     'service',
  --   },
  -- },

  -- Bandwidth limiting
  simple_tc = {
    mesh_vpn = {
      ifname = 'mesh-vpn',

      -- You may enable it by default here.
      enabled = false,

      -- Default upload limit (kbit/s).
      limit_egress = 200,

      -- Default download limit (kbit/s).
      limit_ingress = 3000,
    },
  },

  -- Skip setup mode (config mode) on first boot
  -- setup_mode = {
  --  skip = true,
  -- },
}