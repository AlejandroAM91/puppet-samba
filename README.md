# Samba Server
Puppet module to installs, configure, and manage samba server.

1. [Description](#description)
2. [Setup - The basics of getting started with samba server](#setup)
    * [Beginning with samba server](#beginning-with-samba-server)

## Description

[Samba](https://www.samba.org/) is a free software re-implementation of the SMB networking protocol. Samba provides file and print services for various Microsoft Windows clients and can integrate with a Microsoft Windows Server domain, either as a Domain Controller (DC) or as a domain member. As of version 4, it supports Active Directory and Microsoft Windows NT domains.

This module will help you to installs, configure, and manage samba server.

## Setup

### Beginning with samba server

To have Puppet install samba server with the default parameters, declare the `samba_server` class:

```puppet
class { 'samba_server': }
```

When this class is declared with the default options, Puppet:
* Installs the appropriate Samba software package.
* Places the required configuration files in a directory.
* Starts the Samba service.
