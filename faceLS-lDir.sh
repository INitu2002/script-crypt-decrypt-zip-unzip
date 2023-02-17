#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Introduceti $0 cale"
else
	ls -l $1 | grep "^d" > fis1
	cat fis1 | awk '{ print $9 }'
	rm fis1
fi
