class nagios-client {

	package { 'nagios-nrpe-server':
		ensure => present,
		before => File['/etc/nagios/nrpe.cfg'],
	}

	package { 'nagios-plugins':
		ensure => present,
	}

	service { 'nagios-nrpe-server':
		ensure => running,
		require => Package['nagios-nrpe-server'],
	}

	file { '/etc/nagios/nrpe.cfg':
		owner   => root,
		group   => root,
		mode    => 644,
		content => template('nagios-client/nrpe.cfg.erb'),
		audit  => content,
		notify => Exec["Bounce NRPE Server"],
		require => Package['nagios-nrpe-server'],
	}

	exec { 'Bounce NRPE Server':
		user => root,
		refreshonly => true,
		command => '/bin/systemctl restart nagios-nrpe-server',
	}
}
