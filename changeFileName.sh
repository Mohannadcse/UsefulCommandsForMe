#This script removes + from files names in a directory. Input is the name of the directory
#!/bin/bash
t=`ls $1`

for f in $t
do
f1=`echo $f | sed "s/+//"`
mv $1/$f $1/$f1
done
