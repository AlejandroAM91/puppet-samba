class samba_server::service (
  Boolean $service_manage = true,
) {
  if $service_manage {
    service {'smbd':
      ensure  => running,
      enable  => true,
      require => Class['samba_server::config'],
    }
  }
}
