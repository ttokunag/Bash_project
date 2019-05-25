# Script 1 - Checkerboard
# 
# Name: Tomoya Tokunaga  
# PID: A15704164  
# Account: cs15xacu  

# ============================== DO NOT CHANGE ============================== #

# Constants used
TILE_BLACK="\033[0;40m  \033[0;0m"    # DO NOT CHANGE
TILE_WHITE="\033[0;47m  \033[0;0m"    # DO NOT CHANGE
SQUARES_PER_LINE=8                    # DO NOT CHANGE
HALF_DIVISOR=2                        # DO NOT CHANGE
NUM_ITERATIONS=4                      # DO NOT CHANGE
ERR="\tERROR: Invalid flag given.\n"  # DO NOT CHANGE
USAGE="USAGE: ./checkerboard.sh [-r]" # DO NOT CHANGE

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

# ========================= YOUR CODE STARTS BELOW ========================= #

# FIXME: Write a function that prints one row of the checkerboard. It should
# look at the argument passed in to determine if it will start by printing a
# white or black square. This is an optional method, but will help you
# implement the main method.
function printLine { # One way to define a function
	loop_counter=0
	# 0: prints a line begins with a white tile
	# 1: prints a line begins with a black tile
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

main() { # Another way to define a function

  counter=0

  if [ $rotate_flag == "t" ]; then
    # This line creates a loop that will run NUM_ITERATIONS times
    until [ $counter -eq $NUM_ITERATIONS ]; do

      # FIXME: Use the print functions to draw two REVERSED rows of the board
		printLine 0
		printLine 1
		counter=`expr $counter + 1`
    
	done

  else
    until [ $counter -eq $NUM_ITERATIONS ]; do

      # FIXME: Use the print functions to draw two rows of the board
	  	printLine 1
		printLine 0
		counter=`expr $counter + 1`

    done

  fi
}

# ============================== DO NOT CHANGE ============================== #
main # Calls the main function to start the script up
exit 0
