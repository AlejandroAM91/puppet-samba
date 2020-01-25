class samba_server::install {
  if $samba_server::package_manage {
    package {'samba':
      ensure => present,
    }
  }
}
