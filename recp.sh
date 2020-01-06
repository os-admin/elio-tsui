#!/usr/bin/env bash
os=`uname -s`

num=$1
doc1=$2
doc2=$3

if [ $num != "-d" ];
then
    doc2=$doc1
    doc1=$num
fi


for i in $*;
do
    case ${i##*.} in 
        php | sh)
            suffix="#"
        ;;

        * )
            suffix="//"
        ;;

    esac
     
    for f in $doc1 $doc2;
    do
        echo "$suffix $f";
        cat $f;
        echo;
    done > /tmp/storageInfo 
done 


if [ $num == "-d" ];
then
    cat /tmp/storageInfo
else
    case $os in
        #Linux
        Linux )
            cat /tmp/storageInfo | xclip -sel clip
            echo "success1"
        ;;

        #MacOS
        Darwin )
            cat /tmp/storageInfo | pbcopy
            echo "success"
        ;;

        * )
            echo -e "OS '$os' not supported yet !\n"
            exit 1
    esac
fi