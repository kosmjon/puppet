class s3cmd::config {
  File {
    owner   => "root",
    group   => "root",
    mode    => 644,
    require => Package["s3cmd"],
  }

  file { "s3cfg":
    path    => "/root/.s3cfg",
    ensure  => file,
    content => template("s3cmd/s3cfg.erb"),
  }
}
