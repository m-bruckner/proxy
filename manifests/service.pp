class proxy::service {
  service { "nginx":
    ensure  => running,
    hasstatus => true,
    hasrestart => true,
    enable => true,
    require => Class["proxy::config"],
  }
}
