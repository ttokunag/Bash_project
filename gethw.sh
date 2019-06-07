#!/bin/bash

# Declare any global variables here
USAGE="Usage: $0 [hw-name]"
EINVALID="Invalid homework: $1"
PROMPT="$file already exists. Overwrite? (y/N) "
ABORT="Skipping $file."
SUCCESS="Done. Navigate to \`~/homework/$1\` to get started."
SRC_DIR="$PUBLIC/homework/$1"
DEST_DIR="$HOME/homework/$1"


# Here are a couple of steps to get started on the script:
# Handle the incorrect number of parameters below:
if [ $# != 1 ]
then
	echo "$USAGE"
	exit 1
fi

# Handle inputs not existing in the public directory below:
if [ ! -e $PUBLIC/homework/$1 ]
then
	echo "$EINVALID"
	exit 1
fi

# Create the new directory if it doesn't exist yet
# 1. Iterate through the files in the source directory


#    a) If a file does exist in the new directory, ask the user if
#       they want to overwrite each file.


#    b) Otherwise just copy the file

if [ ! -e $HOME/homework/$1 ]
then
	cp -r $PUBLIC/homework/$1 $HOME/homework/
	echo "$SUCCESS"
else
	cd $PUBLIC/homework/$1/
	for file in *
	do 
		#echo "$f"
		read -ep "$file$PROMPT" ANSWER
		if [ -z $ANSWER ]
		then
			echo "$ABORT$file"

		elif [ $ANSWER == "Y" ] || [ $ANSWER == "y" ]
		then               
			cp $file $HOME/homework/$1/

		elif [ $ANSWER == "N" ] || [ $ANSWER == "n" ]
		then
			echo "$ABORT$file"
		fi
	done
	cd $HOME/homework/script2
fi

# 2. Let the user know the script is complete, and return the proper error code.
echo "$SUCCESS"
