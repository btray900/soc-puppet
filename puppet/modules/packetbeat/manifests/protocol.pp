#
define packetbeat::protocol (
    $config = {}
) {

    $defaults = $packetbeat::params::protocols

    if (! has_key($defaults, $name)) {
        fail("\"${name}\" is not a valid protocol")
    }

    $conf = deep_merge($defaults[$name], $config)

    concat::fragment { "protocol_${name}":
        target  => $packetbeat::configfile,
        order   => 21,
        content => template('packetbeat/config/21_protocol.erb'),
    }

}