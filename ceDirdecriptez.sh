#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Trebuie introdus $0 cale"
else
	~/proiect/faceLS.sh $1
	for i in $1/*
	do
		if [[ $i == *.nc ]] # le verifica doar pe cele criptate deja
		then
			mcrypt -k iulia -d $i
			rm $i
		fi
	done
	echo -e "\n   Directorul contine acum:"
	~/proiect/faceLS.sh $1
fi
