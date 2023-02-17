#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Trebuie introdus $0 director de unde se doreste arhivarea fisierelor"
else
	nrNearh=0
	for i in $1/*
	do
		if [[ $i != *.tar.gz ]]
		then
			nrNearh=` expr $nrNearh + 1 `
		fi
	done
	if [ $nrNearh -ne 0 ]
	then
		echo "   Dati numele arhivei:"
		read numeArh
		numeArh=$numeArh\.tar\.gz
		tar -czvf $numeArh $1/*
		mv $numeArh ~/proiect/$1
		for i in $1/*
		do
			if [[ $i != *.tar.gz ]]
			then
				rm $i
			fi
		done
	else
		echo "   Nu mai exista fisiere de arhivat!"
	fi
fi
