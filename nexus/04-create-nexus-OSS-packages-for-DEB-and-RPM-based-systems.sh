VERSION=3.58.1-02

#prepare system
groupadd -g 501 nexus
useradd -c "nexus" -d /home/nexus -g 501 -m -u 501 nexus

cd /tmp
mkdir -p /tmp/fpm/opt
cd /tmp/fpm/opt/
wget https://download.sonatype.com/nexus/3/nexus-$VERSION-unix.tar.gz
wget https://download.sonatype.com/nexus/3/nexus-$VERSION-unix.tar.gz.sha1

#verify dowload
if [ "$(cat nexus-$VERSION-unix.tar.gz.sha1)" = "$(sha1sum nexus-$VERSION-unix.tar.gz | cut -d ' ' -f 1)" ]; 
    then echo "Download is verified."; 
    else echo "Download is corrupted."; 
fi

tar xfv nexus-$VERSION-unix.tar.gz
rm nexus-$VERSION-unix.tar.gz nexus-$VERSION-unix.tar.gz.sha1
mv nexus-$VERSION  nexus
chown -R nexus:nexus nexus sonatype-work
cd /tmp/fpm

#for RPM
fpm --rpm-auto-add-directories -s dir -t rpm -n nexus -v $VERSION --rpm-user nexus --rpm-group nexus --description "FPM package of Sonatype Nexus tar.gz version $VERSION" .

#for DEB
fpm -s dir -t deb -n nexus -d openjdk-8-jdk -v $VERSION --deb-user nexus --deb-group nexus --description "FPM package of Sonatype Nexus tar.gz version $VERSION" .