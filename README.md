pun - pacman update notifier
============================

systemd service that sends an email if your system has pending updates.

Sends a mail if:

- last mail was send before last update
- there are new updates after last mail was send


Features
--------

- small bash-script (may be used as a cronjob)
- systemd-unit with timer
- cron-mail mode (less output)
- aur support with `package-query`
- send update-list via [telegram-cli](https://github.com/vysheng/tg) (BETA)


Usage
-----
```
Usage: pun [OPTIONS]
    -h ; --help             Show this help message
    -c ; --config CONFIG    Use config file CONFIG
    -p                      Force to use pacman
    -d                      Send no mail
    -v                      Force output of updates list
    -t                      Send update-list via telegram

If package-query is installed, it will be used by default.
Force use of pacman with the -p switch (no aur).
```

Install
-------

- Copy `pun` into your `$PATH`, typically `/usr/local/bin`

### systemd

To run pun automatically once every hour use the systemd-timer
    
    $ sudo systemctl start pun.timer
    $ sudo systemctl enable pun.timer

### cron

If used as a cron job start with the `-q` option or set `OUTPUT=none` in the config file.
In this mode you may send the output via cron mail.

### Telegram

For use with Telegram, install [telegram-cli](https://github.com/vysheng/tg)
Telegram has to be configured as root user at the moment to access the mail-file(/var/lib/pun/mail_save.txt).
Pun also needs root-rights to use `pacman -Sy`, so telegram-cli runs as root. We try to fix it, so telegram-cli
doesn't run as root-user.

Configuration
-------------

The default config is in `/etc/pun.conf`. Commandline arguments overwrite this options.

    FORCE_PACMAN=0  # force usage of pacman -> no aur support
    OUTPUT=none     # output mode: 'none', 'cron'

Output-modes:

- __none__: don't generate any output (no logs, no mail).
- __cron__: quiet mode for cron mail. Only generates error messages or output if a mail would have been send.
- __telegram__: don't generate output. Sends update-list via Telegram


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

