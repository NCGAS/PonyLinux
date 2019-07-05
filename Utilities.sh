#!/usr/bin/env bash
#######
##  This file declares functions that are sort of universal!
#######

export MINLINES=44
export bold=$(tput bold)
export normal=$(tput sgr0)

function checkProgress(){
    if [[ -e ~/.unixTut/config ]]; then
        #sleep 2
        echo -n '' > ~/.unixTut/sourceTmpVars
        sed -e 's/:[^:\/\/]/="/g;s/$/"/g;s/ *=/=/g' ~/.unixTut/config >> ~/.unixTut/sourceTmpVars
        . ~/.unixTut/sourceTmpVars
        #sleep 5
    else
        mkdir -p ~/.unixTut
        touch ~/.unixTut/config
    fi
    if [[ $name ]]; then
	export PONYUSER="$name"
    fi
}

function gotest(){
echo -e "$1"
cat "$1"

}

function ponygo(){
    #ponyname="$1"
    #ponytext="$2"
    getWrap
    ponysay -b round --wrap $PONYWRAP -F "$1" "$2"
    read -p "Press enter to continue"
    clear

}
function ponytest(){
    #ponyname="$1"
    #ponytext="$2"
    getWrap
    ponysay -b round --wrap $PONYWRAP -F "$1" "$2"
    read -p "Press enter to continue"
    clear
}

function ponyNoClear(){
    getWrap
    ponysay -b round --wrap $PONYWRAP -F "$1" "$2"
}

function getInput(){
    cmd=$1
    retry=$2
    local tries=2
    strcmd='Type in this command: '${cmd}$' \n $ '
#    echo "strcmd:"
#    echo $strcmd
#    strret=$retry' Try the command: '${cmd}$' \n $ '
#    echo "strret:"
#    echo $strret
#    echo "begin"
    read -p "$strcmd" variable1
    while [[ $variable1 != "$cmd" ]]; do
	if [[ $variable1 = "$cmd"* ]];then
	    echo "So close! You added fancy stuff to the end. Keep it simple."
	elif [[ $variable1 = *"$cmd" ]];then
	    echo "So close!. There's something in front of the command where there shouldn't be. Look carefully."
	else
	    echo "${retry} Attempt $tries of 3:"
	fi
	if [[ $tries > 3 ]]; then
	    echo "You gave it a few tries. It's ok, I'll show you how to do it."
	    echo " $ $cmd"
	    break
	fi
	tries=$((tries + 1))
	read -p "$strret" variable1
    done    
}
# This function sets the width of the text for the speech bubbles for the ponysay --wrap param!
function getWrap() {
    wrapsize=$(( $(tput columns) * 3 / 4 ))
    if (( $wrapsize < 40 )); then
	wrapsize=40
    fi
    export PONYWRAP=$wrapsize
}