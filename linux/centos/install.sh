#! /bin/bash

yum install -y net-tools
yum install -y git
yum install -y vim
yum install -y tmux

# config vim
mkdir -p ~/workspace && cd ~/workspace
git clone https://github.com/spxcds/config && cd config && ./install


# pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py

# shadowsocks
pip install shadowsocks

# supervisor
yum install -y python-setuptools
easy_install supervisor

# config supervisor
echo_supervisord_conf > /etc/supervisord.conf

mkdir /etc/supervisord.d

echo "[include]
files = /etc/supervisord.d/*.conf
" >> /etc/supervisord.conf

echo "[program:shadowsocks_server]
user=root
command=ssserver -p port -k password -m rc4-md5 --user root start
process_name=%(program_name)s
stopasgroup=true
priority=999
autostart=true
autorestart=true
redirect_stderr=true" > /etc/supervisord.d/shadowsocks_server.conf

supervisord -c /etc/supervisord.conf
