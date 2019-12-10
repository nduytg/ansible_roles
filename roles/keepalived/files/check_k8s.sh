#!/bin/bash

STATE=$(pidof k8s | wc -l)

if [ $STATE -eq 1  ]
then
        #SUCCESS
        exit 0
else
        #FAILED
        exit 1
fi