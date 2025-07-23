#!/bin/bash

config(){
	cat
}<<EOF
node.ec2.ashwink.com.np {
	reverse_proxy localhost:3000
}

EOF

apt update
apt install -y node caddy

sudo -Hu ubuntu bash <<EOF
cd
git clone "https://github.com/cheseo/node-hello";
printf '%s\n' '#!/bin/bash' 'cd ~/node-hello' 'git pull' 'pkill node' 'node app.js' > update
chmod +x update
EOF

config > /etc/caddy/Caddyfile

reboot
