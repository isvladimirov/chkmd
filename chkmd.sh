#!/bin/bash
# chkmd.sh - Checks for changes in a folder and make some action.
# (c)2024 Igor Vladimirov
# --== Config section ==--
# Folder to check for updates
FOLDER=/home/igor
# Command to start when changes detected
ONCHANGE="svcadm restart minidlna"
# File to store last size
SIZE=/tmp/chkmd-size
# --== End of config section ==--
# Do not edit lines below

LSIZE=`cat $SIZE`
if [[ `uname` == 'SunOS' ]]; then
    NSIZE=`du -sA $FOLDER | cut -f1`
else
    NSIZE=`du -sb $FOLDER | cut -f1`
fi

if [[ $NSIZE != $LSIZE ]]; then
    echo $NSIZE > $SIZE
    `$ONCHANGE`
fi
