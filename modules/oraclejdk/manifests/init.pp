# Install Oracle JDK.
class oraclejdk inherits oraclejdk::params {
	include oraclejdk::packages
	include oraclejdk::services
	include oraclejdk::config

#  $jdk_url = "http://download.oracle.com/otn-pub/java/jdk/7u3-b04/jdk-7u3-linux-x64.rpm"
  $jdk_url = "https://edelivery.oracle.com/otn-pub/java/jdk/${jdkVerL}/jdk-${jdkVerS}-linux-x64.rpm"
  $wget_opts = "--no-cookies --no-check-certificate --header 'Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com'"

  package { 'wget': ensure => installed }

  exec { 'download-jdk':
    require => Package['wget'],
    command => "/usr/bin/wget $wget_opts -O /var/tmp/jdk.rpm $jdk_url",
    creates => "/var/tmp/jdk.rpm",
  }

  exec { 'install-jdk':
    require => Exec['download-jdk'],
    command => '/usr/bin/yum -y -d0 install /var/tmp/jdk.rpm',
    unless  => '/bin/rpm -q jdk',
  }

  file { '/etc/profile.d':
    source  => 'puppet:///modules/oraclejdk/profile.d',
    recurse => true,
    owner   => root,
    group   => root,
    mode    => 0644,
  }
}

