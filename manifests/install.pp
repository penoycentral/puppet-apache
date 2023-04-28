# @summary
# Installs Apache base packages
#
class apache::install {
  package { 'httpd':
    ensure => present,
  }
}
