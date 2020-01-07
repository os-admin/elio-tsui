#!/usr/bin/env bash
os=`uname -s`

echo $*

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
    
    echo "$suffix $i";
    cat $i;
    echo;

done > /tmp/storageInfo 


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
        exit 2
esac




