class nxserver inherits baseline {
  download {"/tmp/nxclient-3.5.0-7.x86_64.rpm":
    uri => "http://web04.nomachine.com/download/3.5.0/Linux/nxclient-3.5.0-7.x86_64.rpm",
  }  
  download {"/tmp/nxnode-3.5.0-9.x86_64.rpm":
    uri => "http://web04.nomachine.com/download/3.5.0/Linux/nxnode-3.5.0-9.x86_64.rpm",
  }  
  download {"/tmp/nxserver-3.5.0-11.x86_64.rpm":
    uri => "http://web04.nomachine.com/download/3.5.0/Linux/FE/nxserver-3.5.0-11.x86_64.rpm",
  }  
}