#!/bin/bash

set -e

cd /home/buercorp

wget --no-check-certificate https://registry.npmmirror.com/-/binary/node/latest-v18.x/node-v18.12.1-linux-x64.tar.gz
mv node-v18.12.1-linux-x64.tar.gz apps/node-v18.12.1.tar.gz
tar xvf node-v18.12.1.tar.gz
rm node-v18.12.1.tar.gz

ln -sf node-v18.12.1 node
# echo "export PATH=$PATH:/home/lu-jiewei/apps/node/bin" >> /etc/profile
# source /etc/profile

echo "node.js安装成功"
