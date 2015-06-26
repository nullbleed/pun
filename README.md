pun - pacman update notifier
============================

systemd service that sends an email or telegram message if your system has pending updates.

Sends a notification if:

- last notification was send before last update
- there are new updates after last notification was send


Features
--------

- small bash-script (may be used as a cronjob)
- systemd-unit with timer
- cron-mail mode (less output)
- aur support with `package-query`
- send update-list via mail.
- send update-list via telegram bots.


Usage
-----
```
Usage: pun [OPTIONS]
    -h ; --help                       Show this help message"
    -c ; --config CONFIG              Use config file CONFIG"
    -p                                Force to use pacman"
    -d                                Dry run: Send no mail, telegram, etc."
    -v                                Force output of updates list"
         --cron                       Only print if a mail would be send (cron mail compatible)"
    -q ; --quiet                      Quiet mode, only errors are printed"
    -m ; --mail ADDRESS               Send update-list via mail to ADDRESS"
    -t ; --telegram ID                Send update-list via telegram to contact ID"
         --telegram-token TOKEN       API-Token for the telegram telegram bot"

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

If used as a cron job start with the `--cron` option or set `OUTPUT=cron` in the config file.
In this mode you may send the output via cron mail.

### Telegram

To send telegram messages pun uses an official Telegram Bot. For this Bot to work
you need to provide your telegram user id.
You may get your telegram user id with the provided `pun-search-telegram-id` script,
after you've sent a message to the [NotifyBot](https://telegram.me/notifier_bot).


Configuration
-------------

The default config is in `/etc/pun.conf`. Commandline arguments overwrite this options.

    FORCE_PACMAN=0         # force usage of pacman -> no aur support
    OUTPUT=log             # output mode

    USE_MAIL=0             # send notification mail
    MAIL_ADDRESS=          # destination mail address

    USE_TELEGRAM=0         # send notification message with telegram-cli
    TELEGRAM_CONTACT=      # destination telegram contact id
    TELEGRAM_TOKEN=        # token for the PUN telegram bot

Output-modes:

- __none__: don't generate any output (no logs, no mail).
- __cron__: quiet mode for cron mail. Only generates error messages or output if a mail would have been send.
- __verbose__: always show package-list, etc.

Don't change the TELEGRAM_TOKEN, unless you know, what you're doing!


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

- cron example
- test mail and telegram integration


---

License
-------

(c) 2015 Bernd Busse, Daniel Jankowski  
Licensed under the GNU Lesser General Public License 3 (LGPLv3). See [LICENSE](./LICENSE) for details.

