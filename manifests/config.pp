class proxy::config (
  $access_log                = '/var/log/nginx/access.log',
  $config_file               = '/etc/nginx/nginx.conf',
  $docroot                   = '/usr/share/nginx/html',
  $error_log                 = '/var/log/nginx/error.log',
  $mime_include              = '/etc/nginx/mime.types',
  $pid_file                  = '/run/nginx.pid',
  $port_http                 = 80,
  $port_https                = 443,
  $server_name               = 'domain.com',
  $first_backend_https       = '10.10.10.10',
  $second_backend_https      = '20.20.20.20',
  $ssl_certificate           = '/etc/nginx/localhost.crt',
  $ssl_certificate_key       = '/etc/nginx/localhost.key',
  $ssl_session_cache         = 'shared:SSL:1m',
  $ssl_session_timeout       = '10m',
  $ssl_ciphers               = 'HIGH:!aNULL:!MD5',
  $ssl_prefer_server_ciphers = 'on',
  $user			     = 'www-data',
  $worker_connections        = 1024,
  $worker_processes          = 'auto',
){
  file { $config_file:
    ensure  => file,
    content => template('proxy/nginx.conf.erb'),
    owner   => $user,
    require => Class["proxy::install"],
    notify => Class["proxy::service"],
  }
  exec {'create_self_signed_sslcert':
    command => "openssl req -newkey rsa:2048 -nodes -keyout ${ssl_certificate_key} -x509 -days 365 -out ${ssl_certificate} -subj '/CN=${::fqdn}'",
    onlyif  => "test ! -f ${ssl_certificate_key} && test ! -f ${ssl_certificate}",
    path    => ["/usr/bin", "/usr/sbin"]
  }
}
