#!/bin/bash

#please change REDIS_SERVER to redis installation dir
REDIS_SERVER=/usr/local/services/redis/bin/redis-server
REDIS_DATA=`pwd`

if [ "$1" != "" ]; then
        cd $REDIS_DATA/$1;
        $REDIS_SERVER ./$1.conf;
	exit
fi

for ((i = 7000; i < 7010; i++))
do
	cd $REDIS_DATA/$i;
	nohup $REDIS_SERVER ./$i.conf&
done;