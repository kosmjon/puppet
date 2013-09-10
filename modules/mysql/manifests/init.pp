class mysql {
  $password = "root"
  $mysql_server = "mysql55-server.${architecture}"
  package { $mysql_server: ensure => installed }

  service {"mysqld":
    ensure => 'running',
    enable => true,
    before => Package[$mysql_server],
  }
  ->
  exec { "Set MySQL server root password":
    refreshonly => true,
    unless => "mysqladmin -uroot -p$password status",
    path => "/bin:/usr/bin",
    command => "mysqladmin -uroot password $password",
  }
}
