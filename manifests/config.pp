class samba::config {
  if $samba::config_manage {
    $share_definitions = [
      {
        name => 'public',
        path => '/srv/public',
      }
    ]

    $share_definitions.each |$index, $value| {
      file {$value[path]:
        ensure => directory,
        mode => "1777",
      }
    }

    file { '/etc/samba/smb.conf':
      require => Class['samba::install'],
      ensure => present,
      content => epp('samba/smb.conf.epp', {
        share_definitions => $share_definitions
      })
    }
  }
}
