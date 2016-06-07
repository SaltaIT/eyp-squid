class squid::service inherits squid {

  #
  validate_bool($squid::manage_docker_service)
  validate_bool($squid::manage_service)
  validate_bool($squid::service_enable)

  validate_re($squid::service_ensure, [ '^running$', '^stopped$' ], "Not a valid daemon status: ${squid::service_ensure}")

  if(getvar('::eyp_docker_iscontainer')==undef or
      getvar('::eyp_docker_iscontainer')==false or
      getvar('::eyp_docker_iscontainer') =~ /false/ or
      $squid::manage_docker_service)
  {
    if($squid::manage_service)
    {
      #service or exec here
    }
  }
}
