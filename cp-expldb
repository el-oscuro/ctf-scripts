#!/bin/bash
if [ "$1" == "" ]; then
  echo Usage: $0 exploit-db filename
  echo copies a file from exploit-db to current dir
  echo $0 22333.c
  exit 1
fi
FILE=`locate $1 | grep exploitdb | head -n 1`
cp -v $FILE .
