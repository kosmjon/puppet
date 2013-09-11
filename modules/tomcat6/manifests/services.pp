# tomcat::services
#
# This module manages services for tomcat.
class tomcat::services {
  require("tomcat::packages")

  service { tomcat6:
    ensure => running,
    enable => true,
  }
}
