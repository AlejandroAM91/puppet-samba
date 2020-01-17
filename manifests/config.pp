class samba::config {
  file{'/etc/samba/smb.conf':
    ensure => present,
    content => epp('samba/samba.conf.epp'),
    require => Class['samba::install'],
  }
}
