VERSION=3.58.1-02


#prepare system
groupadd -g 501 nexus
useradd -c "nexus" -d /home/nexus -g 501 -m -u 501 nexus
ulimit -n 65536

echo "nexus - nofile 65536" >> /etc/security/limits.d/nexus.conf

#needed for nexus
yum install java-1.8.0-openjdk java-1.8.0-openjdk-devel

rpm -i nexus_$VERSION_-1.x86_64.rpm

echo "run_as_user=\"nexus\"" > /opt/nexus/bin/nexus.rc
sed -i "s/-Xms2703m/-Xms1024m/g" /opt/nexus/bin/nexus.vmoptions
sed -i "s/-Xmx2703m/-Xmx1024m/g" /opt/nexus/bin/nexus.vmoptions
sed -i "s/-XX:MaxDirectMemorySize=1024m/-XX:MaxDirectMemorySize=1024m/g" /opt/nexus/bin/nexus.vmoptions
sed -i "s/#application-host=0.0.0.0/application-host=0.0.0.0/g" /opt/sonatype-work/nexus3/etc/nexus.properties

cat <EOF>>/etc/systemd/system/nexus.service
[Unit]
Description=nexus service
After=network.target

[Service]
Type=forking
LimitNOFILE=65536
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
User=nexus
Restart=on-abort

[Install]
WantedBy=multi-user.target
EOF


systemctl daemon-reload
systemctl start nexus.service
systemctl enable nexus.service
systemctl status nexus.service