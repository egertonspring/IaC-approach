#run with sudo
#needed for rubygems.org to be reached

echo "net.ipv6.conf.all.disable_ipv6=0" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6=0" >> /etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6=0" >> /etc/sysctl.conf

systemctl restart NetworkManager