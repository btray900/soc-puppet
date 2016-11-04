node 'generic.ks.vimro.com' {
	include hosts
	include ssh-keys
	include postfix
	include openjdk
	include certs
	include filebeats
	include nagios-client

	class { 'networking': 
		source => 'puppet:///modules/networking/generic.interfaces',
	}

        class { '::ntp':
                servers => ['10.0.48.1'],
        }
}
