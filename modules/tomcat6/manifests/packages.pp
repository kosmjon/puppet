# tomcat::packages
#
# This module installs packages for tomcat.
class tomcat::packages {
  $packages = [
    'tomcat6',
  ]

  package { $packages: ensure => installed }
}
