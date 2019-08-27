#!/usr/bin/env bash
#trap 'echo -e "\n\nTo exit, please choose the quit option from the menu.\n"; menu 1' INT
#trap 'printf "%s%s\n\n%s\n%s" "$(tput setaf 3)" "$(tput blink)" "To exit, please choose the quit option from the menu." "$(tput sgr0)"' INT

## Declare some Globals!
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export UNIXTUT=$(cd $(dirname "$BASH_SOURCE") && pwd -P)
source ${UNIXTUT}/Utilities.sh
#echo "unixtut is $UNIXTUT"
export fromFunction=0
export killcount=0
## Declare some Functions!
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
function cleanUp(){
    #perl -p -ibkp -e "s/^source ~./unixTut/ponyrun.sh.*$//" ~/.bashrc
    #rm -rf ~/.unixTut
    #echo "Removing game files."
    echo "Goodbye!"
}

function catchInt(){
    echo
    #echo "Caught, frm is $fromFunction"
    #clear
    if (( $fromFunction == 0)); then
	ponysay -F fillypinkie -b round 'Are you going to quit? Type m to go back to the menu or q to quit.'
    else
	echo "${b}To exit, please choose the quit option from the menu.${r}"
	echo
	#printf "%s%s\n\n%s\n%s" "$(tput setaf 3)" "$(tput blink)" "To exit, please choose the quit option from the menu." "$(tput sgr0)"
    fi
}

trap catchInt SIGINT

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
    echo -e "\nAs you make your final preparations, you look back on your new friends and hope that you won't let them down.\n\nThe dungeon looms ominously in front of you - easily a ten-story stone structure made of what once must have been beautiful limestone, it is now blackened and foreboding.\n\nA chill wind pushes you forward to meet your fate. Will you save the day?" | fold -s
    #thisDir=$(dirname "$(readlink -f "$0")")
    # Figure out if we need to source any bash files
    sourceme=""
    if [ -f ~/.bash_profile ]; then
	sourceme=". ~/.bash_profile;"
    elif [ -f ~/.bashrc ]; then
	sourceme=". ~/.bashrc;"
    fi
    bash --init-file <(echo "$sourceme . ${UNIXTUT}/Section_One/ponyrun.sh; cd ${whereami}/dungeon; . .monster; echo 'You enter the dungeon. To escape, type exit (or use the shortcut: control key + d). If you need help at any point, type help, hint or guide for some pointers.'; printf '.'; sleep 1; printf '.'; sleep 1; printf '.\n';  monsterrun")
    battleresults=$?
    #echo "battle results is $battleresults, success is $success"
    if [[ $battleresults = 2 ]]; then
	shamemenu
    elif [[ $battleresults = 3 ]]; then
	yaymenu
    elif [[ $battleresults = 0 ]]; then
	#echo "Something went wrong!"
	clear
	echo "You book it out of that dungeon and back to the castle!"
	menu	
    else
	menu
    fi
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
    clear
    ponysay -b round -F rarity "It's a pleasure to meet you, $variable1."
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
    ponysay -b round -F rarityponder "Wait, $variable1, you just showed up! You are right on time to be volunteered as the Princess's hero!"
    read -p "Press enter to continue"
    #sleep 1
    clear
#    menu 1
}

function menu(){
    fromFunction=0
    if [[ $clearme ]]; then
	clear
    fi    
    checkProgress
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
    ponysay -b round -F rarity ${string}$'\n\t1.) Gentle Introduction '${gentletutdone}$'\n\t2.) Getting around '${cdtutdone}$'\n\t3.) Directories '${dirtutdone}$'\n\t4.) Users and permissions '${usertutdone}$'\n\t5.) Searching for files and folders\n\t6.) Opening and Navigating files '${opentutdone}$'\n\t7.) I am ready to face the dungeon!\n\t8.) I wanna do the intro over again.\n\t9.) Quit'

    read -ep $'Please choose a number and press enter. You can always redo a tutorial you'\'$'ve already done.\n ' rawInput
    # Todo: strip out non-printing characters from variable1!
    clear
    #echo "You said $rawInput"
#cleanperl=$(echo $rawInput | perl -p -e 's/\011\012\015\009\010\012\013\015\032\040\176//g')
cleanInput=$(echo $rawInput | tr -d '\011\012\015\009\010\012\013\015\032\040\176')
#echo "That is tr  $cleanInput"
#echo "That is perl  $cleanperl"
    case $cleanInput in
	1)
            fromFunction=1
            bash ${UNIXTUT}/Section_One/gentleTut.sh
            menu
            ;;
	2)
            fromFunction=1
            bash ${UNIXTUT}/Section_One/cdTut.sh
            menu
            ;;
	3)
            fromFunction=1
            bash ${UNIXTUT}/Section_One/dirTut.sh
            menu
	    ;;
	4)
            fromFunction=1
            bash ${UNIXTUT}/Section_One/permTut.sh
            menu
	    ;;
	5)
            fromFunction=1
            bash ${UNIXTUT}/Section_One/findTut.sh
            menu
	    ;;
        6)
            fromFunction=1
            bash ${UNIXTUT}/Section_One/openTut.sh
            menu
            ;;
	7)
            fromFunction=1
	    battle
	    ;;
	8)
            fromFunction=1
	    intro
	    menu
	    ;;
	9)
	    exit 0
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

function shamemenu(){
    clear
    ponygo redheart "We barely got you out of there! You look like you've been through some rough patches!${n2}We were able to heal you... but we still need your help! Can you get back in there, hero?${n2}Please help us ${b}FIND${r} the Princess! I'm just a doctor, but I might recommend using search techniques instead of walking around in such a dangerous place!${n}"
menu
}

function yaymenu(){
    clear
    ponygo celestia "Thank you so much for rescuing me! Your trials in the dungeon have proven your mastery over the basics of Unix. I think you are ready to move on to the next phase in your training. Keep an eye out for Section Two coming soon. Keep up the great work, hero $name!"
    menu
}


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
greet="Welcome to Unix!"
if [[ $name ]]; then
    #export PONYUSER="$name"
    greet="Greetings, $name!"
fi
read -p "$(ponysay -b round -F royalnightguard ${greet}$'\nWould you like to play the Intro to Unix Tutorial Game? \n Press (y)es, then enter, to play; Press (n)o, (q)uit, or e(x)it to exit.')" variable1

if [[ $variable1 = *"q"* || $variable1 = *"Q"* || $variable1 = *"n"* || $variable1 = *"N"* || $variable1 = *"x"* || $variable1 = *"X"* ]]; then
    exit 0
fi

if [[ -z $name ]]; then
    intro
fi
clear
while true; do
menu
  echo "Going another round"
done
exit 0
