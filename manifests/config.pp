class samba::config {
    file { '/etc/samba/smb.conf':
        ensure => present,
        require => Class['samba::install'],
        content => epp('samba/smb.conf.epp')
    }
}
