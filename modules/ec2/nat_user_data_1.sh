#! /bin/bash
echo " start of the nat_user_data.sh script"
###########################################

sudo dnf install iptables-services -y
sudo systemctl enable iptables
sudo systemctl start iptables

sudo iptables -t nat -A POSTROUTING -o ens5 -j MASQUERADE
sudo iptables -A FORWARD -i ens5 -o ens5 -j ACCEPT
sudo iptables -A FORWARD -o ens5 -m state --state RELATED,ESTABLISHED -j ACCEPT

############################################
echo " reached end of the nat_user_data.sh script"

