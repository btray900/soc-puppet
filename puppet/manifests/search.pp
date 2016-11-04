node 'search01.ks.vimro.com' {
	include hosts
	include ssh-keys
	include postfix
	include openjdk
	include certs
	include nagios-client

        class { '::ntp':
                servers => ['10.0.48.1'],
        }

	class { 'networking': 
		source => 'puppet:///modules/networking/search01.interfaces',
	}

	class { 'elasticsearch_v5':
		unicast_hosts => '["search02.cp.vimro.com","search03.cp.vimro.com","search04.cp.vimro.com","search05.cp.vimro.com","search06.cp.vimro.com"]',
		network_host => '172.16.49.21',
		node_master => 'true',
		node_data => 'false',
	}
}
