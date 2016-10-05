class sysctl ( $source ) {
	file { '/etc/sysctl.conf':
		source      => $source,
		audit       => content,
		notify      => Exec["Bounce sysctl"],
	}

	exec { "Bounce sysctl":
		user        => root,
		command     => '/sbin/sysctl -p',
		refreshonly => true,
	}
}
