class samba_server::service {
  if $samba_server::service_manage {
    service {'smbd':
      require => Class['samba_server::config'],
      ensure => running,
      enable => true,
    }
  }
}
