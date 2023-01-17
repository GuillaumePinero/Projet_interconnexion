chown -R frr.frr /etc/frr
service frr start
apt-get install -y isc-dhcp-server
cp dhcpd.conf etc/dhcp
service isc-dhcp-server start

apt-get install -y iptables iproute2

ip tunnel add netb mode gre local 120.0.20.2 remote 120.0.26.2 ttl 255
ip link set netb up
ip addr add 192.168.2.79/26 dev netb
ip route add 192.168.2.192/26 dev netb

#iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -j MASQUERADE

#Peremttre aux paquets de données ne respectant pas les règles d'être automatiquement rejetés
#iptables -F
#iptables -X

#Acceptation de ICMP (afin de tester les ping)
#iptables -A FORWARD -p icmp -j ACCEPT
#iptables -A INPUT -p icmp -j ACCEPT
#iptables -A OUTPUT -p icmp -j ACCEPT

#Acceptation HTTP
#iptables -A FORWARD -i eth1 -p tcp --dport 8080 -j ACCEPT
#iptables -A FORWARD -i eth2 -o eth1 -p tcp --dport 8080 -j ACCEPT
#iptables -A FORWARD -i eth1 -o eth0 -p tcp --sport 8080 -j ACCEPT 
#iptables -A FORWARD -i eth0 -o eth1 -p tcp --sport 8080 -j ACCEPT
#iptables -A FORWARD -i eth0 -o eth2 -p tcp --dport 8080 -j ACCEPT

#Acceptation DNS

#Acceptation FTP

sleep infinity
