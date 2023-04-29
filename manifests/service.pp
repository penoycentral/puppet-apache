# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include apache::service
class apache::service {
  service { "${apache::service_name}":
    alias      => 'apache_service',
    ensure     => $apache::service_ensure,
    enable     => $apache::service_enable,
    hasrestart => true,
    audit      => ['name', 'ensure', 'hasrestart'] 
  }
}
