#!/bin/bash
echo "Vasileva Kyunney 717-1"
echo "Programm: ISOCHECK"
echo "This program for checking and implanting checksum in ISO images"

while :
do
echo "Enter path to the ISO image: "
    read path
test -f $path
endstatus=$?
if [ $endstatus -eq 1 ]; then
    echo "No such file or directory!" >&2
else
    echo "ISO image found..."
    checkisomd5 --md5sumonly $path
    if [ $? -eq 0 ]; then
	checkisomd5 --verbose $path
	endstatus=$?
    else
	echo "No checksum!" >&2
        implantisomd5 --force $path
	endstatus=$?
    fi
fi
echo -n "Retry? ('y' for retry / any key for exit) "
    read answer
if [ $answer != "y" ]; then
    echo "Goodbye!"
    exit $endstatus
fi
done
