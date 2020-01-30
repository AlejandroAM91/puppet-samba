class samba::service {
  if $samba::service_manage {
    service {'smbd':
      require => Class['samba::config'],
      ensure => running,
      enable => true,
    }
  }
}
