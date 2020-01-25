class samba_server::config {
  if $samba_server::config_manage {
    $share_definitions = $samba_server::share_definitions

    $share_definitions.each |$index, $value| {
      file {$value[path]:
        ensure => directory,
        mode => "1777",
      }
    }

    file { '/etc/samba/smb.conf':
      require => Class['samba_server::install'],
      notify  => Class['samba_server::service'],
      ensure  => present,
      content => epp('samba_server/smb.conf.epp', {
        share_definitions => $share_definitions
      })
    }
  }
}
