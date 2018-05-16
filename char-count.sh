#!/bin/bash
if [ "$1" == "" ]; then
  echo Usage: $0 file [--before/--after char]
  exit 1
fi
if [ ! -f "$1"  ]; then
  echo $0:  File $1 not found
  exit 1
fi
INFILE=$1
shift
while [ -n "$1" ]
  do
    case "$1" in
      "--before")
        PREFIX=$2
        if [ "$PREFIX" == "" ]; then
          echo $0:  --before requires argument
          exit 1
        fi
        shift 2;;
      "--after")
        SUFFIX=$2
        if [ "$SUFFIX" == "" ]; then
          echo $0:  --after requires argument
          exit 1
        fi
        shift 2;;
      *)
        echo $0:  $1 invalid option
        exit 1;;
     esac
  done

        
TMPFILE=`mktemp`
STR=`cat $INFILE`
for ch in A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
  do
    if [ -n "$SUFFIX" ]; then
      char=${ch}${SUFFIX}
    elif [ -n "$PREFIX" ]; then
      char=${PREFIX}$ch
    else
      char=$ch
    fi

    count=`grep -o $char $INFILE | wc -l`
    if [ "$count" != "" ] && [ "$count" != "0" ]; then
      printf "%03d %s\n" $count $char >> $TMPFILE
    fi
  done
cat $TMPFILE | sort


