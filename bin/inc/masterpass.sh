#!/bin/sh

start=
if [ "$#" = "1" ] ; then
    start=$1
    export MASTERPASS_START=$start
else
    start=$(echo $MASTERPASS_START)
    [ -n "$start" ] || { echo "Usage: start cordinates , or MASTERPASS_START " ;  return  1 ;}
fi

export PASSTAB_HOME=$HOME/code/Aux/software_/passtab/passtab-0.0.2 && ~/bins/software/passtab --getpass $start 
