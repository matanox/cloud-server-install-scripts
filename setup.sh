#
# cloud server setup script
#

# Java 8
apt-get update
apt-get install software-properties-common -y
add-apt-repository ppa:webupd8team/java -y
apt-get update
echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
apt-get install oracle-java8-installer -y
apt-get install oracle-java8-set-default

# git ― you will kind of already have git installed if you cloned this repo to the cloud server...
apt-get install git -y

# sbt
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
apt-get update
apt-get install sbt -y

# open up standard web server ports
apt-get install authbind -y
touch /etc/authbind/byport/80
chmod 755 /etc/authbind/byport/80
touch /etc/authbind/byport/443
chmod 755 /etc/authbind/byport/443

# htop
apt-get install htop -y

# audio conversion from mp4 to wav ― specific to Ubuntu 14.04
sudo add-apt-repository ppa:mc3man/trusty-media -y
sudo apt-get install ffmpeg -y

# audio conversion from opus to wav (was it enough?)
sudo apt-get install opus-tools -y

echo now start sbt so that it downloads itself over the Internet... this may take a minute or two to complete
# TODO: optionally take arguments for https git clone uri and clone & compile that repo in the end (as first compile updates all dependencies which takes several minutes)
