apt-get install -y isc-dhcp-server
cp dhcpd.conf etc/dhcp
service isc-dhcp-server start
sleep infinity