class yum {  
  File {
    mode => 644,
    owner =>"root",
    group =>"root",
  }
  
  exec {"enable EPEL":
    command => "/bin/cp /etc/yum.repos.d/epel.repo /etc/yum.repos.d/epel.repo.unedited; /bin/sed 's/^enabled=0/enabled=1/' </etc/yum.repos.d/epel.repo.unedited >/etc/yum.repos.d/epel.repo",
    creates => "/etc/yum.repos.d/epel.repo.unedited"
  }
  ->
  exec {"s3tools repo":
    command => "/usr/bin/wget -O /etc/yum.repos.d/s3tools.repo http://s3tools.org/repo/RHEL_6/s3tools.repo",
    creates => "/etc/yum.repos.d/s3tools.repo",
  }
  ->
  exec {"fetch glusterfs repo":
    command => "/usr/bin/wget -O /etc/yum.repos.d/glusterfs-epel.repo.unedited http://download.gluster.org/pub/gluster/glusterfs/3.3/3.3.1/EPEL.repo/glusterfs-epel.repo",
    creates => "/etc/yum.repos.d/glusterfs-epel.repo.unedited",
  }
  ->  
  # $releasever is a yum variable and is set to 'latest' on AWS Linux replace with '6'
  exec {"adjust glusterfs repo":  
    command => "/bin/sed 's/-\$releasever/-6/g' </etc/yum.repos.d/glusterfs-epel.repo.unedited >/etc/yum.repos.d/glusterfs-epel.repo",
    # needs onlyif
  }
}

# Break this out since it can take a while to run -- perhaps there's a better way to trigger it onlyif the repos.d folder is actually changed
class yum::update {
  exec {"update yum":
    command => "/usr/bin/yum -y update"
  }
}