class samba::config {
  if $samba::config_manage {
    file { '/etc/samba/smb.conf':
        require => Class['samba::install'],
        ensure => present,
        content => epp('samba/smb.conf.epp')
    }
  }
}
