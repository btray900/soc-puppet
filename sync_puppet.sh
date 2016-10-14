#!/bin/bash

/bin/cp -R ~/soc-puppet/puppet/modules/* /etc/puppet/modules/
/bin/cp -R ~/soc-puppet/puppet/manifests/* /etc/puppet/manifests/

/bin/cp ~/soc-puppet/pxe/default /var/lib/tftpboot/pxelinux.cfg/default

#/bin/cp -R ~/soc-puppet/www/kibana/* /var/www/html/kibana/
/bin/cp -R ~/soc-puppet/www/preseed/* /var/www/html/preseed/
