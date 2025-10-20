#!/bin/sh
writefile="$1"
writestr="$2"

if [ "$#" -lt 2 ]
then
    echo "Not enough parameters specified. Be sure to specify the file path and the text to write."
    exit 1
fi

dirpath=$(dirname "$writefile")
if [ ! -d "$dirpath" ]
then
	mkdir -p "$dirpath"
fi

echo "$writestr" > "$writefile"

if [ "$?" -eq 0 ]
then
	echo "success"
	exit 0
else
    	echo "Error: Could not create or write to the file."
    	exit 1
fi
