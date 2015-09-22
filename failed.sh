#########################################################################
# File Name: failed.sh
# Author: apt-getyou
# mail: 792122911@qq.com
# Created Time: 2013年11月13日 星期三 17时14分05秒
#########################################################################
#!/bin/bash
sudo rm -rf /var/lib/apt/lists/*
sudo rm -rf /var/lib/apt/lists/partial/*
sudo apt-get clean
sudo apt-get update
sudo apt-get update -o Acquire::No-Cache=True
sudo apt-get update -o Acquire::BrokenProxe=True
sudo rm -vrf /var/lib/apt/lists/*
