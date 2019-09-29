vsftpd
=========

Setup vsftpd on Ubuntu servers.

This role will setup FTP service using passive mode so we need to specify passive port range

Requirements
------------

None

Role Variables
--------------

4 variables for this role:

* FTP_USER: ftpuser
* FTP_PASSWORD: password
* PASV_MIN_PORT: 10100
* PASV_MAX_PORT: 10150

Dependencies
------------

None

Example Playbook
----------------

Edit in target.yml

    - hosts: someGroups
      roles:
         - vsftpd

License
-------

BSD

Author Information
------------------

duy.nguyen@shopee.com
