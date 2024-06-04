#!/bin/bash
# setzen der public Ip4 für prometheus
export EC2_IPV4_PUB=$(curl -s ifconfig.me)
sudo sed -i "s/xxx.xxx.xxx.xxx/$EC2_IPV4_PUB/g" /etc/prometheus/prometheus.yml