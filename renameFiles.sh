#!/bin/bash
t=`ls Soteria`
for f in $t
do
filename="${f%.*}"
if [[ $filename == *"."* ]]; then
  echo $f
  newFileNm="${filename/./}"
  mv Soteria/$f Soteria/$newFileNm.groovy
fi
done
