#!/bin/sh
source ./utils/versions.sh

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

echo "parameter $1"
versions "0.0.1"
if [ "$1" = "help" ];then
	cat ./utils/help.txt
	exit
fi
#auto_c_main
