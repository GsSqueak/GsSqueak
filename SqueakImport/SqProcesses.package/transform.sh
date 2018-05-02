#!/bin/bash
set -e
set -x

	for j in $(find $i -name '*.st');
	do
		echo "*SqProcesses-$(cat $j)" > $j
	done
