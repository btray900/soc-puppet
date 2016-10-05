class filebeats {
	file { '/tmp/filebeat_1.2.2_amd64.deb':
		ensure => present,
		source => 'puppet:///modules/filebeats/filebeat_1.2.2_amd64.deb',
	}
}
