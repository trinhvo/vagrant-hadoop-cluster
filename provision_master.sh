#!/bin/bash
export DEBIAN_FRONTEND=noninteractive
apt-get install curl wget -y
apt-get update
apt-get -q -y --force-yes upgrade
apt-get -q -y --force-yes install libpq5 postgresql postgresql-9.1 postgresql-client-9.1 postgresql-client-common postgresql-common ssl-cert zlibc nagios3 gmetad ganglia-webfrontend ganglia-monitor-python rrdcached
wget -nv http://public-repo-1.hortonworks.com/ambari/ubuntu12/1.x/updates/1.7.0/ambari.list -O /etc/apt/sources.list.d/ambari.list
apt-key adv --recv-keys --keyserver keyserver.ubuntu.com B9733A7A07513CAD
apt-get update
apt-get -q -y --force-yes install ambari-server ambari-agent
ambari-server setup -s
ambari-server start
service ambari-agent start
