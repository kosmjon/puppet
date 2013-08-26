class java7::props {
  $jdkVerS = '7u25'
  $jdkVerL = '7u25-b15'
  $jdkFolder  = 'jdk1.7.0_25'
}

class java7 inherits java7::props {
  
  file { "oracle-java.sh":
    path    => "/etc/profile.d/oracle-java.sh",
    ensure  => file,
    source => "puppet:///modules/java7/oracle-java.sh",
    mode => 0755, owner => 'root', group => 'root', 
  }
  -> 
  file { "java-setup.sh":
    path    => "/tmp/java-setup.sh",
    ensure  => file,
    content => template("java7/java-setup.sh.erb"),
    mode => 0755, owner => 'root', group => 'root', 
  } 
  ->
  exec { "download-java7":
    command => "/usr/bin/wget --no-cookies --no-check-certificate --header 'Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com' 'https://edelivery.oracle.com/otn-pub/java/jdk/${jdkVerL}/jdk-${jdkVerS}-linux-x64.rpm' -O /tmp/jdk-${jdkVerS}7u25-linux-x64.rpm",
    creates => "/tmp/jdk-${jdkVerS}-linux-x64.rpm",
  } 
  ->
  exec { "unpack-java7":
    command => "/usr/bin/yum -y install /tmp/jdk-${jdkVerS}-linux-x64.rpm",
    creates => "/usr/java/${jdkFolder}",
  }
  ->
  exec {"enable-java":
    command => "/tmp/java-setup.sh",
  }
}

class java7::remove inherits java7::props {
  exec {"remove java":
    command => "/usr/bin/rpm -e jdk-1.7.0_25-fcs.x86_64",
    onlyif => ["/usr/bin/test -f /usr/java/${jdkFolder}"],
  }
  
  file {
    '/etc/profile.d/oracle-java.sh':
    ensure => absent;
    
    '/tmp/java-setup.sh':
    ensure => absent
  }
}
