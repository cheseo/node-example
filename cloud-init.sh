#!/bin/bash

config(){
	cat
}<<EOF
node.ec2.ashwink.com.np {
	reverse_proxy localhost:3000
}
EOF

apt update
apt install -y nodejs caddy

sudo -Hu ubuntu bash <<EOF
cd
git clone "https://github.com/cheseo/node-example";
printf '%s\n' '#!/bin/bash' 'cd ~/node-hello' 'git pull' 'pkill node' 'node app.js' > update
chmod +x update
EOF

config > /etc/caddy/Caddyfile

reboot
