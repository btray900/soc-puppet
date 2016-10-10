node 'search01.ks.vimro.com' {
	include hosts
	include ssh-keys
	include postfix
	include openjdk
	include certs
	include filebeats
	class { 'networking': 
		source => 'puppet:///modules/networking/search01.interfaces',
	}
	class { 'elasticsearch':
		config => { 
			'cluster.name' => 'piCLUSTER',
			'network.host' => '172.16.49.21',
			'node.master' => 'true',
			'node.data' => 'false',
			'index.mapper.dynamic' => 'true',
                        'action.auto_create_index' => '+logstash*,+marvel*,+.*',
			'discovery.zen.fd.ping_timeout' => '30s',
			'discovery.zen.minimum_master_nod' => '1',
			'discovery.zen.ping.multicast.enabled' => 'false',
			'discovery.zen.ping.unicast.hosts' => ['search02.cp.vimro.com','search03.cp.vimro.com','search04.cp.vimro.com','search05.cp.vimro.com','search06.cp.vimro.com'],
		},
		package_url => 'puppet:///modules/elasticsearch/elasticsearch-2.4.1.deb',
	}
	elasticsearch::instance { 'search01': }
        class {'elastic_filebeat':
                package_file => '/tmp/filebeat_1.2.2_amd64.deb',
                logstash_output_enabled => true,
                logstash_output_hosts => ['logstash.cp.vimro.com:5044']
        }
        elastic_filebeat::prospector{'system_logs':
                paths => ['/var/log/*.log','/var/log/dmesg','/var/log/syslog','/var/log/apt/*.log','/var/log/elasticsearch/search01/*.log'],
        }
        class { '::ntp':
                servers => ['10.0.48.1'],
        }
}

node 'search02.ks.vimro.com' {
	include hosts
	include ssh-keys
	include postfix
	include openjdk
	include certs
	include filebeats
	class { 'networking': 
		source => 'puppet:///modules/networking/search02.interfaces',
	}
	class { 'elasticsearch':
		config => { 
			'cluster.name' => 'piCLUSTER',
			'network.host' => '172.16.49.22',
			'node.master' => 'false',
			'node.data' => 'true',
			'index.mapper.dynamic' => 'true',
                        'action.auto_create_index' => '+logstash*,+marvel*,+.*',
			'discovery.zen.fd.ping_timeout' => '30s',
			'discovery.zen.minimum_master_nod' => '1',
			'discovery.zen.ping.multicast.enabled' => 'false',
			'discovery.zen.ping.unicast.hosts' => ['search01.cp.vimro.com','search03.cp.vimro.com','search04.cp.vimro.com','search05.cp.vimro.com','search06.cp.vimro.com'],
		},
		package_url => 'puppet:///modules/elasticsearch/elasticsearch-2.3.2.deb',
	}
	elasticsearch::instance { 'search02': }
        class {'elastic_filebeat':
                package_file => '/tmp/filebeat_1.2.2_amd64.deb',
                logstash_output_enabled => true,
                logstash_output_hosts => ['logstash.cp.vimro.com:5044']
        }
        elastic_filebeat::prospector{'system_logs':
                paths => ['/var/log/*.log','/var/log/dmesg','/var/log/syslog','/var/log/apt/*.log','/var/log/elasticsearch/search02/*.log'],
        }
        class { '::ntp':
                servers => ['10.0.48.1'],
        }
}

node 'search03.ks.vimro.com' {
	include hosts
	include ssh-keys
	include postfix
	include openjdk
	include certs
	include filebeats
	class { 'networking': 
		source => 'puppet:///modules/networking/search03.interfaces',
	}
	class { 'elasticsearch':
		config => { 
			'cluster.name' => 'piCLUSTER',
			'network.host' => '172.16.49.23',
			'node.master' => 'true',
			'node.data' => 'false',
			'index.mapper.dynamic' => 'true',
                        'action.auto_create_index' => '+logstash*,+marvel*,+.*',
			'discovery.zen.fd.ping_timeout' => '30s',
			'discovery.zen.minimum_master_nod' => '1',
			'discovery.zen.ping.multicast.enabled' => 'false',
			'discovery.zen.ping.unicast.hosts' => ['search01.cp.vimro.com','search02.cp.vimro.com','search04.cp.vimro.com','search05.cp.vimro.com','search06.cp.vimro.com'],
		},
		package_url => 'puppet:///modules/elasticsearch/elasticsearch-2.3.2.deb',
	}
	elasticsearch::instance { 'search03': }
        class {'elastic_filebeat':
                package_file => '/tmp/filebeat_1.2.2_amd64.deb',
                logstash_output_enabled => true,
                logstash_output_hosts => ['logstash.cp.vimro.com:5044']
        }
        elastic_filebeat::prospector{'system_logs':
                paths => ['/var/log/*.log','/var/log/dmesg','/var/log/syslog','/var/log/apt/*.log','/var/log/elasticsearch/search03/*.log'],
        }
        class { '::ntp':
                servers => ['10.0.48.1'],
        }
}

