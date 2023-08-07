#run with sudo

wget -4 https://rubygems.org/rubygems/rubygems-3.4.6.tgz

tar xfv rubygems-3.4.6.tgz
cd rubygems-3.4.6
apt install ruby
ruby setup.rb

cd ..
rm rubygems-3.4.6.tgz
rm -rf rubygems-3.4.6