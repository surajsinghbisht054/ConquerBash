#!/bin/bash
#
#
# Author :
#	Suraj Singh Bisht
#	surajsinghbisht054@gmail.com
#	www.bitforestinfo.com
#	github.com/surajsinghbisht054
#
#
# ====================================================
#         Please Don't Remove Author name
# ====================================================
#
#
#	Description:
#		Script To Play With Command Line Parameters Inputs
#

# To Print Home Directory Path
printf "This is Our Home Directory 	: %s\n" $HOME

# To Print Current Working Directory Path
printf "This is Current Working Path	: %s\n" $PWD

# Print All Environment Path
printf "Environment Path 		: %s\n" $PATH

# Numbers of Arguments Pass
printf "Numbers Of Arugments		: %d\n" $#

# Iterate All Passed Arguments
printf "All Arguments In One Variable[1]: %s\n" $*
printf "All Arguments In One Variable[2]: %s\n" $@

# Name Of Current Script
printf "Name Of Current Script		: %s\n" $0

# Current Process PID Numbers
printf "Process Id Number(PID)		: %d\n" $$

# Previous Executed Program Exit Code
printf "Exit Code of Previous Program	: %d\n" $?

# Last Argument Passed Through Command Parameters
printf "Last Argument 			: %s\n" $_

# Previous Execute Process Identity numbers
printf "Previous Command PID Number	: %d\n" $!