node 'search04.ks.vimro.com' {
	include hosts
	include ssh-keys
	include postfix
	include openjdk
	include certs
	include filebeats
	class { 'networking': 
		source => 'puppet:///modules/networking/search04.interfaces',
	}
	class { 'elasticsearch':
		config => { 
			'cluster.name' => 'piCLUSTER',
			'network.host' => '172.16.49.24',
			'node.master' => 'false',
			'node.data' => 'true',
			'index.mapper.dynamic' => 'true',
                        'action.auto_create_index' => '+logstash*,+marvel*,+.*',
			'discovery.zen.fd.ping_timeout' => '30s',
			'discovery.zen.minimum_master_nod' => '2',
			'discovery.zen.ping.multicast.enabled' => 'false',
			'discovery.zen.ping.unicast.hosts' => ['search01.cp.vimro.com','search02.cp.vimro.com','search03.cp.vimro.com','search05.cp.vimro.com','search06.cp.vimro.com'],
		},
		package_url => 'puppet:///modules/elasticsearch/elasticsearch-2.3.2.deb',
	}
	elasticsearch::instance { 'search04': }
        class {'elastic_filebeat':
                package_file => '/tmp/filebeat_1.2.2_amd64.deb',
                logstash_output_enabled => true,
                logstash_output_hosts => ['logstash.cp.vimro.com:5044']
        }
        elastic_filebeat::prospector{'system_logs':
                paths => ['/var/log/*.log','/var/log/dmesg','/var/log/syslog','/var/log/apt/*.log','/var/log/elasticsearch/search04/*.log'],
        }
        class { '::ntp':
                servers => ['10.0.48.1'],
        }
}


node 'search05.ks.vimro.com' {
	include hosts
	include ssh-keys
	include postfix
	include openjdk
	include certs
	include filebeats
	class { 'networking': 
		source => 'puppet:///modules/networking/search05.interfaces',
	}
	class { 'elasticsearch':
		config => { 
			'cluster.name' => 'piCLUSTER',
			'network.host' => '172.16.49.25',
			'node.master' => 'true',
			'node.data' => 'false',
			'index.mapper.dynamic' => 'true',
                        'action.auto_create_index' => '+logstash*,+marvel*,+.*',
			'discovery.zen.fd.ping_timeout' => '30s',
			'discovery.zen.minimum_master_nod' => '2',
			'discovery.zen.ping.multicast.enabled' => 'false',
			'discovery.zen.ping.unicast.hosts' => ['search01.cp.vimro.com','search02.cp.vimro.com','search03.cp.vimro.com','search04.cp.vimro.com','search06.cp.vimro.com'],
		},
		package_url => 'puppet:///modules/elasticsearch/elasticsearch-2.3.2.deb',
	}
	elasticsearch::instance { 'search05': }
        class {'elastic_filebeat':
                package_file => '/tmp/filebeat_1.2.2_amd64.deb',
                logstash_output_enabled => true,
                logstash_output_hosts => ['logstash.cp.vimro.com:5044']
        }
        elastic_filebeat::prospector{'system_logs':
                paths => ['/var/log/*.log','/var/log/dmesg','/var/log/syslog','/var/log/apt/*.log','/var/log/elasticsearch/search05/*.log'],
        }
        class { '::ntp':
                servers => ['10.0.48.1'],
        }
}

node 'search06.ks.vimro.com' {
	include hosts
	include ssh-keys
	include postfix
	include openjdk
	include certs
	include filebeats
	class { 'networking': 
		source => 'puppet:///modules/networking/search06.interfaces',
	}
	class { 'elasticsearch':
		config => { 
			'cluster.name' => 'piCLUSTER',
			'network.host' => '172.16.49.26',
			'node.master' => 'false',
			'node.data' => 'true',
			'index.mapper.dynamic' => 'true',
			'action.auto_create_index' => '+logstash*,+marvel*,+.*',
			'discovery.zen.fd.ping_timeout' => '30s',
			'discovery.zen.minimum_master_nod' => '2',
			'discovery.zen.ping.multicast.enabled' => 'false',
			'discovery.zen.ping.unicast.hosts' => ['search01.cp.vimro.com','search02.cp.vimro.com','search03.cp.vimro.com','search04.cp.vimro.com','search05.cp.vimro.com'],
		},
		package_url => 'puppet:///modules/elasticsearch/elasticsearch-2.3.2.deb',
	}
	elasticsearch::instance { 'search06': }
        class {'elastic_filebeat':
                package_file => '/tmp/filebeat_1.2.2_amd64.deb',
                logstash_output_enabled => true,
                logstash_output_hosts => ['logstash.cp.vimro.com:5044']
        }
        elastic_filebeat::prospector{'system_logs':
                paths => ['/var/log/*.log','/var/log/dmesg','/var/log/syslog','/var/log/apt/*.log','/var/log/elasticsearch/search06/*.log'],
        }
        class { '::ntp':
                servers => ['10.0.48.1'],
        }
}

