#!/usr/bin/env bash

## Declare some Globals!
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
export UNIXTUT=$(cd $(dirname "$BASH_SOURCE") && cd .. && pwd -P)
source ${UNIXTUT}/Utilities.sh

## Declare some Functions!
## ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

function dungeon(){
    clear
    ponysay -b round -F shiningarmor 'Hello again, '$name'! The Princess lost her keys in the Dungeon. Sadly, that evil castle was destroyed and is now ruins! Can you search the devastation for the key?'
    read -p "Press enter to continue" 
    clear
    whereami=$(pwd)
    if [[ ! -d dungeon_ruins ]]; then
	/usr/bin/env bash ${UNIXTUT}/Section_Two/builddungeon.sh $whereami > /dev/null 2>&1 &
	PID=$!
	printf "Preparing dungeon.."
	while [ -d /proc/$PID ]
	do
	    printf "."
	    sleep 1
	done
	wait
    fi
    echo -e "\nYou stride into the dungeon with confidence born of experience. After all, you already defeated this dungeon, how bad can it be? Objective: Find the key the Princess lost in the dungeon when she was kidnapped." | fold -s
    # Figure out if we need to source any bash files
    sourceme=""
    if [ -f ~/.bash_profile ]; then
	sourceme=". ~/.bash_profile;"
    elif [ -f ~/.bashrc ]; then
	sourceme=". ~/.bashrc;"
    fi
    bash --init-file <(echo "$sourceme . ${UNIXTUT}/Section_Two/dungeonruinsrun.sh; cd ${whereami}/dungeon_ruins; echo 'You enter the dungeon. To escape, type exit (or use the shortcut: control key + d). If you need help at any point, type help, hint or guide for some pointers.'; printf '.'; sleep 1; printf '.'; sleep 1; printf '.\n'")
    battleresults=$?
    #echo "battle results is $battleresults, success is $success"
    if [[ $battleresults = 2 ]]; then
	shamemenu
    elif [[ $battleresults = 3 ]]; then
	yaymenu
    elif [[ $battleresults = 0 ]]; then
	#echo "Something went wrong!"
	clear
	echo "You book it out of the dungeon."
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
    ponysay -b round -F rarity ${string}$'\n\t1.) Review of reading files '${nanotutdone}$'\n\t2.) Copying files '${copytutdone}$'\n\t3.) Moving and renaming files '${mvtutdone}$'\n\t4.) Mental Health Break!\n\t5.) Deleting files with rm '${rmtutdone}$'\n\t6.) Creating files and folders '${mktutdone}$'\n\t7.) Back into the dungeon!\n\t8.) Bonus: Unix directory structure\n\tb) Bonus bonus: Find, the sequel\n\tq) Quit'
    read -ep $'Please choose a number or letter and press enter. You can always redo a tutorial you'\'$'ve already done.\n ' rawInput
    # Todo: strip out non-printing characters from variable1!'
    clear
    cleanInput=$(echo $rawInput | tr -d '\011\012\015\009\010\012\013\015\032\040\176')
    case $cleanInput in
	1)
            bash ${UNIXTUT}/runTutorial.sh ${UNIXTUT}/Section_Two/nanoDialog.txt
	    if [ -z $nanotutdone ]; then
		bash ${UNIXTUT}/runQuiz.sh ${UNIXTUT}/Section_Two/nanoQuiz.txt;
		echo "nanotutdone: (Done)" >> ~/.ponylinux/config
	    fi
            menu
	    ;;
        2)
            bash ${UNIXTUT}/runTutorial.sh ${UNIXTUT}/Section_Two/copyDialog.txt
	    if [ -z $copytutdone ]; then
		bash ${UNIXTUT}/runQuiz.sh ${UNIXTUT}/Section_Two/copyQuiz.txt;
		echo "copytutdone: (Done)" >> ~/.ponylinux/config
	    fi
            menu
            ;;
	3)
            bash ${UNIXTUT}/runTutorial.sh ${UNIXTUT}/Section_Two/mvDialog.txt
            if [ -z $mvtutdone ]; then
		bash ${UNIXTUT}/runQuiz.sh ${UNIXTUT}/Section_Two/mvQuiz.txt;
		echo "mvtutdone: (Done)" >> ~/.ponylinux/config
	    fi
	    menu
            ;;
	4)
            bash ${UNIXTUT}/Section_Two/minigames/PsychoPony.sh
            menu
	    ;;	
	5) 
            bash ${UNIXTUT}/runTutorial.sh ${UNIXTUT}/Section_Two/rmDialog.txt
	    if [ -z $rmtutdone ]; then
		bash ${UNIXTUT}/runQuiz.sh ${UNIXTUT}/Section_Two/rmQuiz.txt;
		echo "rmtutdone: (Done)" >> ~/.ponylinux/config
	    fi
            menu
	    ;;
	6)
            bash ${UNIXTUT}/runTutorial.sh ${UNIXTUT}/Section_Two/mkDialog.txt
	    if [ -z $mktutdone ]; then
		bash ${UNIXTUT}/runQuiz.sh ${UNIXTUT}/Section_Two/mkQuiz.txt;
		echo "mktutdone: (Done)" >> ~/.ponylinux/config
	    fi
            menu
	    ;;
        7)
            dungeon
            ;;
	8)
            bash ${UNIXTUT}/runTutorial.sh ${UNIXTUT}/Section_Two/dir2Dialog.txt
            menu
	    ;;
	b)         
            bash ${UNIXTUT}/runTutorial.sh ${UNIXTUT}/Section_Two/find2Dialog.txt
            menu 1
	    ;;
        m)
            menu
            ;;
        *)
	    tidyConfig
            exit 0
            ;;
    esac
}

#' This comment is just to fix my annoying bash syntax highlighting. Nothign to see hwere folks

function shamemenu(){
    clear
    ponygo redheart "Looks like you're back for a pep talk, eh? I hope you find those keys! Let me know if I can help!"
    read -p "Press enter to continue" 
    clear
menu
}

function yaymenu(){
    clear
    ponygo celestiasmall "Thank you so much for finding my keys! Let's see.."    

    echo "The Princess opens her safe vault with the key, and gasps in surprise and anguish."
    read -p "Press enter to continue" 
    clear 
    ponygo celestiasmall "Oh no!! My crown - it - it's gone!!"    
    echo "What could have happened? What dastardly games are afoot? Find out in Section Three!"
    read -p "Press enter to continue"     
    echo "sectiontwodone: (Done)" >> ~/.ponylinux/config
clear
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

menu
  echo "Going another round"
#done
exit 0
