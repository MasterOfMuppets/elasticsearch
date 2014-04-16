# set defaults for file ownership/permissions
File {
  owner => 'root',
  group => 'root',
  mode  => '0644',
}


exec { "apt-get-update" :
  command     => "/usr/bin/apt-get update"
}

class { 'elasticsearch': 
  package_url => 'https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.0.1.deb',
  config                   => {
     'node'                 => {
       'name'               => 'elasticMuppet'
     },
     'index'                => {
       'number_of_replicas' => '0',
       'number_of_shards'   => '5'
     }
  }
}

#class { 'apache': }

#apache::vhost { 'master.of.muppets':
#  port    => '80',
#  docroot => '/var/www'
#}

Class['java7'] -> Class['elasticsearch']

include stdlib
include apt
include apache
include curl
include java7
include elasticsearch
