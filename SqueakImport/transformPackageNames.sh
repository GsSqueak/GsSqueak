#!/bin/bash
set -e
set -x

for j in $(find $i -name 'properties.json');
do
    TMP=$(php ./transformPackageName.php $j);
    echo $TMP > $j;
done

