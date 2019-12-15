class proxy::install {
  package { "nginx":
    ensure => present,
  }
}
