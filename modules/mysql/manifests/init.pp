class mysql {
  $password = "root"
  $mysql_server = "mysql55-server.${architecture}"
  package { $mysql_server: ensure => installed }

  exec { "Set MySQL server root password":
    subscribe => [ Package[$mysql_server]],
    refreshonly => true,
    unless => "mysqladmin -uroot -p$password status",
    path => "/bin:/usr/bin",
    command => "mysqladmin -uroot password $password",
  }
}
