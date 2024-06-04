#!/bin/bash
# setzen der public Ip4 für prometheus
export EC2_IPV4_PUB=$(curl -s ifconfig.me)
export EC2_IPV4_LOC=$(hostname -I | awk '{print $1}')
sudo sed -i "s/xxx.xxx.xxx.xxx/$EC2_IPV4_LOC/g" /home/ubuntu/prometheus.yml