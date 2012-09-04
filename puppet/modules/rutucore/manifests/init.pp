class rutucore {
  file {
    ["/var/www/",
     "/var/www/rutucore/",
     "/var/www/rutucore/releases",
     "/var/www/rutucore/shared/",
     "/var/www/rutucore/shared/config/"]:
       ensure => directory,
       owner => ubuntu,
       group => ubuntu,
       mode => 775,
  }

  file {
    "/var/www/rutucore/shared/config/config.yml":
       owner => ubuntu,
       group => ubuntu,
       mode => 644,
       source => "puppet:///modules/rutucore/config.yml";
  }


  group { "deploy":
    ensure => 'present',
  }

  user { "deploy":
     gid => 'deploy',
     comment => 'The deployment user',
     managehome => 'true',
     ensure => 'present',
     shell => '/bin/bash',
     require => Group['deploy'],
  }

  package {
    "bundler":
      provider => gem,
  }

  package {
    "eventmachine":
      provider => gem,
  }

}
