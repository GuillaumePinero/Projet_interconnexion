chown -R frr.frr /etc/frr
service frr start
apt-get install -y isc-dhcp-server
cp dhcpd.conf etc/dhcp
service isc-dhcp-server start
apt-get install -y iptables iproute2
iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -j MASQUERADE
ip route del default via 120.0.18.1
ip route add default via 120.0.18.128
sleep infinity