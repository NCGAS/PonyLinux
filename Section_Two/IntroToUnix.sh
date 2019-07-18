#!/usr/bin/env bash

trap 'echo "To exit, please choose the quit option from the menu."; menu' INT

## Declare some Globals!
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export UNIXTUT=$(cd $(dirname "$BASH_SOURCE") && pwd -P)
source ${UNIXTUT}/Utilities.sh
echo "unixtut is $UNIXTUT"

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
    whereami=$(pwd)
    read -p "Press enter to continue"
    if [[ ! -e dungeon ]]; then
	/usr/bin/env bash ${UNIXTUT}/Section_One/buildPrincessDungeon.sh $whereami > /dev/null 2>&1 &
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
    #thisDir=$(dirname "$(readlink -f "$0")")
    bash --init-file <(echo ". ~/.bash_profile; . ${UNIXTUT}/Section_One/ponyrun.sh; cd ${whereami}/dungeon; echo 'You enter the dungeon. To escape, type exit (or use the shortcut: control key + d). If you need help at any point, type help, hint or guide for some pointers.'")    
    if [[ $? ]]; then
	shamemenu
    elif (( $SUCCESS == 1 )); then
	yaymenu
    else
	menu
    fi
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
    #checkProgress
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
    ponysay -b round -F rarity ${string}$'\n\t1.) Gentle Introduction '${gentletutdone}$'\n\t2.) Getting around '${cdtutdone}$'\n\t3.) Directories '${dirtutdone}$'\n\t4.) Users and permissions '${usertutdone}$'\n\t5.) Opening and Navigating files '${opentutdone}$'\n\t6.) I am ready to face the dungeon!\n\t7.) I wanna do the intro over again.\n\t8.) Quit'

    read -p $'Please choose a number and press enter. You can always redo a tutorial you'\'$'ve already done.\n ' rawInput
    # Todo: strip out non-printing characters from variable1!
    clear
    #echo "You said $rawInput"
#perl -p -e 's/$'
#cleanInput=$(cat $rawIput | tr -d '\011\012\015\009\010\012\013\015\032\040\176')
#echo "That is $cleanInput"
    case $rawInput in
	1)
	    /usr/bin/env bash "${UNIXTUT}/Section_Two/fileedit.sh"
            ;;
	2)
	    /usr/bin/env bash "${UNIXTUT}/Section_Two/regex.sh" && menu
            ;;
	3)
	    /usr/bin/env bash "${UNIXTUT}/Section_Two/awksed.sh" && menu
            menu
	    ;;
	4)
	    /usr/bin/env bash "${UNIXTUT}/Section_One/userTut.sh"
	    ;;
	5)
	    /usr/bin/env bash "${UNIXTUT}/Section_One/openTut.sh"
	    ;;
	6)
	    battle
	    ;;
	7)
	    intro
	    ;;
	8)
	    exit 0
	    ;;
	9)
	    execute
	    ;;
    esac
}

#' This comment is just to fix my annoying bash parser. Nothign to see hwere folks

function shamemenu(){
    clear
    ponygo redheart $'We barely got you out of there! You look like you'\'$'ve been through some rough patches! \n\n We were able to heal you... but we still need your help! Can you get back in there, hero?\n\nPlease help us '${bold}'FIND'${normal}$' the Princess! I'\'$'m just a doctor, but I might recommend using search techniques instead of walking around in such a dangerous place!\n'
menu
}

function yaymenu(){
    clear
    ponygo celestia $'Thank you so much for rescuing me! Your trials in the dungeon have proven your mastery over the basics of Unix. I think you are ready to move on to the next phase in your training. For the next step, exit the menu and run Section_Two/IntroToUnix.sh. Keep up the great work, hero '$name'!'
menu
}


## Here's where the program kinda starts
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
which ponysay >> /dev/null
if (( $? != 0 )); then
    echo "Uh-oh. A critical game component, ponysay, is not installed or not in the PATH. Please read the install instructions in the INSTALL file to get up to speed."
    exit 1
fi
checkProgress
greet="Welcome to Unix!"
if [[ $name ]]; then
    #export PONYUSER="$name"
    greet="Greetings, $name!"
fi
read -p "$(ponysay -b round -F royalnightguard ${greet}$'\nWould you like to play the Intro to Unix Tutorial Game? \n Press (y)es, then enter, to play; Press (n)o exit for now, and (q)uit to exit and never have this screen come up on login.')" variable1

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
