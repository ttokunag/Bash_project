# 
# Checkerboard generator
# 
# Author: Tomoya Tokunaga (mailto: ttokunag@ucsd.edu)   
# 

# ============================== Variables used ============================== #

# board tile information
TILE_BLACK="\033[0;40m  \033[0;0m"
TILE_WHITE="\033[0;47m  \033[0;0m"
# the number of tiles in a line. This follows user inputs
SQUARES_PER_LINE=$1
NUM_ITERATIONS=`expr $1 / 2`
# messages to be prited if an error occurs
ERR="\tERROR: Invalid flag given.\n"
USAGE="USAGE: ./checkerboard.sh [-r]"

# if the -r flag is appended, the program prints the reversed board
rotate_flag="f"

# Parse command line arguments
while getopts ":r" arg $@; do
  case $arg in

    # rotation wanted
    r) rotate_flag="t";;

    # Invalid flag provided
   \?) echo; echo -e "$ERR"; echo "$USAGE"; exit 1;;

  esac
done

# Remove parsed option flags
shift $((OPTIND - 1))

# ========================= Helper Functions ========================= #

# Description: a function that prints one row of the checkerboard. It look at
# the argument passed in to determine if it will start by printing a white or
# black square. 
#
# @param 0 or 1: 0 prints a line begins with a white tile
#                1: prints a line begins with a black tile
#
function printLine { # One way to define a function

    loop_counter=0
    if [ $1 -eq 0 ]
    then
	until [ $loop_counter -eq $SQUARES_PER_LINE ]
	    do
		# if loop_counter is even, print a white tile
		if [ `expr $loop_counter % 2` -eq 0 ]
		then
		    printf "$TILE_BLACK"
		# otherwise prints a black tile
		else
		    printf "$TILE_WHITE"
		fi
		loop_counter=`expr $loop_counter + 1`
	    done
	    printf "\n"
	else
	    until [ $loop_counter -eq $SQUARES_PER_LINE ]
		do
		    if [ `expr $loop_counter % 2` -eq 0 ]
		    then
			printf "$TILE_WHITE"
		    else
			printf "$TILE_BLACK"
		    fi
			loop_counter=`expr $loop_counter + 1`
		done
		printf "\n"
	fi

}

# a function which prints a checkboard on a shell
main() {

  counter=0

  if [ $rotate_flag == "t" ]; then
    # This line creates a loop that will run NUM_ITERATIONS times
    until [ $counter -eq $NUM_ITERATIONS ]; do
	    printLine 0
	    printLine 1
	    counter=`expr $counter + 1`
	done

  else
    until [ $counter -eq $NUM_ITERATIONS ]; do
	    printLine 1
	    printLine 0
	    counter=`expr $counter + 1`
        done

  fi
}

# ============================== Finally!! ============================== #
main # Calls the main function to start the script up
exit 0
