class rsyslog::haproxy {
	package { 'rsyslog':
		ensure => installed,
	}

	file { '/etc/rsyslog.conf':
		content => template("rsyslog/haproxy.rsyslog.conf.erb"),
		audit => content,
		notify => Service['rsyslog'],
	}

	file { '/etc/rsyslog.d/10-rsyslog.conf':
		source => 'puppet:///modules/rsyslog/10-rsyslog.conf',
		audit  => content,
		notify => Service['rsyslog'],
	}

	file { '/etc/rsyslog.d/20-ufw.conf':
		source => 'puppet:///modules/rsyslog/20-ufw.conf',
		audit  => content,
		notify => Service['rsyslog'],
	}

	file { '/etc/rsyslog.d/50-default.conf':
		source => 'puppet:///modules/rsyslog/50-default.conf',
		audit  => content,
		notify => Service['rsyslog'],
	}

	file { '/etc/rsyslog.d/postfix.conf':
		source => 'puppet:///modules/rsyslog/postfix.conf',
		audit  => content,
		notify => Service['rsyslog'],
	}

	service { 'rsyslog':
		enable => true,
		ensure => running,
	}
}
