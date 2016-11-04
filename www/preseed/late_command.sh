#!/bin/bash

/bin/echo "10.0.48.1            puppet.ks.vimro.com puppet soc-puppet" >> /etc/hosts
/usr/bin/puppet agent --enable
/usr/bin/puppet agent -t
/usr/bin/wget -O /root/elasticsearch-5.0.0.deb https://artifacts.elastic.co/downloads/elasticsearch/elasticsearch-5.0.0.deb
/usr/bin/wget -O /root/logstash-5.0.0.deb https://artifacts.elastic.co/downloads/logstash/logstash-5.0.0.deb
/usr/bin/wget -O /root/kibana-5.0.0-amd64.deb https://artifacts.elastic.co/downloads/kibana/kibana-5.0.0-amd64.deb
/usr/bin/wget -O /root/elasticsearch-5.0.0.deb https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.0.0-amd64.deb
/usr/bin/wget -O /root/elasticsearch-5.0.0.deb https://artifacts.elastic.co/downloads/beats/packetbeat/packetbeat-5.0.0-amd64.deb
/usr/bin/wget -O /root/elasticsearch-5.0.0.deb https://artifacts.elastic.co/downloads/beats/metricbeat/metricbeat-5.0.0-amd64.deb
