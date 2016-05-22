#!/bin/hush

export HOME=/home
export PATH=/bin:/sbin

mountpoint -q proc || mount -t proc proc proc
mountpoint -q sys || mount -t sysfs sys sys
mountpoint -q dev || mount -t devtmpfs dev dev || mdev -s

export PS1="mimas_v2 > "

exec /sbin/oneit -c /dev/console /bin/myapp
