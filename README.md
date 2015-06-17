pun - pacman update notifier
============================

systemd service that sends an email if your system has pending updates.


Features
--------

- small bash-script (may be used as a cronjob)
- systemd-unit with timer
- aur support with `package-query`


Install
-------

- To run pun automatically once a day use the systemd-timer
    
    `sudo systemctl enable pun.timer`
    `sudo systemctl start pun.timer`


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

