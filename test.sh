#!/bin/sh

# IMPORT FUNCTIONS
source ./utils/versions.sh
source ./utils/auto_norm.sh
source ./utils/auto_compile.sh
source ./utils/debug_log.sh

# MAIN
versions "0.1.0"
if [ $# -eq 0 ]
then
	echo "directory to test not specified"
	echo "execute example: sh test.sh c00"
	echo "DON'T PANIC!"
	exit
elif [ "$1" = "help" ]
then
	cat ./utils/help.txt
	exit
else
	testdir=$1
	echo "*** Testing for directory $testdir ***"
	echo "* auto norminette testing for $testdir... *"
	auto_norm $testdir
	echo "* auto compiling subdirectories of $testdir *"
	auto_test $testdir
	echo "*** Program Finished ***"
fi

#auto_c_main
