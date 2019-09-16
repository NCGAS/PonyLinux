#!/usr/bin/env bash
#######
##  This file declares functions that are sort of universal!
#######

export MINLINES=44

## Text formatting ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Shorthand for newline
export n=$'\n'
# Shorthand for two newlines
export n2=$'\n\n'
# Shorthand for newline followed by tab
export nt=$'\n\t'
# Shorthand for reset followed by newline
export rn=$'\r\n'
# Shorthand for reset followed by two newlines
export rn2=$'\r\n\n'
# Shorthand for newline followed by bold
export nt=$'\n\b'
# Shorthand for bold face
export b=$'\033[1m'
# Shorthand for italic face
export i=$'\033[3m'
# Shorthand for reset font to normal
export r=$'\033[0m'

## Notes for developers:
##  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# TPUT exudes a B( character secretly during setting Bold. This screws up ponysay's character count!
# For this reason we gotta use the actual codes.
#export bold=$(tput bold)
#export normal=$(tput sgr0)
#function bold(){
#    printf "\033[1m$1\033[0m"
#    #$(tput bold; echo -n "$1"; tput sgr0)
#}
# In my testing, the runtime for $(bold "test") is 20x slower than the shorthands!
##  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
##  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


function checkColumns(){
tput cols
#cols=${COLUMNS:-50}
#echo $cols
}

# This function sets the width of the text for the speech bubbles for the ponysay --wrap param!
function getWrap() {
    wrapsize=$(( $(checkColumns) * 3 / 4 ))
    if (( $wrapsize < 40 )); then
	wrapsize=40
    fi
    export PONYWRAP=$wrapsize
}

## Reads in the config file and sets up things that are to be remembered
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

function tidyConfig(){
    if [[ -e ~/.unixTut/config ]]; then
	mv ~/.unixTut/config ~/.unixTut/configbkp
	cat ~/.unixTut/configbkp | sort | uniq > ~/.unixTut/config
    else
        mkdir -p ~/.unixTut
        touch ~/.unixTut/config
    fi
}

function ponygo(){
    getWrap
    echo -e "$2" | ponysay -b round --wrap $PONYWRAP -F "$1" 
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
	fi
	if [[ $tries > 3 ]]; then
	    echo "You gave it a few tries. It's ok, I'll show you how to do it."
	    echo " $ $cmd"
	    break
	else
	    echo "${retry} Attempt $tries of 3:"
	fi	
	tries=$((tries + 1))
	read -p "$strret" variable1
    done    
}
