#!/bin/bash

/bin/echo "10.0.48.1            puppet" >> /etc/hosts
/usr/bin/puppet agent --enable
/usr/bin/puppet agent -t
