class nagios-client {

	package { 'nagios-nrpe-server':
		ensure => 'installed',
	}

	package { 'nagios-plugins':
		ensure => 'installed',
	}

	file { '/etc/nagios/nrpe.cfg':
		owner   => root,
		group   => root,
		mode    => 644,
		content => template('nagios-client/nrpe.cfg.erb'),
	}
}
