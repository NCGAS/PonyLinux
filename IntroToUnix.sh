#!/usr/bin/env bash

## Declare some Globals!
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
source Utilities.sh
export UNIXTUT=$(pwd -P $(dirname "$BASH_SOURCE"))
#echo "unixtut is $UNIXTUT"

## Declare some Functions!
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function cleanUp(){
    #perl -p -ibkp -e "s/^source ~./unixTut/ponyrun.sh.*$//" ~/.bashrc
    #rm -rf ~/.unixTut
    echo "Removing game files."
}

function execute(){
    ponysay -b round -F applejack 'Hi, '$name'! are you ready to swim on your own? Remember, to get back to the tutorial, type exit (or use the shortcut, the control key + d)'
    read -n 1 -r -p "Press enter key to continue"
    bash --init-file <(echo "ls; pwd")
    clear
    menu
}

function battle(){
    clear
    ponysay -b round -F shiningarmor 'Alright, '$name', so you'\'$'re feeling ready to explore the dungeon? \n\nGood! Let me give you just a few more pointers before you head out there, hero.'
    read -p "Press enter to continue"
    clear
    ponysay -b round -F shiningarmor 'You will need to cd into the dungeon first. Cd into a folder called dungeon. '
    read -p "Press enter to continue"
    clear
    ponysay -b round -F shiningarmorguard 'You will be on your own, working on the actual system. We won'\'$'t be able to guide you directly, but if you ever need help remembering how to run the scripts, just type in:\nguide\nto come back to this place and learn a bit more.'
    read -p "Press enter to continue"
    clear
    ponysay -b round -F  shiningarmorwedding 'Ok, let me make sure everything is prepared for you. Please bring back our Princess, safe and sound!'

    read -p "Press enter to continue"
    if [[ ! -e dungeon ]]; then
	bash buildPrincessDungeon.sh > /dev/null 2>&1 &
	PID=$!
	printf "Preparing dungeon.."
	while [ -d /proc/$PID ]
	do
	    printf "."
	    sleep 1
	done
	wait
    fi
    echo -e "\nYou make your final preparations. \nYou look back on your new friends and hope that you won't let them down. \nThe dungeon looms ominously in front of you - easily a ten-story stone structure made of what once must have been beautiful limestone, it is now blackened and foreboding. \nA chill wind pushes you forward to meet your fate. Will you save the day?"
    thisDir=$(dirname "$(readlink -f "$0")")
    bash --init-file <(echo ". ~/.bash_profile; . ${thisDir}/ponyrun.sh; cd ${thisDir}/dungeon; echo 'You enter the dungeon. To escape, type exit (or use the shortcut, control key + d). If you need a hint at any point, type hint.'")    
    menu
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
	fi
	echo "Attempt $tries of 3:"
	tries=$((tries + 1))
	read -p "$strret" variable1
    done    
}

function intro(){
    clear
    string="Hello! What is your name, friend?"
    lines=$(tput lines)
    if [[ $lines < $MINLINES ]]; then
	string="${string} And by the way, your screen is not big enough... try resizing the window so you have a bit more vertical space. You currently have $lines lines and we recommend $MINLINES."
    fi
    read -p "$(ponysay -b round -F rarity $string)" variable1
    echo "name: $variable1" > ~/.unixTut/config
    name=$variable1
    export PONYUSER="$name"
    ponysay -b round -F rarity "I'ts a pleasure to meet you, $variable1."
    read -p "Press enter to continue"
    #sleep 1
    clear
    ponysay -b round -F strawberrycream  'My lady, I have terrible news! The Princess has been kidnapped and is now locked in a dungeon!'
    read -p "Press enter to continue"
    #sleep 1
    clear
    ponysay -b round -F raritycomplaining 'Oh, Woe! Oh, what terrible news!'
    read -p "Press enter to continue"
    #sleep 1
    clear
    ponysay -b round -F raritydrama 'What will we do? Who will possibly save the Princess?'
    read  -p "Press enter to continue"
    #sleep 1
    clear
    ponysay -b round -F rarityponder "Wait, you just showed up! You are right on time to be volunteered as the Princess's hero!"
    read -p "Press enter to continue"
    #sleep 1
    clear
    menu 1
}

function menu(){
    clear
    big=""
    lines=$(tput lines)
    if [[ $lines < $MINLINES ]]; then
	big=" And by the way, your screen is not big enough... try resizing the window so you have a bit more vertical space. You currently have $lines lines and we recommend $MINLINES."
    fi
    string="Welcome back, $name! Ready to do some more training?"
    if [[ $1 = 1 ]]; then
	string="Alright, hero-in-training, Let's get you prepared to save the Princess! What would you like to learn first?"
    fi 
    string=${string}${big}
    ponysay -b round -F rarity ${string}$'\n\t1.) Getting around '${cdtutdone}$'\n\t2.) Directories '${dirtutdone}$'\n\t3.) Users and permissions '${usertutdone}$'\n\t4.) Opening and Navigating files '${opentutdone}$'\n\t5.) I am ready to face the dungeon!\n\t6.) I wanna do the intro over again.\n\t7.) Quit'

    read -p $'Please choose a number and press enter. You can always redo a tutorial you'\'$'ve already done.\n ' variable1
    clear
    case $variable1 in
	1)
	    /usr/bin/env bash "${UNIXTUT}/Section_One/cdTut.sh"
            ;;
	2)
	    /usr/bin/env bash "${UNIXTUT}/Section_One/dirTut.sh"
	    ;;
	3)
	    /usr/bin/env bash "${UNIXTUT}/Section_One/userTut.sh"
	    ;;
	4)
	    /usr/bin/env bash "${UNIXTUT}/Section_One/openTut.sh"
	    ;;
	5)
	    battle
	    ;;
	6)
	    intro
	    ;;
	7)
	    exit 0
	    ;;
	8)
	    execute
	    ;;
    esac
}

## Here's where the program kinda starts
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

checkProgress
greet="Welcome to Unix!"
if [[ $name ]]; then
    #export PONYUSER="$name"
    greet="Greetings, $name!"
fi
read -p "$(ponysay -b round -F royalnightguard ${greet}$'\nWould you like to play the Intro to Unix Tutorial Game? \n Press (y)es, then enter, to play; Press (n)o exit for now, and (q)uit to exit and never have this screen come up on login.\n\n')" variable1
#echo "got $variable1"

if [[ $variable1 = *"q"* || $variable1 = *"Q"* ]]; then
    cleanUp
elif [[ $variable1 = *"y"* || $variable1 = *"Y"* ]]; then
    if [[ $name ]]; then
	menu 2
    else
	intro
    fi	
else
    exit 0
fi
