chown -R frr.frr /etc/frr
service frr start
ip route del default via 120.1.28.1
ip route add default via 120.1.28.4 
sleep infinity

