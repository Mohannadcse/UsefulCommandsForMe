#!/bin/bash
t=`ls out_bench`
for f in $t
do

if [ -e "../out_bench/$f" ]; then
    echo "$f exists"
else 
    cp out_bench/$f ../out_bench/$f
fi 
done

