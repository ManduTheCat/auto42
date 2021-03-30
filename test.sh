#!/bin/sh

# IMPORT FUNCTIONS
source ./utils/versions.sh
source ./utils/auto_norm.sh
source ./utils/auto_compile.sh

# MAIN
versions "0.0.1"
if [ $# -eq 1 ] #temporary; fix it to 0 when on actual release
then
	echo "directory to test not specified"
	exit
elif [ "$1" = "help" ]
then
	cat ./utils/help.txt
	exit
else
	#testdir=$1
	testdir="c00"
	#echo "*** Testing for directory $testdir ***"
	#echo "* auto norminette testing for $testdir... *"
	#echo "what's wrong about autonorm?"
	#auto_norm $testdir
	#echo "* auto compiling subdirectories of $testdir *"
	auto_compile $testdir
fi

#auto_c_main
