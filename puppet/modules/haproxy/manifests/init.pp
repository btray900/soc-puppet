class haproxy {
	package { 'haproxy':
		ensure => installed,
	}

	file { '/etc/default/haproxy':
		audit  => content,
		source => 'puppet:///modules/haproxy/haproxy',
	}

	file { '/etc/haproxy/haproxy.cfg':
		audit  => content,
		source => 'puppet:///modules/haproxy/haproxy.cfg',
		notify => Service['haproxy'],
	}

	service { 'haproxy':
		enable => true,
		ensure => running,
	}
}
