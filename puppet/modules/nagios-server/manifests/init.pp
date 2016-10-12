class nagios-server {

	file { '/usr/local/nagios/etc/servers/hosts.cfg':
		owner => nagios,
		group => nagios,
		mode  => 644,
		content => file('nagios-server/hosts.cfg'),
	}

	file { '/usr/local/nagios/etc/servers/host_groups.cfg':
		owner => nagios,
		group => nagios,
		mode  => 644,
		content => file('nagios-server/host_groups.cfg'),
	}

	file { '/usr/local/nagios/etc/servers/service_definitions.cfg':
		owner => nagios,
		group => nagios,
		mode  => 644,
		content => file('nagios-server/service_definitions.cfg'),
	}

}
