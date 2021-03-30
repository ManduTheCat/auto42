#!/bin/sh

# IMPORT FUNCTIONS
source ./utils/versions.sh
source ./utils/auto_norm.sh
#source ./utils/auto_c_main.sh

function auto_c_main()
{
echo "auto creating main.c for $func"
for func in ../ex0?/*
do
	echo "int	main(void)	" >> ./main.c
	echo "{					" >> ./main.c
	echo "$func($arguments);" >> ./main.c
	echo "return 0;			" >> ./main.c
	echo "}					" >> ./main.c
done
}

# MAIN
versions "0.0.1"
if [ $# -eq 0 ]
then
	echo "directory to test not specified"
	exit
elif [ "$1" = "help" ]
then
	cat ./utils/help.txt
	exit
else
	echo "*** Testing for directory $1 ***"
	echo "* auto norminette testing *"
	auto_norm $1
	echo "* auto compiling subdirectories of $1 *"
	#auto_compile $1
fi

#auto_c_main
