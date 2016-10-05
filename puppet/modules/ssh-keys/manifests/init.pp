class ssh-keys {
	exec { 'root keys':
		user    => root,
		group   => root,
		command => '/bin/mkdir /root/.ssh',
		creates => '/root/.ssh',
	}

	exec { 'betraz keys':
		user    => socadmin,
		group   => socadmin,
		command => '/bin/mkdir /home/socadmin/.ssh', 
		creates => '/home/socadmin/.ssh',
	}

	file { '/root/.ssh/id_rsa':
	        owner   => root,
        	group   => root,
        	mode    => 600,
		source  => 'puppet:///modules/ssh-keys/id_rsa.root.priv',
    	}

	file { '/root/.ssh/id_rsa.pub':
        	owner   => root,
        	group   => root,
        	mode    => 644,
		source  => 'puppet:///modules/ssh-keys/id_rsa.root.pub',
    	}

	file { '/root/.ssh/authorized_keys':
        	owner   => root,
        	group   => root,
        	mode    => 644,
		source  => 'puppet:///modules/ssh-keys/authorized_keys.root',
    	}

	file { '/home/socadmin/.ssh/id_rsa':
        	owner   => socadmin,
        	group   => socadmin,
        	mode    => 600,
		source  => 'puppet:///modules/ssh-keys/id_rsa.socadmin.priv',
    	}

	file { '/home/socadmin/.ssh/id_rsa.pub':
        	owner   => socadmin,
        	group   => socadmin,
        	mode    => 644,
		source  => 'puppet:///modules/ssh-keys/id_rsa.socadmin.pub',
	}

	file { '/home/socadmin/.ssh/authorized_keys':
        	owner   => socadmin,
        	group   => socadmin,
        	mode    => 600,
		source  => 'puppet:///modules/ssh-keys/authorized_keys.socadmin',
    	}
}
