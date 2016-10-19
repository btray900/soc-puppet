#!/bin/bash

/usr/bin/rsync -av ~/soc-puppet/puppet/modules/ /etc/puppet/modules
/usr/bin/rsync -av ~/soc-puppet/puppet/manifests/ /etc/puppet/manifests

/bin/cp ~/soc-puppet/pxe/default /var/lib/tftpboot/pxelinux.cfg/default

/usr/bin/rsync -av ~/soc-puppet/www/* /var/www/html/
