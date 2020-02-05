#!/bin/bash

#please change REDIS_SERVER to redis installation dir
REDIS_SERVER=/usr/local/services/redis/bin/redis-server
REDIS_DATA=`pwd`

if [ "$1" != "" ]; then
	cd $REDIS_DATA/sentinel$1;
	$REDIS_SERVER ./sentinel$1.conf --sentinel;
	exit;
fi

for ((i = 1; i < 4; i++))
do
	cd $REDIS_DATA/sentinel$i;
	$REDIS_SERVER ./sentinel$i.conf --sentinel;
done;

