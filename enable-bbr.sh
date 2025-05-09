#!/bin/bash

if [ "$(sysctl -n net.ipv4.tcp_available_congestion_control)" = "bbr" ]; then
    echo "bbr is enabled"
else
    echo 'net.core.default_qdisc=fq' | sudo tee -a /etc/sysctl.conf > /dev/null
    echo 'net.ipv4.tcp_congestion_control=bbr' | sudo tee -a /etc/sysctl.conf > /dev/null
    sudo sysctl -p
fi


