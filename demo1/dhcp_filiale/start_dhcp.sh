chown -R frr.frr /etc/frr
service frr start
apt-get install -y isc-dhcp-server
cp dhcpd.conf etc/dhcp
service isc-dhcp-server start

apt-get install -y iptables iproute2

ip tunnel add neta mode gre local 120.0.26.2 remote 120.0.20.2 ttl 255
ip link set neta up
ip addr add 192.168.2.197/26 dev neta
ip route add 192.168.2.64/26 dev neta

#iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -j MASQUERADE

sleep infinity
