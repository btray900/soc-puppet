class ssh-keys {
	exec { 'root keys':
		user    => root,
		group   => root,
		command => '/bin/mkdir /root/.ssh',
		creates => '/root/.ssh',
	}

	exec { 'betraz keys':
		user    => betrayz,
		group   => betrayz,
		command => '/bin/mkdir /home/betrayz/.ssh', 
		creates => '/home/betrayz/.ssh',
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

	file { '/home/betrayz/.ssh/id_rsa':
        	owner   => betrayz,
        	group   => betrayz,
        	mode    => 600,
		source  => 'puppet:///modules/ssh-keys/id_rsa.betrayz.priv',
    	}

	file { '/home/betrayz/.ssh/id_rsa.pub':
        	owner   => betrayz,
        	group   => betrayz,
        	mode    => 644,
		source  => 'puppet:///modules/ssh-keys/id_rsa.betrayz.pub',
	}

	file { '/home/betrayz/.ssh/authorized_keys':
        	owner   => betrayz,
        	group   => betrayz,
        	mode    => 600,
		source  => 'puppet:///modules/ssh-keys/authorized_keys.betrayz',
    	}
}
