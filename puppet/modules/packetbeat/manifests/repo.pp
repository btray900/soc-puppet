#
class packetbeat::repo {

  case $::osfamily {
    'RedHat': {
      yumrepo { 'elastic-beats':
        descr    => 'Elastic Beats Repository',
        baseurl  => 'https://packages.elastic.co/beats/yum/el/$basearch',
        gpgcheck => 1,
        gpgkey   => 'https://packages.elastic.co/GPG-KEY-elasticsearch',
        enabled  => 1,
      }
    }
    default: {
      fail("\"${module_name}\" provides no repository information for OSfamily \"${::osfamily}\"")
    }
  }

}