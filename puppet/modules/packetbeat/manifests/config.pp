#
class packetbeat::config {

    concat { $packetbeat::configfile:
      notify => Service['packetbeat']
    }

    $sniffer_conf = deep_merge($packetbeat::params::sniffer, $packetbeat::sniffer)

    concat::fragment { 'sniffer':
        target  => $packetbeat::configfile,
        order   => 10,
        content => template('packetbeat/config/10_sniffer.erb'),
    }

    concat::fragment { 'protocols_header':
        target  => $packetbeat::configfile,
        order   => 20,
        content => template('packetbeat/config/20_protocols_header.erb'),
    }

    concat::fragment { 'procs_header':
        target  => $packetbeat::configfile,
        order   => 30,
        content => template('packetbeat/config/30_procs_header.erb'),
    }

    $output_conf = deep_merge($packetbeat::params::output, $packetbeat::output)

    concat::fragment { 'output':
        target  => $packetbeat::configfile,
        order   => 40,
        content => template('packetbeat/config/40_output.erb'),
    }

    $shipper_conf = deep_merge($packetbeat::params::shipper, $packetbeat::shipper)

    concat::fragment { 'shipper':
        target  => $packetbeat::configfile,
        order   => 50,
        content => template('packetbeat/config/50_shipper.erb'),
    }

    $logging_conf = deep_merge($packetbeat::params::logging, $packetbeat::logging)

    concat::fragment { 'logging':
        target  => $packetbeat::configfile,
        order   => 60,
        content => template('packetbeat/config/60_logging.erb'),
    }

}