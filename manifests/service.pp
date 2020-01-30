class samba::service {
    service {'smbd':
        require => Class['samba::config'],
        ensure => running,
        enable => true,
    }
}
