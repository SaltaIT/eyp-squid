# == Class: squid
#
# === squid::config documentation
#
class squid::config inherits squid {

  file { $squid::params::config_file:
    ensure => 'present',
    owner => 'root',
    group => 'squid',
    mode => '0640',
    content => template("${module_name}/squidconf.erb"),
  }

}
