class redis {
  package {
    "redis-server":
      ensure => present,
  }
}