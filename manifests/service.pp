class samba_server::service (
  Boolean $service_manage = true,
) {
  if $service_manage {
    service {'smbd':
      require => Class['samba_server::config'],
      ensure => running,
      enable => true,
    }
  }
}
