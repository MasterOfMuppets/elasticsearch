# set defaults for file ownership/permissions
File {
  owner => 'root',
  group => 'root',
  mode  => '0644',
}


exec { "apt-get-update" :
  command     => "/usr/bin/apt-get update"
}

#include curl
#include psp
include java7
