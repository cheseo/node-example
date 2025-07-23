#!/bin/bash

config(){
	cat
}<<EOF
node.ec2.ashwink.com.np {
	reverse_proxy localhost:3000
}
EOF

user_service(){
	cat
}<<EOF
[Unit]
Description=My node app
After=network.target

[Service]
WorkingDirectory=%h/node-example
ExecStart=node app.js
Restart=always
RestartSec=5

[Install]
WantedBy=default.target
EOF

user_service > /etc/systemd/user/node.service

apt update
apt install -y nodejs caddy

config > /etc/caddy/Caddyfile

sudo -Hu ubuntu bash <<EOF
cd
git clone "https://github.com/cheseo/node-example";
systemctl --user enable --now node.service
loginctl enable-linger
EOF


reboot
