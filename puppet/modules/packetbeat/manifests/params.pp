# == Class packetbeat::params
#
# === Parameters
#
# This class does not provide any parameters.

#
# === Examples
#
# This class is not intended to be used directly.
class packetbeat::params {

    $configfile = '/etc/packetbeat/packetbeat.yml'

    $ensure = 'present'

    $status = 'enabled'

    $device = 'any'

    $sniffer = {
        device => 'any'
    }

    $protocols = {
        dns => {
            ports => [53],
            send_request => false,
            send_response => false,
            include_authorities => false,
            include_additionals => false,
        },
        http => {
            ports => [80,8080,8000,5000,8002],
            send_request => false,
            send_response => false,
            hide_keywords => [],
            send_headers => [],
        },
        memcache => {
            ports => [11211],
            send_request => false,
            send_response => false,
            parseunknown => false,
            maxvalues => 0,
            maxbytespervalue => 'unlimited',
            udptransactiontimeout => 200,
        },
        mysql => {
            ports => [3306],
            send_request => false,
            send_response => false,
        },
        pgsql => {
            ports => [5432],
            send_request => false,
            send_response => false,
        },
        redis => {
            ports => [6379],
            send_request => false,
            send_response => false,
        },
        thrift => {
            ports => [9090],
            send_request => false,
            send_response => false,
        },
        mongodb => {
            ports => [27017],
            send_request => false,
            send_response => false,
        }
    }

    $procs = {
        mysqld => 'mysqld',
        pgsql => 'postgres',
        nginx => 'nginx'
    }

    $output = {
        elasticsearch => {
            enabled => false
        },
        logstash => {
            enabled => true,
            hosts => ['logstash.cp.vimro.com:5044'],
            worker => 1,
            loadbalance => false,
            port => 5044,
            index => 'packetbeat',
            tls => {},
            timeout => 30,
            max_retries => 3
        },
        file => {
            enabled => false,
            path => '/tmp/packetbeat',
            filename => 'packetbeat',
            rotate_every_kb => 10000,
            number_of_files => 7
        }
    }

    $shipper = {
        name => $fqdn,
        tags => [],
        ignore_outgoing => false,
        refresh_topology_freq => 10,
        topology_expire => 15,
    }

    $logging = {
        to_syslog => true,
        to_files => false,
        files => {
            path => '/var/log/mybeat',
            name => 'mybeat',
            rotateeverybytes => 10485760,
            keepfiles => 7
        },
        selectors => [],
        level => 'error'
    }
}
