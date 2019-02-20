#!/bin/bash
if [ "$2" == "" ]; then
  echo Usage: $0 name executable [icon_file]
  echo Creates desktop shortcut to executable or file
  exit 1
fi

(echo \#!/usr/bin/env xdg-open
 echo [Desktop Entry]
 echo Version=1.0
 echo Type=Application
 echo Terminal=false
 echo Exec=$2
 echo Name=$1
 echo Comment=Shortcut to $2
 echo Icon=$3) > "$HOME/Desktop/$1.desktop"

chmod +x "$HOME/Desktop/$1.desktop"

