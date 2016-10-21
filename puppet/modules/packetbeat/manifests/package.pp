#
class packetbeat::package ($ensure = $packetbeat::ensure) {

	file { '/tmp/packetbeat_1.3.1_amd64.deb':
		source => 'puppet:///modules/packetbeat/packetbeat_1.3.1_amd64.deb',
		before => Package["packetbeat"],
	}

	exec { 'InstallPacketbeat':
		require => File["/tmp/packetbeat_1.3.1_amd64.deb"],
		before => Package["packetbeat"],
		user => root,
		command => '/usr/bin/dpkg -i /tmp/packetbeat_1.3.1_amd64.deb',
	}

	package { 'packetbeat':
		require => File["/tmp/packetbeat_1.3.1_amd64.deb"],
		ensure => $ensure,
	}
}
