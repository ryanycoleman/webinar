class webinar::db {
 
	mysql::db { 'wordpress':
	  user     => 'wordpress',
	  password => 'reductive',
	  host     => 'web%',
	  grant    => ['ALL'],
	}
	
	firewall { '100 allow mysqld access':
    port   => [3306],
    proto  => tcp,
    action => accept,
  }
  
}