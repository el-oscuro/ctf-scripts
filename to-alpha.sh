#!/bin/bash
if [ "$1" == "" ]; then
  echo Usage: $0 file 
  exit 1
fi
if [ ! -f "$1"  ]; then
  echo $0:  File $1 not found
  exit 1
fi
cat $1 | tr -d [:punct:] | tr -d [:digit:] | tr -d [:space:]
