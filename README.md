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
Usage: pun [OPTIONS]
    -h      Show this help message
    -p      Force to use pacman
    -n      Send no mail

If package-query is installed, it will be used by default. Force pacman use with the -p switch.
```

Install
-------

- Copy `pun` into your `$PATH`, typically `/usr/local/bin`
- To run pun automatically once every hour use the systemd-timer
    
        sudo systemctl start pun.timer
        sudo systemctl enable pun.timer


Errors
------
- `Error: cannot update database`
    - pacman needs root-rights. try with sudo
    - check internet-connection
- `Error: cannot find pacman. Your system is weird!`
    - is pacman in your `$PATH` and executable?
    - wrong distro?
- `Error: cannot fetch update list`
    - check internet-connection 


TODO
----

- sendmail integration
- cron example


License
-------

(c) 2015 Bernd Busse, Daniel Jankowski  
The GNU Lesser General Public License 3 (LGPLv3).  
See [LICENSE](./LICENSE) for details.

