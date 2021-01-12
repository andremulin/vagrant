exec { 'apt-update':
    command => '/usr/bin/apt-get update'
}

package { ['php7.2', 'php7.2-mysql']:
    require => Exec['apt-update'],
    ensure => installed,
}

exec { 'run-php7':
    require => Package['php7.2'],
    command => '/usr/bin/php -S 192.168.0.11:8080 -t /vagrant/src &'
}