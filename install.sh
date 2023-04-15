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
done


echo "installing"
cd source
echo "building scaffolding"
$($ampcmd put main.py)
$($ampcmd mkdir keyz)
cd keyz
localfiles=$(ls)
for file in $localfiles; do
    echo "transfering $file"
    $($ampcmd put $file /keyz/$file)
done

echo "restarting"
$($ampcmd reset)
