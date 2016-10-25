class nagios-server {

	file { '/var/www/html/index.html':
		audit => content,
		source => 'puppet:///modules/nagios-server/index.html',
	}

	file { '/usr/local/nagios/etc':
		ensure => directory,
		owner => nagios,
		group => nagios,
		recurse => true,
		mode  => 664,
		source => 'puppet:///modules/nagios-server/etc',
		audit => content,
		notify => Exec["Bounce nagios"],
	}

	file { '/usr/local/nagios/libexec':
		ensure => directory,
		owner => nagios,
		group => nagios,
		recurse => true,
		mode  => 755,
		source => 'puppet:///modules/nagios-server/libexec',
		audit => content,
		notify => Exec["Bounce nagios"],
	}

	service { 'nagios':
		ensure => 'running',
	}

	exec { 'Bounce nagios':
		user => root,
		refreshonly => true,
		command => '/bin/systemctl restart apache2; /bin/systemctl restart nagios',
	}
}
