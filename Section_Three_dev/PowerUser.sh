#!/usr/bin/env bash

## Declare some Globals!
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
realpath="$(readlink "$BASH_SOURCE")"
export UNIXTUT="$(cd "$(dirname "${realpath}")" && pwd -P)"
source ${UNIXTUT}/Utilities.sh
## Declare some Functions!
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function jellybeans(){
    clear
    ponygo trixieamulet "Fine, fine, I'll give you this map if you can guess how many jelly beans I have in this jar."
    echo ""
    read -p "Press enter to look at the jellybean jar (jar.txt)."
    whereami=$(pwd)    
    #echo " You leave $whereami behind"
    
    mkdir -p jellybeans
    if [[ ! -e "jar.txt" ]]; then
	#echo "building jellybean jar"
	/usr/bin/env bash ${UNIXTUT}/Section_Two/generateJellyBeans.sh $whereami > /dev/null 2>&1 
    fi
    /usr/bin/env bash ${UNIXTUT}/Developer_utilities/minibash.sh
    ponygo trixiestand "Well? do you give up?" 
    getInput '10345' "Not quite.";
    ponygo craftycrate "Told ya, Marelyn."
    menu
}

function maze(){
    clear
    ponysay -b round -F shiningarmor 'Alright, '$name', so you'\'$'re feeling ready to explore the dungeon? \n\nGood! Let me give you just a few more pointers before you head out there, hero.'
    read -p "Press enter to continue"
    clear
    ponysay -b round -F shiningarmorguard 'You will be on your own, working on the actual system. We won'\'$'t be able to guide you directly, but if you ever need help remembering how to run the scripts, just type in:\nhelp\nfor help and exit to come back to this place and learn a bit more.'
    read -p "Press enter to continue"
    clear
    ponysay -b round -F  shiningarmorwedding 'Ok, let me make sure everything is prepared for you. Please bring back our Princess, safe and sound!'
    whereami=$(pwd)
    read -p "Press enter to continue"
    if [[ ! -e dungeon ]]; then
	/usr/bin/env bash ${UNIXTUT}/Section_Two/buildmaze.sh $whereami > /dev/null 2>&1 &
	PID=$!
	printf "Preparing maze.."
	while [ -d /proc/$PID ]
	do
	    printf "."
	    sleep 1
	done
	wait
    fi
    echo -e "\nYou stride into the maze with confidence born of experience. After all, you already defeated the dungeon, twice! How bad can a silly maze be?" | fold -s
    # Figure out if we need to source any bash files
    sourceme=""
    if [ -f ~/.bash_profile ]; then
	sourceme=". ~/.bash_profile;"
    elif [ -f ~/.bashrc ]; then
	sourceme=". ~/.bashrc;"
    fi
    bash --init-file <(echo "$sourceme . ${UNIXTUT}/Section_Two/mazerun.sh; cd ${whereami}/maze; . .monster; echo 'You enter the maze. To escape, type exit (or use the shortcut: control key + d). If you need help at any point, type help, hint or guide for some pointers.'; printf '.'; sleep 1; printf '.'; sleep 1; printf '.\n';  monsterrun")
    battleresults=$?
    #echo "battle results is $battleresults, success is $success"
    if [[ $battleresults = 2 ]]; then
	shamemenu
    elif [[ $battleresults = 3 ]]; then
	yaymenu
    elif [[ $battleresults = 0 ]]; then
	#echo "Something went wrong!"
	clear
	echo "You book it out of that maze using the magic mirror the Princess gave you."
	menu	
    else
	menu
    fi
}

function menu(){
    if [[ $clearme ]]; then
	clear
    fi    
    checkProgress
    lines=$(tput lines)
    string=$'Welcome to the Second Section of your Linux Training: Lord of the Files!'
    if [[ $1 = 1 ]]; then
	string="You are free to do this section, but did you do want to do Section One first?"
    fi 
    ponysay -b round -F rarity ${string}$'1.) Searching file contents using grep\n\t2.) Chaining commands together\n\t3.) Controlling inputs and outputs\n\t4.) Making and taking shortcuts\n\t5.)Sedawk\n\t6.) Fairgrounds\n\t9.) I am ready for the maze!\n\tq) Quit'
    read -ep $'Please choose a number or letter and press enter. You can always redo a tutorial you'\'$'ve already done.\n ' rawInput
    # Todo: strip out non-printing characters from variable1!
    clear
    cleanInput=$(echo $rawInput | tr -d '\011\012\015\009\010\012\013\015\032\040\176')
    case $cleanInput in
	1)
            bash ${UNIXTUT}/runTutorial.sh ${UNIXTUT}/Section_Two/grepDialog.txt
            menu
            ;;
	2)
            bash ${UNIXTUT}/runTutorial.sh ${UNIXTUT}/Section_Two/pipeDialog.txt
            menu
            ;;
	3)
            bash ${UNIXTUT}/runTutorial.sh ${UNIXTUT}/Section_Two/channelDialog.txt
            menu
	    ;;
	4) 
            jellybeans
            
            menu
	    ;;	
        5)
            bash ${UNIXTUT}/runTutorial.sh ${UNIXTUT}/Section_Two/symDialog.txt
            menu
	    ;;
	6)
            bash ${UNIXTUT}/runTutorial.sh ${UNIXTUT}/Section_Two/whutDialog.txt
            menu
	    ;;
	7)
	    bash ${UNIXTUT}/Section_Two/minigames/PsychoPony.sh            
            menu
	    ;;
	8)
	    maze
	    ;;
        m)
            menu
            ;;
        *)
            exit 0
            ;;
    esac
}

#' This comment is just to fix my annoying bash syntax highlighting. Nothign to see hwere folks

## Here's where the program kinda starts
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
which ponysay >> /dev/null
if (( $? != 0 )); then
    echo "Uh-oh. A critical game component, ponysay, is not installed or not in the PATH. Please read the install instructions in the INSTALL file to get up to speed."
    exit 1
fi

# Hack to make it the right screen size...
printf "\e[8;45;100t"
tidyConfig
checkProgress

menu
#  echo "Going another round"
#done
exit 0
