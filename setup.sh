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

# git
apt-get install git -y

# sbt
echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 642AC823
sudo apt-get update
sudo apt-get install sbt -y

# htop
apt-get install htop -y
