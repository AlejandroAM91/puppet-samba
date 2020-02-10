class samba_server::config (
  Boolean $config_manage     = true,
  Array   $share_definitions = [],
) {
  if $config_manage {
    $share_definitions.each |$index, $value| {
      file {$value[path]:
        ensure => directory,
        mode => '1777',
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
