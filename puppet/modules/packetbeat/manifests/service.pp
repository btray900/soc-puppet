#
class packetbeat::service (
  $ensure             = $packetbeat::ensure
){
  
  service { 'packetbeat':
    ensure => 'running',
    enable => true
  }
  
}