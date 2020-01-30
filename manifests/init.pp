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
class samba (
  Boolean $config_manage = true,
  Boolean $package_manage = true,
  Boolean $service_manage = true,
) {
  contain samba::config
  contain samba::install
  contain samba::service
}
