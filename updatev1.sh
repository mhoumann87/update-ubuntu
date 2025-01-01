#!/bin/bash

# Update is a command line tool made to make it easy for me to update my
# Ubuntu based Linux system
# Based on Joe Collins script Up - https://github.com/EzeeLinux/up-debian_ubuntu_update_tool
# By Michael Houmann 
# Version 1.0 - REMEMBER to change the filename to "update.sh"
# Set bash to quit script and exit on errors
set -e

# Functions

update() {
  echo "Starting full system update"
  sudo apt update
  sudo apt full-upgrade -yy
}

clean() {
  echo "Removing apt cache packages that can no longer be downloaded"
  sudo apt autoclean
}

remove() {
  echo "Removing no longer in use packages"
  sudo apt autoremove -yy
  sudo apt remove --purge $(dpkg -l | grep "^rc" | awk '{print $2}') -yy
}

reboot() {
  echo "Rebooting the system"
  sudo reboot
}

shutdown() {
  echo "Shuttong the system down"
  sudo shutdown now
}


leave() {
  echo "==================="
  echo "= Update Complete ="
  echo "==================="
  exit
}

update_help() {
  less << _EOF_

  Update - toole to clean and update Ubuntu based Linux system version 1.0

  Press "q" to exit this help page.

  Commands:

    * update = Full system update.

    Running "update" with no options will update the apt cache and then\
    preform a full distribution update automatically.

    * update --remove = Full system update with useless packages removed.
    * update --clean = Full system update with full system cleanup.
    * update --reboot = Full system update clean system and reboot system.
    * update --shutdown = Full system update and clean system and then shutdown system.

    Adding the "--clean" flag will invoke the apt command to search for\
    and remove locally cached packages that are no longer in the repos\
    and remove orphaned packages that are no longer needed by programs.

    The "--remove" flag will only remove orphaned packages, leaving the\
    apt cache alone.

    * up --help = shows this help page.

_EOF_
}

# Execution

echo "Update - Update and clean your Linux System (Version 1)"

# Update and clean

if [ "$1" == "--remove" ]; then
  update
  remove
  leave
fi

# update and clean

if [ "$1" == "--clean" ]; then
  update
  remove
  clean
  leave
fi

# Update and reboot
if [ "$1" == "--reboot" ]; then
  update
  remove
  clean
  reboot
  leave
fi

if [ "$1" == "--shutdown" ]; then
  update
  remove
  clean
  shutdown
  leave
fi

# Help

if [ "$1" == "--help" ]; then
  update_help
  exit
fi

# Check for invalid argument

if [ -n "$1" ]; then
  echo "Invalid argument. Try 'update --help' for more info.">&2
  exit 1
fi

# Update

update
leave
