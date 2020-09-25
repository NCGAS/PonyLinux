#!/usr/bin/env bash

## Declare some Globals!
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
#echo "bash src is $BASH_SOURCE"
#real=$(readlink "$BASH_SOURCE")
#echo "real path is $real"
#dir="$(dirname "${real}")"
#echo "dir is $dir"
#export UNIXTUT="$(cd "$(dirname "${real}")" && pwd -P)"
#export UNIXTUT="$(cd "${dir}/.." && pwd -P)"
export UNIXTUT=$(cd $(dirname "$BASH_SOURCE") && cd .. && pwd -P)
source ${UNIXTUT}/Utilities.sh

## Declare some Functions!
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function trainingTut(){
    clear
    ponysay -b round -F shiningarmor 'Hey there, '$name'! Before we send you into the dungeon to save our wonderful and miraculous princess, I thought you would like some extra practice at the training grounds. Let'\''s go get some practice using ls and cd.'
    #'
    echo ""
    read -p "Press enter to enter the training grounds."
    whereami=$(pwd)    
    #echo " You leave $whereami behind"
    if [[ ! -e training ]]; then
	#echo "building training grounds"
	/usr/bin/env bash ${UNIXTUT}/Section_One/buildTraining.sh $whereami > /dev/null 2>&1 
    fi
    #echo -e "\n You make your way around to the fields behind the castle." | fold -s

    # Figure out if we need to source any bash files
    sourceme=""
    if [ -f ~/.bash_profile ]; then
	sourceme=". ~/.bash_profile;"
    elif [ -f ~/.bashrc ]; then
	sourceme=". ~/.bashrc;"
    fi
    bash --init-file <(echo "$sourceme . ${UNIXTUT}/Section_One/trainingrun.sh; cd ${whereami}/training")
    battleresults=$?
    menu
}

function battle(){
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
    bash --init-file <(echo "$sourceme . ${UNIXTUT}/Section_One/dungeonrun.sh; cd ${whereami}/dungeon; . .monster; echo 'You enter the dungeon. To escape, type exit (or use the shortcut: control key + d). If you need help at any point, type help, hint or guide for some pointers.'; printf '.'; sleep 1; printf '.'; sleep 1; printf '.\n'; timer & monsterrun")
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
    myname=${name:-hero}
    ponysay -b round -F rarity "It's a pleasure to meet you, $myname. Oh, what's this?"
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
    ponysay -b round -F rarityponder "Wait, $myname, you just showed up! You are right on time to be volunteered as the Princess's hero!"
    read -p "Press enter to continue"
    #sleep 1
    clear
}

function menu(){
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
    ponysay -b round -F rarity ${string}$'\n\t1.) Gentle Introduction '${gentletutdone}$'\n\t2.) Getting around '${cdtutdone}$'\n\t3.) Directories '${dirtutdone}$'\n\t4.) Training Grounds\n\t5.) Users and permissions '${permtutdone}$'\n\t6.) Searching for files and folders'${findtutdone}$'\n\t7.) Opening and Navigating files '${opentutdone}$'\n\t8.) I am ready to face the dungeon!\n\t9.) Quit'

    read -ep $'Please choose a number and press enter. You can always redo a tutorial you'\'$'ve already done.\n ' rawInput
    # Todo: strip out non-printing characters from variable1!
    clear
cleanInput=$(echo $rawInput | tr -d '\011\012\015\009\010\012\013\015\032\040\176')
    case $cleanInput in
	1)
            bash ${UNIXTUT}/runTutorial.sh ${UNIXTUT}/Section_One/gentleDialog.txt
            if [ -z $gentletutdone ]; then
                bash ${UNIXTUT}/runQuiz.sh ${UNIXTUT}/Section_One/gentleQuiz.txt;
                echo "gentletutdone: (Done)" >> ~/.ponylinux/config
            fi
            menu
            ;;
	2)
            bash ${UNIXTUT}/runTutorial.sh ${UNIXTUT}/Section_One/cdDialog.txt
            if [ -z $cdtutdone ]; then
                bash ${UNIXTUT}/runQuiz.sh ${UNIXTUT}/Section_One/cdQuiz.txt;
                echo "cdtutdone: (Done)" >> ~/.ponylinux/config
            fi
            menu
            ;;
	3)
            bash ${UNIXTUT}/runTutorial.sh ${UNIXTUT}/Section_One/dirDialog.txt
            if [ -z $dirtutdone ]; then
                bash ${UNIXTUT}/runQuiz.sh ${UNIXTUT}/Section_One/dirQuiz.txt;
                echo "dirtutdone: (Done)" >> ~/.ponylinux/config
            fi
            menu
	    ;;
	4)
            trainingTut
            menu
	    ;;	
        5)
            bash ${UNIXTUT}/runTutorial.sh ${UNIXTUT}/Section_One/permDialog.txt
            if [ -z $permtutdone ]; then
                bash ${UNIXTUT}/runQuiz.sh ${UNIXTUT}/Section_One/permQuiz.txt;
                echo "permtutdone: (Done)" >> ~/.ponylinux/config
            fi
            menu
	    ;;
	6)
            bash ${UNIXTUT}/runTutorial.sh ${UNIXTUT}/Section_One/findDialog.txt
            if [ -z $findtutdone ]; then
                bash ${UNIXTUT}/runQuiz.sh ${UNIXTUT}/Section_One/findQuiz.txt;
                echo "findtutdone: (Done)" >> ~/.ponylinux/config
            fi
            menu
	    ;;
        7)
            bash ${UNIXTUT}/runTutorial.sh ${UNIXTUT}/Section_One/openDialog.txt
            if [ -z $opentutdone ]; then
                bash ${UNIXTUT}/runQuiz.sh ${UNIXTUT}/Section_One/openQuiz.txt;
                echo "opentutdone: (Done)" >> ~/.ponylinux/config
            fi
            menu
            ;;
	8)
	    battle
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
    ponygo celestia "Thank you so much for rescuing me! Your trials in the dungeon have proven your mastery over the basics of Unix. I think you are ready to move on to the next phase in your training - Section Two. Keep up the great work, hero $name!"
    echo "sectiononedone: (Done)" >> ~/.ponylinux/config
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

if [[ -z $sectiononestart ]]; then
    intro
    echo "sectiononestart: done" >> ~/.ponylinux/config
    clear
    menu 1
else
    clear 
    menu
fi
exit 0
