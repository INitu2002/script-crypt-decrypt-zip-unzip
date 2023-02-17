#!/bin/bash
if [ $# -ne 1 ]
then
	echo "Introduceti $0 cale director"
else
	tar -xzvf $1/*
fi
