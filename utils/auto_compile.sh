#!/bin/sh

function get_directory_numbers()
{
    # Check directory number, path given on $1
    num=$(ls ../$1 | wc -l | tr -d ' ')
    return $num
}

function create_temp_dir()
{
    for i in $(seq 1 $1)
    do
        mkdir temp/ex0$i
    done
    #echo "temp dirs:"
    #pwd
    #ls -al temp/
    #rmdir temp/ex*
    #echo "also the original looks like:"
    #ls -al ../$1
}

function auto_c_main()
{
    testdir=$1; num=$2
	destdir="./temp/$testdir/"
    echo "destdir is $destdir"
    #echo "* auto creating main.c for $func *"
	for i in $(seq 1 $num)
	do
        echo "it is now";pwd
        destmain="./temp/$testdir/ex0$i/main.c"
		echo $destmain
        ls $destmain
		ls ./temp/ex01
        touch $destmain
		echo "int	main(void)	" >> $destmain
		echo "{					" >> $destmain
		echo "$func($arguments);" >> $destmain
		echo "return 0;			" >> $destmain
		echo "}					" >> $destmain
	done
}

function auto_compile()
{
    testdir=$1
    get_directory_numbers; num=$?
    create_temp_dir $num
    auto_c_main $testdir $num
}
