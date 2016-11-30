class squid::params {

  $package_name = 'squid'

  $config_dir = '/etc/squid'

  case $::osfamily
  {
    'redhat':
    {
      $service_name = 'squid'
      $config_file = '/etc/squid/squid.conf'
      case $::operatingsystemrelease
      {
        /^[5-6].*$/:
        {
          $builtin_acls = false
          $client_package_name = undef
        }
        /^7.*$/:
        {
          $builtin_acls = true
          $client_package_name = undef
        }
        default: { fail("Unsupported RHEL/CentOS version! - ${::operatingsystemrelease}")  }
      }
    }
    'Debian':
    {
      $service_name = 'squid3'
      $config_file = '/etc/squid3/squid.conf'
      case $::operatingsystem
      {
        'Ubuntu':
        {
          case $::operatingsystemrelease
          {
            /^14.*$/:
            {
              $builtin_acls = true
              $client_package_name = 'squidclient'
            }
            default: { fail("Unsupported Ubuntu version! - ${::operatingsystemrelease}")  }
          }
        }
        'Debian': { fail('Unsupported')  }
        default: { fail('Unsupported Debian flavour!')  }
      }
    }
    default: { fail('Unsupported OS!')  }
  }
}
