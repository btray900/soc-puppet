class postfix {

	package { 'postfix':
		ensure => present,
		before => File['/etc/postfix/main.cf'],
	}

	service { 'postfix':
		ensure => running,
		require => Package['postfix'],
	}

	file { '/etc/postfix/main.cf':
		owner => root,
		group => root,
		mode  => 644,
		audit => content,
		content => template('postfix/main.cf.erb'),
		require => Package['postfix'],
		notify => Exec["Bounce PostFix"],
	}

	exec { 'Bounce PostFix':
		user => root,
		refreshonly => true,
		command => '/bin/systemctl restart postfix',
	}
}
