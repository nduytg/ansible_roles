#!/bin/bash

STATE=$(pgrep -f "thanos query" | wc -l)
#echo $STATE
if [ $STATE -eq 1  ]
then
	    echo success
        #SUCCESS
        exit 0
else
        #FAILED
        exit 1
fi