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
if [ "$1" = "help" ];then
	cat ./utils/help.txt
	exit
fi
auto_norm c00

#auto_c_main
