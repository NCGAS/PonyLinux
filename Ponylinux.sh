#!/usr/bin/env bash
## Declare some Globals!
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#realpath="$(readlink -f "$(readlink "${BASH_SOURCE[0]}")")"
realpath="$(readlink "$BASH_SOURCE")"
export UNIXTUT="$(cd "$(dirname "${realpath}")" && pwd -P)"
#export UNIXTUT=$(cd $(dirname "$BASH_SOURCE") && pwd -P)
source ${UNIXTUT}/Utilities.sh
## Declare some Functions!
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function bigintro(){
    clear
    greet="Hello! "
    string="What is your name, friend?"
    lines=$(tput lines)
    if [[ $lines < $MINLINES ]]; then
	string="I noticed your screen is not big enough. You might try resizing the window so you have a bit more vertical space. You currently have $lines lines and we recommend $MINLINES. ${string}"
    fi
    read -p "$(ponysay -b round -F royalnightguard $greet $string)" variable1
    echo "name: $variable1" > ~/.ponylinux/config
    name=$variable1
    export PONYUSER="$name"
    clear
}

function bigmenu(){
    fromFunction=0
    if [[ $clearme ]]; then
	clear
    fi    
    checkProgress
    string="Welcome back, $name! Ready to do some more training?"
    if [[ $1 = 1 ]]; then
	string="It's nice to meet you, $name. I currently have two sections worth of material for you to go through. Section three will be out in early 2021. Start with section one, then move on to section two."
    fi 
    string=${string}${big}
    ponysay -b round -F royalnightguard ${string}$'\n\t1.) Section One - the very basics '${sectiononedone}$'\n\t2.) Section Two - Lord of the Files '${sectiontwodone}$'\n\tPress any other key to Quit.'

    read -e -p $'Please choose a number and press enter. You can always redo a section you'\'$'ve already done.\n ' rawInput
    clear
cleanInput=$(echo $rawInput | tr -d '\011\012\015\009\010\012\013\015\032\040\176')
    case $cleanInput in
	1)
            bash ${UNIXTUT}/Section_One/IntroToUnix.sh
            bigmenu
            ;;
	2)
            bash ${UNIXTUT}/Section_Two/LordOfTheFiles.sh
            bigmenu
            ;;
        m)
            bigmenu
            ;;
        *)
            exit 0
            ;;
    esac
}

#' This comment is just to fix my annoying bash syntax highlighting. Nothign to see hwere folks

function splash(){
    cat "${UNIXTUT}/splash.txt"
# Set the bg to black so it matches the image
    #printf "\e[48;5;16m\e[38;5;63m\n"
    #read -e -p $'Would you like to play the Intro to Unix Tutorial Game?\nPress (y)es, then enter, to play\nPress (n)o, (q)uit, or e(x)it to exit.' variable1
    read -e variable

    if [[ $variable != "y" ]]; then
	exit 0
    fi
}

## Here's where the program kinda starts
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

which ponysay >> /dev/null
if (( $? != 0 )); then
    echo "Uh-oh. A critical game component, ponysay, is not installed or not in the PATH. Please read the install instructions in the INSTALL file to get up to speed."
    exit 1
fi
splash
tidyConfig
checkProgress
if [[ -z $name ]]; then
    bigintro
fi
clear
if [[ -z $veteran ]]; then
    echo "veteran: yes" >> ~/.ponylinux/config
    bigmenu 1
else
    bigmenu
fi
exit 0
