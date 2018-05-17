#!/bin/bash
if [ "$2" == "" ]; then
  echo Usage: $0 file str
  echo Returns character positions for str in file.  Useful for vineger ciphers
  exit 1
fi
if [ ! -f "$1"  ]; then
  echo $0:  File $1 not found
  exit 1
fi
grep -b -o $2 $1
