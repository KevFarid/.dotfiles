#!/bin/sh
set -e

if [[ $(id -u) -ne 0 ]] ; then echo "Please run as root" ; exit 1 ; fi

function exe {
  sudo bash ./scripts/$1.sh
}

exe hello-world
# exe fonts
# exe symlinks
# exe programs
exe windows-managers
exe envs
exe theme
