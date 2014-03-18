class webinar::web {

  user { 'wordpress':
    ensure => present,
    home   => '/opt/wordpress',
  }


  class { 'apache':
    default_vhost => false,
  }

  include apache::mod::php

  apache::vhost { 'web.c.puppet-forge-eval.internal':
    port          => '443',
    ssl           => true,
    docroot       => '/opt/wordpress',
    docroot_owner => 'wordpress',
    docroot_group => 'wordpress',
  }
  
  apache::vhost { 'health.check':
    port    => '80',
  }
  
  firewall { '100 allow http and https access':
    port   => [443, 80],
    proto  => tcp,
    action => accept,
  }

}