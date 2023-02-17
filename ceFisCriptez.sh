#!/bin/bash
if [ $# -ne 2 ]
then
	echo "Se introduce astfel: $0 numeFisier algoritmCriptare"
else
	mcrypt -k iulia -h $2 $1
fi
