cpun - cron pacman update notifier
==================================

systemd service that sends an email if your system has pending updates.

Features
--------

- small bash-script (for use as a cronjob)
- aur support with `package-query`
- systemd-unit with timer


Install
-------

- The run cpun automatically once every day use the systemd-timer
    
    sudo systemctl enable cpun.timer
    sudo systemctl start cpun.timer


TODO
----

- sendmail integration
- install and usage instructions in README
- cron example
- PKGBUILD


License
-------

(c) 2015 Bernd Busse, Daniel Jankowski  
The GNU Lesser General Public License 3 (LGPLv3).  
See [LICENSE](./LICENSE) for detais.

