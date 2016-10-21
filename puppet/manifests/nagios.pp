node 'nagios01.ks.vimro.com' {
	include hosts
	include ssh-keys
	include postfix
	include openjdk
	include certs
	include filebeats
	include nagios-server
	include nagios-client
	class { 'networking': 
		source => 'puppet:///modules/networking/nagios01.interfaces',
	}
        class {'elastic_filebeat':
                package_file => '/tmp/filebeat_1.2.2_amd64.deb',
                logstash_output_enabled => true,
                logstash_output_hosts => ['logstash.cp.vimro.com:5044']
        }
        elastic_filebeat::prospector{'system_logs':
                paths => ['/var/log/*.log','/var/log/dmesg','/var/log/syslog','/var/log/apt/*.log','/usr/local/nagios/var/*.log'],
        }
	class { '::ntp':
		servers => ['10.0.48.1'],
	}

        class { '::packetbeat': }

        packetbeat::protocol { 'http':
                config => {
                        ports => [80],
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
}

node 'nagios02.ks.vimro.com' {
	include hosts
	include ssh-keys
	include postfix
	include openjdk
	include certs
	include filebeats
	include nagios-server
	include nagios-client
	class { 'networking': 
		source => 'puppet:///modules/networking/nagios02.interfaces',
	}
        class {'elastic_filebeat':
                package_file => '/tmp/filebeat_1.2.2_amd64.deb',
                logstash_output_enabled => true,
                logstash_output_hosts => ['logstash.cp.vimro.com:5044']
        }
        elastic_filebeat::prospector{'system_logs':
                paths => ['/var/log/*.log','/var/log/dmesg','/var/log/syslog','/var/log/apt/*.log','/usr/local/nagios/var/*.log'],
        }
	class { '::ntp':
		servers => ['10.0.48.1'],
	}

        class { '::packetbeat': }

        packetbeat::protocol { 'http':
                config => {
                        ports => [80],
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
}
