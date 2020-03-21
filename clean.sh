#!/bin/bash


# Author: @LifeEric on github.com
# Version: 1.0


# Check If it's file

is_file() {
	
	if [ ! -f "$1" ] ; then
		echo "$1 doesn't seem to be file"
		exit 2
	fi
}


# removing comments, space, empty line

clean_file() {
	is_file "$1"
	BEFORE=$(wc -l "$1")
	echo "$1 starts with the $BEFORE lines"
	sed -i.bak '/^\s*#/d;/^$/d' "$1"
	AFTER=$(wc -l "$1")
	echo "$1 is now $AFTER lines"
}


# Prompt to user

read -p "Enter the file name to be cleaned: "
clean_file "$REPLY"
exit 0
