class samba::install {
  if $samba::package_manage {
    package {'samba':
      ensure => present,
    }
  }
}
