pun - pacman update notifier
============================

systemd service that sends an email if your system has pending updates.


Features
--------

- small bash-script (may be used as a cronjob)
- systemd-unit with timer
- aur support with `package-query`


Usage
-----
```
Usage: pun [arg1] [arg2]
    -p    Use pacman
    -n    Send no mail

If package-query is installed, it will be the default package-manager for pun
```

Install
-------

- To run pun automatically once a day use the systemd-timer
    
        sudo systemctl start pun.timer
        sudo systemctl enable pun.timer


TODO
----

- sendmail integration
- install and usage instructions in README
- cron example
- PKGBUILD


Errors
----
- `Error: cannot update database`
    - use sudo
    - check internet-connection
- `Error: cannot find pacman. Your system is weird!`
    - do you have pacman or package-query?
    - wrong distro?
- `Error: cannot fetch update list`
    - check internet-connection 


License
-------

(c) 2015 Bernd Busse, Daniel Jankowski  
The GNU Lesser General Public License 3 (LGPLv3).  
See [LICENSE](./LICENSE) for details.

