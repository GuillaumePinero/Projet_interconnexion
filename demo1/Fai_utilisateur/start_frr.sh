chown -R frr.frr /etc/frr
service frr start
ip route del default via 120.0.18.1
ip route add default via 120.0.28.7
sleep infinity

