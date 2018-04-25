#!/bin/bash
set -e
set -x

cd SqCollectionLiterals.package
for i in ByteSymbol.class WideSymbol.class;
do      
        new=$(echo "$i" | sed 's/.class/.extension/')
	for j in $(find $i -name '*.st');
	do
		echo "*SqCollectionLiterals-$(cat $j)" > $j
	done
	find $i -name '*.json' | xargs sed -i -E 's/\\/\\\\/g'
        mv "$i" "$new"
done

