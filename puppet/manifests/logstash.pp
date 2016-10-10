node 'logstash01.ks.vimro.com' {
	include hosts
	include ssh-keys
	include postfix
	include openjdk
	include certs
	include filebeats
	class { 'networking': 
		source => 'puppet:///modules/networking/logstash01.interfaces',
	}
	class { 'logstash': 
		package_url => 'puppet:///modules/logstash/logstash_2.3.2-1_all.deb',
	}
	logstash::configfile { 'logstash.conf':
		content => template('logstash/indexer-logstash.erb'),
	}
        class {'elastic_filebeat':
                package_file => '/tmp/filebeat_1.2.2_amd64.deb',
                logstash_output_enabled => true,
                logstash_output_hosts => ['logstash.cp.vimro.com:5044']
        }
        elastic_filebeat::prospector{'system_logs':
                paths => ['/var/log/*.log','/var/log/dmesg','/var/log/syslog','/var/log/logstash/*.log','/var/log/apt/*.log'],
        }
        class { '::ntp':
                servers => ['10.0.48.1'],
        }
}

node 'logstash02.ks.vimro.com' {
	include hosts
	include ssh-keys
	include postfix
	include openjdk
	include certs
	include filebeats
	class { 'networking': 
		source => 'puppet:///modules/networking/logstash02.interfaces',
	}
	class { 'logstash': 
		package_url => 'puppet:///modules/logstash/logstash_2.3.2-1_all.deb',
	}
	logstash::configfile { 'logstash.conf':
		content => template('logstash/indexer-logstash.erb'),
	}
        class {'elastic_filebeat':
                package_file => '/tmp/filebeat_1.2.2_amd64.deb',
                logstash_output_enabled => true,
                logstash_output_hosts => ['logstash.cp.vimro.com:5044']
        }
        elastic_filebeat::prospector{'system_logs':
                paths => ['/var/log/*.log','/var/log/dmesg','/var/log/syslog','/var/log/logstash/*.log','/var/log/apt/*.log'],
        }
        class { '::ntp':
                servers => ['10.0.48.1'],
        }
}

node 'logstash03.ks.vimro.com' {
	include hosts
	include ssh-keys
	include postfix
	include openjdk
	include filebeats
	class { 'networking': 
		source => 'puppet:///modules/networking/logstash03.interfaces',
	}
	class { 'logstash': 
		package_url => 'puppet:///modules/logstash/logstash_2.3.2-1_all.deb',
	}
	logstash::configfile { 'logstash.conf':
		content => template('logstash/indexer-logstash.erb'),
	}
        class {'elastic_filebeat':
                package_file => '/tmp/filebeat_1.2.2_amd64.deb',
                logstash_output_enabled => true,
                logstash_output_hosts => ['logstash.cp.vimro.com:5044']
        }
        elastic_filebeat::prospector{'system_logs':
                paths => ['/var/log/*.log','/var/log/dmesg','/var/log/syslog','/var/log/logstash/*.log','/var/log/apt/*.log'],
        }
        class { '::ntp':
                servers => ['10.0.48.1'],
        }
}
