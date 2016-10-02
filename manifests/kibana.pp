node 'kibana01.ks.vimro.com' {
	include hosts
	include ssh-keys
	include postfix
	include openjdk
	include certs
	include filebeats
	class { 'networking': 
		source => 'puppet:///modules/networking/kibana01.interfaces',
	}
	class { 'kibana': 
		es_url => 'http://172.16.49.41:9200',
		version => '4.5.0',
		port => '5601',
		verify_ssl => true,
		startup_timeout => '5000',
	}
	class { 'elasticsearch':
		config => { 
			'cluster.name' => 'piCLUSTER',
			'network.host' => '172.16.49.41',
			'node.master' => 'false',
			'node.data' => 'false',
			'index.mapper.dynamic' => 'true',
                        'action.auto_create_index' => '+logstash*,+marvel*,+.*',
			'discovery.zen.fd.ping_timeout' => '30s',
			'discovery.zen.minimum_master_nodes' => '1',
			'discovery.zen.ping.multicast.enabled' => 'false',
			'discovery.zen.ping.unicast.hosts' => ['search01.cp.vimro.com','search02.cp.vimro.com','search03.cp.vimro.com','search04.cp.vimro.com','search05.cp.vimro.com','search06.cp.vimro.com'],
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
                paths => ['/var/log/*'],
        }
}

node 'kibana02.ks.vimro.com' {
	include hosts
	include ssh-keys
	include postfix
	include openjdk
	include certs
	include filebeats
	class { 'networking': 
		source => 'puppet:///modules/networking/kibana02.interfaces',
	}
	class { 'kibana': 
		es_url => 'http://172.16.49.42:9200',
		version => '4.5.0',
		port => '5601',
		verify_ssl => true,
		startup_timeout => '5000',
	}
	class { 'elasticsearch':
		config => { 
			'cluster.name' => 'piCLUSTER',
			'network.host' => '172.16.49.42',
			'node.master' => 'false',
			'node.data' => 'false',
			'index.mapper.dynamic' => 'true',
                        'action.auto_create_index' => '+logstash*,+marvel*,+.*',
			'discovery.zen.fd.ping_timeout' => '30s',
			'discovery.zen.minimum_master_nodes' => '1',
			'discovery.zen.ping.multicast.enabled' => 'false',
			'discovery.zen.ping.unicast.hosts' => ['search01.cp.vimro.com','search02.cp.vimro.com','search03.cp.vimro.com','search04.cp.vimro.com','search05.cp.vimro.com','search06.cp.vimro.com'],
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
                paths => ['/var/log/*'],
        }
}

node 'kibana03.ks.vimro.com' {
	include hosts
	include ssh-keys
	include postfix
	include openjdk
	include certs
	include filebeats
	class { 'networking': 
		source => 'puppet:///modules/networking/kibana03.interfaces',
	}
	class { 'kibana': 
		es_url => 'http://172.16.49.43:9200',
		version => '4.5.0',
		port => '5601',
		verify_ssl => true,
		startup_timeout => '5000',
	}
	class { 'elasticsearch':
		config => { 
			'cluster.name' => 'piCLUSTER',
			'network.host' => '172.16.49.43',
			'node.master' => 'false',
			'node.data' => 'false',
			'index.mapper.dynamic' => 'true',
                        'action.auto_create_index' => '+logstash*,+marvel*,+.*',
			'discovery.zen.fd.ping_timeout' => '30s',
			'discovery.zen.minimum_master_nodes' => '1',
			'discovery.zen.ping.multicast.enabled' => 'false',
			'discovery.zen.ping.unicast.hosts' => ['search01.cp.vimro.com','search02.cp.vimro.com','search03.cp.vimro.com','search04.cp.vimro.com','search05.cp.vimro.com','search06.cp.vimro.com'],
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
                paths => ['/var/log/*'],
        }
}
