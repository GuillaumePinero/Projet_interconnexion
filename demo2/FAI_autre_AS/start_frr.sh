chown -R frr.frr /etc/frr
service frr start
ip route del default via 120.1.22.1
ip route add default via 10.0.0.4
sleep infinity