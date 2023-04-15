#!/bin/sh

DEVICE="/dev/ttyACM0"
ampcmd="ampy --port $DEVICE "


echo "cleaning"
remotefiles=$($ampcmd ls)
for file in $remotefiles; do
    if [ "$file" = "/keyz" ]; then
        echo "found keyz install, removing"
        $($ampcmd rmdir keyz)
    fi
    if [ "$file" = "/main.py" ]; then
        echo "found main.py, removing"
        $($ampcmd rm main.py)
    fi
    if [ "$file" = "/boot.py" ]; then
        echo "found boot.py, removing"
        $($ampcmd rm boot.py)
    fi
done


echo "installing"
cd source
echo "transfering boot.py"
$($ampcmd put boot.py)
echo "transfering main.py"
$($ampcmd put main.py)
echo "creating keyz/"
$($ampcmd mkdir keyz)
cd keyz
localfiles=$(ls)
for file in $localfiles; do
    echo "transfering keyz/$file"
    $($ampcmd put $file /keyz/$file)
done

echo "restarting"
$($ampcmd reset)
