class keepalived ( $source ) {
	package { 'keepalived':
		ensure => installed,
	}

	file { '/etc/keepalived/keepalived.conf':
		audit  => content,
                source => $source,
		notify => Service['keepalived'],
        }

	service { 'keepalived':
		enable => true,
		ensure => running,
	}
}

