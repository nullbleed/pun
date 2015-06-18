pun - pacman update notifier
============================

systemd service that sends an email if your system has pending updates.

Sends a mail if
    
    - last mail was send before last update
    - new updates after last mail was send


Features
--------

- small bash-script (may be used as a cronjob)
- systemd-unit with timer
- cron-mail mode (less output)
- aur support with `package-query`


Usage
-----
```
Usage: pun [OPTIONS]
    -h      Show this help message
    -p      Force to use pacman
    -d      Send no mail
    -v      Force output of updates list

If package-query is installed, it will be used by default. Force pacman use with the -p switch.
```

Install
-------

- Copy `pun` into your `$PATH`, typically `/usr/local/bin`

### systemd

To run pun automatically once every hour use the systemd-timer
    
    sudo systemctl start pun.timer
    sudo systemctl enable pun.timer

### cron

If used as a cron job start with the `-q` option or set `OUTPUT=none` in the config file.
In this mode you may send the output via cron mail.


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


---

License
-------

(c) 2015 Bernd Busse, Daniel Jankowski  
Licensed under the GNU Lesser General Public License 3 (LGPLv3). See [LICENSE](./LICENSE) for details.

