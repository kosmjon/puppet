#! /bin/bash
echo "[puppetlabs]
name=Puppet Labs Packages
baseurl=http://yum.puppetlabs.com/el/6/dependencies/x86_64/
enabled=1
gpgcheck=0
[puppetlabs-puppet]
name=Puppet Labs Packages
baseurl=http://yum.puppetlabs.com/el/6/products/x86_64/
enabled=1
gpgcheck=0" > /etc/yum.repos.d/puppet.repo
rpm -Uvh http://mirror.metrocast.net/fedora/epel/6/i386/epel-release-6-7.noarch.rpm
yum -y install puppet
