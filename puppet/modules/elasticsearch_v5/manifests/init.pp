class elasticsearch_v5 ( $unicast_hosts,$network_host, $node_data, $node_master ) {
	file { '/tmp/elasticsearch-5.0.0.deb':
		before => Package['Elasticsearch-v5_0_0'],
		source => 'puppet:///modules/elasticsearch_v5/elasticsearch-5.0.0.deb',
	}

	exec { 'Install Elasticsearch':
		require => File['/tmp/elasticsearch-5.0.0.deb'],
		before => Package['Elasticsearch-v5_0_0'],
		user => root,
		command => '/usr/bin/dpkg -i /tmp/elasticsearch-5.0.0.deb',
	}

	package { 'Elasticsearch-v5_0_0':
		require => File['/tmp/elasticsearch-5.0.0.deb'],
		ensure => installed,
	}

	file { '/usr/lib/systemd/system/elasticsearch.service':
		audit => content,
		source => 'puppet:///modules/elasticsearch_v5/elasticsearch.service',
		notify => Exec['Reload systemctl'],
	}

	file { '/usr/share/elasticsearch':
		ensure => directory,
		owner => elasticsearch,
		group => elasticsearch,
		recurse => true,
		before => File['/etc/elasticsearch/elasticsearch.yml'],
	}

	file { '/etc/elasticsearch/elasticsearch.yml':
		ensure => file,
		owner => elasticsearch,
		group => elasticsearch,
		mode => 0644,
		audit => content,
		content => template('elasticsearch_v5/elasticsearch.yml.erb'),
		before => Service['elasticsearch'],
		notify => Service['elasticsearch'],
	}

	exec { 'Reload systemctl':
		user => root,
		command => '/bin/systemctl daemon-reload',
	}

	service { 'elasticsearch':
		ensure => running,
	}
}
