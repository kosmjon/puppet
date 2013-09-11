# baseline::packages
#
# Some packages we would like installed on all systems.
class baseline::packages {
	$packages = [
    'ant',
    'apache-ivy',
    'emacs',
    'xterm',
    "xorg-x11-xauth.${architecture}",
    "xorg-x11-server-utils.${architecture}",
    'xfsprogs',
    'expect',
    'git',
	]

  package { $packages: ensure => installed }
}

