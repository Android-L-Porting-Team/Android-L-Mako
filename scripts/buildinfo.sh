#!/bin/sh

#Variables
date=`date`
timestamp=`date +%s`

while read line
do
    eval echo "$line"
done < "./scripts/buildinfo.prop"
