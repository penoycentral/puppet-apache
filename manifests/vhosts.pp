# @summary A short summary of the purpose of this defined type.
#
# A description of what this defined type does
#
# @example
#   apache::vhosts { 'namevar': }
define apache::vhosts (
  Integer   $port,
  String[1] $subdomain,
  String    $admin,
  String[1] $docroot,
) {
  file { "${docroot}":
    ensure  => 'directory',
    owner   => $apache::vhost_owner,
    group   => $apache::vhost_group,
  }
  
  file { "${apache::vhosts_dir}/${subdomain}.conf":
    ensure  => 'file',
    owner   => $apache::vhost_owner,
    group   => $apache::vhost_group,
    mode    => '0644',
    content => epp('apache/vhosts.conf.epp', {'port' => $port, 'subdomain' => $subdomain, 'admin' => $admin, 'docroot' => $docroot}),
    notify  => Service['apache_service'],
  }

  
  
}
