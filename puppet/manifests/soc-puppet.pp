node soc-puppet {
	include hosts
	include ssh-keys
	include postfix
	include certs
	include filebeats
	include nagios-client
	include dns::server
        class {'elastic_filebeat':
                package_file => '/tmp/filebeat_1.2.2_amd64.deb',
                logstash_output_enabled => true,
                logstash_output_hosts => ['logstash.cp.vimro.com:5044']
        }
        elastic_filebeat::prospector{'system_logs':
                paths => ['/var/log/*.log','/var/log/dmesg','/var/log/syslog','/var/log/apt/*.log'],
        }
        class { '::packetbeat': }

        packetbeat::protocol { 'http':
                config => {
                        ports => [80],
                }
        }
        packetbeat::protocol { 'dns':
                config => {
                        ports => [53],
                }
        }
	class { 'topbeat':
		output => {
			'logstash'     => {
				'hosts' => ['logstash.cp.vimro.com:5044'],
				'loadbalance' => false,
			},
		},
	}

	dns::server::options { '/etc/bind/named.conf.options':
		forwarders => [ '8.8.8.8', '8.8.4.4' ]
	}

	dns::zone { 'cp.vimro.com':
		soa         => 'ns1.cp.vimro.com',
		soa_email   => 'admin.cp.vimro.com',
		nameservers => ['ns1']
	}

	dns::record::a { 'ns1':
		zone => 'cp.vimro.com',
		data => ['98.76.54.32'];
	}

        dns::record::a { 'soc-puppet':
                zone => 'cp.vimro.com',
                data => ['172.16.49.1'];
        }

        dns::record::a { 'haproxy01':
                zone => 'cp.vimro.com',
                data => ['172.16.49.11'];
        }

        dns::record::a { 'haproxy02':
                zone => 'cp.vimro.com',
                data => ['172.16.49.12'];
        }

        dns::record::a { 'search01':
                zone => 'cp.vimro.com',
                data => ['172.16.49.21'];
        }

        dns::record::a { 'search02':
                zone => 'cp.vimro.com',
                data => ['172.16.49.22'];
        }

        dns::record::a { 'search03':
                zone => 'cp.vimro.com',
                data => ['172.16.49.23'];
        }

        dns::record::a { 'search04':
                zone => 'cp.vimro.com',
                data => ['172.16.49.24'];
        }

        dns::record::a { 'search05':
                zone => 'cp.vimro.com',
                data => ['172.16.49.25'];
        }

        dns::record::a { 'search06':
                zone => 'cp.vimro.com',
                data => ['172.16.49.26'];
        }

        dns::record::a { 'logstash01':
                zone => 'cp.vimro.com',
                data => ['172.16.49.31'];
        }

        dns::record::a { 'logstash02':
                zone => 'cp.vimro.com',
                data => ['172.16.49.32'];
        }

        dns::record::a { 'logstash03':
                zone => 'cp.vimro.com',
                data => ['172.16.49.33'];
        }

        dns::record::a { 'kibana01':
                zone => 'cp.vimro.com',
                data => ['172.16.49.41'];
        }

        dns::record::a { 'kibana02':
                zone => 'cp.vimro.com',
                data => ['172.16.49.42'];
        }

        dns::record::a { 'kibana03':
                zone => 'cp.vimro.com',
                data => ['172.16.49.43'];
        }

        dns::record::a { 'kibana04':
                zone => 'cp.vimro.com',
                data => ['172.16.49.44'];
        }

        dns::record::a { 'nagios01':
                zone => 'cp.vimro.com',
                data => ['172.16.49.51'];
        }

        dns::record::a { 'nagios02':
                zone => 'cp.vimro.com',
                data => ['172.16.49.52'];
        }

        dns::record::a { 'portal':
                zone => 'cp.vimro.com',
                data => ['172.16.49.250'];
        }

        dns::record::a { 'search':
                zone => 'cp.vimro.com',
                data => ['172.16.49.220'];
        }

        dns::record::a { 'logstash':
                zone => 'cp.vimro.com',
                data => ['172.16.49.230'];
        }

        dns::record::a { 'kibana':
                zone => 'cp.vimro.com',
                data => ['172.16.49.240'];
        }

        dns::record::a { 'nagios':
                zone => 'cp.vimro.com',
                data => ['172.16.49.250'];
        }

	dns::record::mx { 'mx,10':
		zone       => 'cp.vimro.com',
		preference => 10,
		data       => 'ns1.cp.vimro.com';
	}

	dns::record::ns { 'cp.vimro.com':
		zone => 'cp.vimro.com',
		data => 'ns1';
	}
}
