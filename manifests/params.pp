class squid::params {

  $package_name = 'squid'
  $service_name = 'squid'

  $config_file = '/etc/squid/squid.conf'
  $config_dir = '/etc/squid'

  case $::osfamily
  {
    'redhat':
    {
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
