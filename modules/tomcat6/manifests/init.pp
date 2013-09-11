# Install and configure the tomcat applications server.
class tomcat (
  $tomcat_user      = 'tomcat',
  $shutdown_wait    = '30',
  $shutdown_verbose = 'false',
  $connector_port   = '8080',
  $java_opts        = ''
) {
	include tomcat::packages
	include tomcat::services
	
  file { '/etc/sysconfig/tomcat6':
    content => template('tomcat/tomcat6.sysconfig'),
    notify  => Service['tomcat6'],
  }
}

