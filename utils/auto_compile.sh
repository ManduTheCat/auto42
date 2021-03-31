#!/bin/sh

#log "btw it's"; log pwd; log "here"
#keep in mind rel path when sourcing this is at ../test
source ./utils/debug_log.sh

function get_directory_numbers()
{
    # Check directory number, path given on $1
    searchdest=$1
    num=$(find ../$searchdest/ex0? -type f | wc -l | tr -d ' ')
    log "directory numbers are $num"
    return $num
}

function create_temp_dir()
{
    log "creating temp dir"
    testdir=$1; num=$2;
    for ((i=0; i<$num; i++)) 
    do
        mkdir -p temp/$testdir/ex0$i
    done
    #ls -al temp/
    #rmdir temp/ex*
    #echo "also the original looks like:"
    #ls -al ../$1
    #echo "temp dir is created"
    #ls -al temp/
    #ls -al temp/$testdir
}

function auto_c_main()
{
    testdir=$1; num=$2
	destdir="./temp/$testdir/"
    echo "* auto creating main.c for $testdir *"
    # find and auto create main.c
	for ((i=0; i<$num; i++)) 
	do
        # * copying original files to temp *
        copydest="./temp/$testdir/ex0$i"
        destmain="$copydest/main.c"
        cp "../$testdir/ex0$i/"*"" "$copydest/"
        funcname=$(find $copydest/ -name '*.c' -and -not -name "main.c" \
                  -type f -exec basename {} .c \;)
        log "funcname says it's $funcname at $copydest"
        # * get prototype function *
        funccall=$(grep -m 2 $funcname "$copydest/$funcname.c" | tail -1)
        log "funccall says it's $funccall"
        # * get function parameter from custom/ *
        args=$(awk "NR==$(( i+1 ))" "./custom/$testdir.txt")
        log "args fetched: $args"
        log "./custom/$testdir.txt"
        # * rewriting main.c" *
        touch "$destmain"
        echo "$funccall;        " >> $destmain
        echo "                  " >> $destmain
		echo "int	main(void)	" >> $destmain
		echo "{					" >> $destmain
		echo "$funcname($args); " >> $destmain
		echo "return 0;			" >> $destmain
		echo "}					" >> $destmain
        log "created main.c file | $destmain"
        cat $destmain | log
	done
}

function auto_compile()
{
    testdir=$1; num=$2
    tempdir="./temp/$testdir"
    # * check if temp exsist first *
    if [ ! -d "./temp" ]
    then
        echo "no temp file located, creating..."
        mkdir ./temp
    fi

    echo "* auto compiling $num files for $testdir*"
    for ((i=0; i<$num; i++))
    do
        exdir="$tempdir/ex0$i"
        compiled="$exdir/eval"0$i".out"
        log "exdir is $exdir"
        # * gcc compile at temp/c0?/ex0?/ *
        gcc -Wall -Wextra -Werror -o    \
            "$compiled"                 \
            "$exdir/"*.c""
        chmod a+x $compiled 
        echo "*** testing $compiled ***"
        echo 
        ./temp/$testdir/ex0$i/'eval'"0$i".out
        echo 
		echo "*** end of program 0$i ***"
        echo
    done
}

function purge_temp()
{
    rm -rf ./temp/*
    log "temp purged:"
    ls ./temp/ | log
}
function auto_test()
{
    testdir=$1
    purge_temp
    get_directory_numbers $testdir; num=$?
    create_temp_dir $testdir $num
    auto_c_main $testdir $num
    auto_compile $testdir $num
}
