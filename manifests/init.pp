# @summary
#   Guides the basic setup and installation of Samba on your system.
#
# When this class is declared with the default options, Puppet:
# - Installs the appropriate Samba software package.
# - Places the required configuration files in a directory.
# - Starts the Samba service.
#
# @example
#   class { 'samba': }
#
# @param config_manage
#   Indicates if config files should be manage by puppet.
#
# @param package_manage
#   Indicates if package instalation should be manage by puppet.
#
# @param service_manage
#   Indicates if service execution should be manage by puppet.
#
# @param share_definitions
#   Configures shared directories
#
class samba_server (
  Boolean $config_manage      = true,
  Boolean $package_manage     = true,
  Boolean $service_manage     = true,
  Array   $share_definitions  = [],
) {
  contain samba_server::config
  contain samba_server::install
  contain samba_server::service
}
