class packetbeat (
    $ensure = $packetbeat::params::ensure,
    $status = $packetbeat::params::status,
    $manage_repo = false,
    $configfile = $packetbeat::params::configfile,
    $sniffer = {},
    $output = {},
    $shipper = {},
    $logging = {}
) inherits packetbeat::params {

    ### Validate input ###

    # output
    validate_hash($output)

    ###
    if ($manage_repo == true) {
        include packetbeat::repo
    }
    include packetbeat::package
    include packetbeat::config
    include packetbeat::service
}
