#!/bin/bash

echo "### DHCPD IS:"
/bin/systemctl is-active isc-dhcp-server
echo ""
echo "### TFTPD IS:"
/bin/systemctl is-active tftpd-hpa
echo ""
echo "### APACHE IS:"
/bin/systemctl is-active apache2
echo ""
echo "### PUPPETMASTER IS: "
/bin/systemctl is-active puppetmaster
echo ""
echo "### LOCALHOST IN PUPPET?"
puppet cert list --all | grep soc-puppet
echo ""
echo "### PRESEED REACHABLE?"
curl http://10.0.48.1/preseed/haproxy01.cfg | grep late_command
echo ""
echo "### ISO MOUNTED TO WEB DIR?"
df -h | grep www
echo ""
echo "### LINUX CD FILES REACHABLE"
curl http://10.0.48.1/ubuntu/16.04.1/install/ | grep squashfs
echo ""
echo "### ROUTING OK?"
netstat -rn
echo ""
ping -c 2 8.8.8.8
echo ""
echo "### DNS WORKS?"
dig A us.archive.ubuntu.com @8.8.8.8 +short
echo ""
echo "FIX ANYTHING NOT WORKING!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
