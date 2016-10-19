#
define packetbeat::proc (
    $cmdline_grep = undef
) {
    $defaults = $packetbeat::params::procs

    if ($cmdline_grep == undef) {
        if (has_key($defaults, $name)) {
            $grep = $defaults[$name]
        }
        else {
            fail("\"${name}\" is not a valid process")
        }
    }
    else {
        $grep = $cmdline_grep
    }

    concat::fragment { "procs_${name}":
        target  => $packetbeat::configfile,
        order   => 31,
        content => template('packetbeat/config/31_proc.erb'),
    }
}