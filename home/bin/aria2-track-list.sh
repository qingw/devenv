#!/usr/bin/env bash

conf_file=`realpath "${HOME}/.aria2/aria2.conf"`
list=`wget -qO- https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_all.txt|awk NF|sed ":a;N;s/\n/,/g;ta"`
if [ -z "`grep "bt-tracker" ${conf_file}`" ]; then
    sed -i '$a bt-tracker='${list} ${conf_file}
    echo add......
else
    sed -i "s@bt-tracker.*@bt-tracker=$list@g" ${conf_file}
    echo update......
fi
