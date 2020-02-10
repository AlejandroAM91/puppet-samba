class samba_server::install (
  Boolean $package_manage = true,
) {
  if $package_manage {
    package {'samba':
      ensure => present,
    }
  }
}
