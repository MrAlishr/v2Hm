#!/bin/sh
mkdir -p /etc/v2ray/
cat <<EOF >/etc/v2ray/config.json
{
  "log": {
    "loglevel": "warning"
  },
  "inbounds": [{
    "port": 80,
    "protocol": "vmess",
    "settings": {
      "clients": [
        {
          "id": "$UUID",
          "level": 1,
          "alterId": 64
        }
      ]
    },
    "streamSettings": {
      "network": "ws",
      "wsSettings": {
        "path": "$V2PATH"
      }
    }
  }],
  "outbounds": [{
    "protocol": "freedom",
    "settings": {}
  },{
    "protocol": "blackhole",
    "settings": {},
    "tag": "blocked"
  }],
  "routing": {
    "rules": [
      {
        "type": "field",
        "ip": ["geoip:private"],
        "outboundTag": "blocked"
      }
    ]
  }
}
EOF
/usr/bin/v2ray run --config /etc/v2ray/config.json