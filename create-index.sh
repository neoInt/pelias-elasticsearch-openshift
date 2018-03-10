#!/bin/bash

if [ "$1" == "" ]
then
 echo "Usage: create-index.sh <hostname:port>"
else

	curl -XPUT "http://$1/pelias/" -d @schema/pelias-schema.json
fi
