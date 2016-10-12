#!/bin/bash

/bin/echo "10.0.48.1            puppet.ks.vimro.com puppet soc-puppet" >> /etc/hosts
/usr/bin/puppet agent --enable
/usr/bin/puppet agent -t
