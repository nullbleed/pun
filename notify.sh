#!/bin/bash
#
# Pacman Update Notifier via Mail
#
# © 2015 Bernd Busse, Daniel Jankowski

if [[ -x "$(which yaourt)" ]]; then
    pkg_mgr="$(which yaourt)"
    upt_flg="-Qua"
else
    if [[ -x "$(which pacman)" ]]; then
        pkg_mgr="$(which pacman)"
        upt_flg="-Qu"
    else
        print "Error: cannot find packagemanager"
        exit 1
    fi
fi

# update package database
$pkg_mgr -Sy >& /dev/null
if (( $? != 0 )); then
    echo "Error updating database"
    exit 1
fi

# get updatelist
pkg_list="$( $pkg_mgr $upt_flg )"
num_pkg="$( echo -e $pkg_list | wc -l )"

if (( $num_pkg == 0 )); then
    echo "System is up to date"
else
    echo "You have $num_pkg updates:"
    _old_ifs=$IFS
    echo -e "$pkg_list" | while IFS= read -r pkg; do
        echo "    :: $pkg"
    done
    IFS=$_old_ifs
fi

