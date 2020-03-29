#!/usr/bin/env bash

print_style () {
    if [ "$2" == "info" ] ; then
        COLOR="96m";
    elif [ "$2" == "success" ] ; then
        COLOR="92m";
    elif [ "$2" == "warning" ] ; then
        COLOR="93m";
    elif [ "$2" == "danger" ] ; then
        COLOR="91m";
    else # default color
        COLOR="0m";
    fi

    STARTCOLOR="\033[$COLOR";
    ENDCOLOR="\033[0m";

    printf "$STARTCOLOR%b$ENDCOLOR" "$1\n";
}

abort() {
    print_style "$1" "danger"
    exit 1
}

checkRoot() {
    if [[ "$UID" == "0" ]]; then
    abort "Don't run this as root!"
    fi
}
