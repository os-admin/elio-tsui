#!/usr/bin/env bash
os=`uname -s`


for i in $*;
do
    case ${i##*.} in 
        
        php | sh)
            suffix="#"
        ;;

        java | js | cpp | py | tmp)
            suffix="//"
        ;;

        * )
            echo "the file name is illegal"
            exit 1
    esac
    
    echo "$suffix $i";
    cat $i;
    echo "hello";

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
        echo "success2"
    ;;

    * )
        echo -e "OS '$os' not supported yet !\n"
        exit 1
esac