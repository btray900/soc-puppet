class certs {
	file { '/etc/ssl/certs/logstash-security.crt':
		audit => content,
		source => 'puppet:///modules/certs/logstash-security.crt',
	}
	file { '/etc/ssl/private/logstash-security.key':
		audit => content,
		source => 'puppet:///modules/certs/logstash-security.key',
	}
}
