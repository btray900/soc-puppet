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
		package_url => 'puppet:///modules/elasticsearch/elasticsearch-2.3.2.deb',
	}
	elasticsearch::instance { '01': }
        class {'elastic_filebeat':
                package_file => '/tmp/filebeat_1.2.2_amd64.deb',
                logstash_output_enabled => true,
                logstash_output_hosts => ['logstash.cp.vimro.com:5044']
        }
        elastic_filebeat::prospector{'system_logs':
                paths => ['/var/log/*','/var/log/elasticsearch/01/*.log'],
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
	elasticsearch::instance { '02': }
        class {'elastic_filebeat':
                package_file => '/tmp/filebeat_1.2.2_amd64.deb',
                logstash_output_enabled => true,
                logstash_output_hosts => ['logstash.cp.vimro.com:5044']
        }
        elastic_filebeat::prospector{'system_logs':
                paths => ['/var/log/*','/var/log/elasticsearch/02/*.log'],
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
	elasticsearch::instance { '03': }
        class {'elastic_filebeat':
                package_file => '/tmp/filebeat_1.2.2_amd64.deb',
                logstash_output_enabled => true,
                logstash_output_hosts => ['logstash.cp.vimro.com:5044']
        }
        elastic_filebeat::prospector{'system_logs':
                paths => ['/var/log/*','/var/log/elasticsearch/03/*.log'],
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
	elasticsearch::instance { '04': }
        class {'elastic_filebeat':
                package_file => '/tmp/filebeat_1.2.2_amd64.deb',
                logstash_output_enabled => true,
                logstash_output_hosts => ['logstash.cp.vimro.com:5044']
        }
        elastic_filebeat::prospector{'system_logs':
                paths => ['/var/log/*','/var/log/elasticsearch/04/*.log'],
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
	elasticsearch::instance { '05': }
        class {'elastic_filebeat':
                package_file => '/tmp/filebeat_1.2.2_amd64.deb',
                logstash_output_enabled => true,
                logstash_output_hosts => ['logstash.cp.vimro.com:5044']
        }
        elastic_filebeat::prospector{'system_logs':
                paths => ['/var/log/*','/var/log/elasticsearch/05/*.log'],
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
	elasticsearch::instance { '06': }
        class {'elastic_filebeat':
                package_file => '/tmp/filebeat_1.2.2_amd64.deb',
                logstash_output_enabled => true,
                logstash_output_hosts => ['logstash.cp.vimro.com:5044']
        }
        elastic_filebeat::prospector{'system_logs':
                paths => ['/var/log/*','/var/log/elasticsearch/06/*.log'],
        }
}

