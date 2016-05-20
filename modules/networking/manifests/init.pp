class networking ( $source ) {
	file { '/etc/network/interfaces':
		audit       => content,
		source      => $source,
		notify      => Exec["Bounce interfaces"],
	}

	exec { 'Bounce interfaces':
		user        => root,
		refreshonly => true,
		command     => '/sbin/ifdown ens160; /sbin/ifup ens160; /sbin/ifdown ens192; /sbin/ifup ens192; /sbin/ifdown ens224; /sbin/ifup ens224',
	}
}
