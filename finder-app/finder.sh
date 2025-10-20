#!/bin/sh
filesdir="$1"
searchstr="$2"

if [ "$#" -lt 2 ]
then
	echo "not enough parameters specified. be sure to specify the directory and search string respectively" 
 	exit 1
fi

if [ ! -d "$filesdir" ]
then
	echo "The file directory does not exist"
	exit 1
fi

file_count=$(find "$filesdir" -type f | wc -l)

match_count=$(grep -r "$searchstr" "$filesdir" | wc -l)

echo "The number of files are $file_count and the number of matching lines are $match_count"
