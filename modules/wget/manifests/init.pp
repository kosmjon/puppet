class wget {
  package { "wget": ensure => latest }
}

define wget::fetch ($source, $destination) {
  exec { "wget-$name":
    command => "/usr/bin/wget --output-document=$destination $source",
    creates => "$destination"
  }
}

define download ($uri, $timeout = 300) {
  exec { "download $uri":
    command => "/usr/bin/wget -q '$uri' -O $name",
    creates => $name,
    timeout => $timeout,
    require => Package["wget"],
  }
}