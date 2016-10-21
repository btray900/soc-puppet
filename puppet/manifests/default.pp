node default {
	include hosts
	include ssh-keys
	include postfix
	include certs
	include filebeats
	include nagios-client
        class {'elastic_filebeat':
                package_file => '/tmp/filebeat_1.2.2_amd64.deb',
                logstash_output_enabled => true,
                logstash_output_hosts => ['logstash.cp.vimro.com:5044']
        }
        elastic_filebeat::prospector{'system_logs':
                paths => ['/var/log/*.log','/var/log/dmesg','/var/log/syslog','/var/log/apt/*.log'],
        }

        class { 'topbeat':
                output => {
                        'logstash'     => {
                                'hosts' => ['logstash.cp.vimro.com:5044'],
                                'loadbalance' => false,
                        },
                },
        }
}
