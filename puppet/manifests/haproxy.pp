node 'haproxy01.ks.vimro.com' {
	include hosts
	include ssh-keys
	include haproxy
	include postfix
	include openjdk
	include certs
	include filebeats
	class { 'sysctl': 
		source => 'puppet:///modules/sysctl/haproxy.sysctl.conf',
	}
	class { 'networking': 
		source => 'puppet:///modules/networking/haproxy01.interfaces',
	}
	class { 'keepalived': 
		source => 'puppet:///modules/keepalived/haproxy01.keepalived.conf',
	}
	class {'elastic_filebeat':
                package_file => '/tmp/filebeat_1.2.2_amd64.deb',
		logstash_output_enabled => true,
		logstash_output_hosts => ['logstash.cp.vimro.com:5044']
	}
	elastic_filebeat::prospector{'system_logs':
		paths => ['/var/log/*'],
	}
	class { '::ntp':
		servers => ['10.0.48.1'],
	}
}

node 'haproxy02.ks.vimro.com' {
	include hosts
	include ssh-keys
	include haproxy
	include postfix
	include openjdk
	include certs
	include filebeats
	class { 'sysctl': 
		source => 'puppet:///modules/sysctl/haproxy.sysctl.conf',
	}
	class { 'networking': 
		source => 'puppet:///modules/networking/haproxy02.interfaces',
	}
	class { 'keepalived': 
		source => 'puppet:///modules/keepalived/haproxy02.keepalived.conf',
	}
	class {'elastic_filebeat':
		package_file => '/tmp/filebeat_1.2.2_amd64.deb',
		logstash_output_enabled => true,
		logstash_output_hosts => ['logstash.cp.vimro.com:5044']
	}
	elastic_filebeat::prospector{'system_logs':
		paths => ['/var/log/*'],
	}
	class { '::ntp':
		servers => ['10.0.48.1'],
	}
}