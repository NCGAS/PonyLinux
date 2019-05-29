#!/usr/bin/env bash
function cleanUp(){
    #perl -p -ibkp -e "s/^source ~./unixTut/ponyrun.sh.*$//" ~/.bashrc
    #rm -rf ~/.unixTut
    echo "Removing game files."
}

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
}

function cdtut(){
    ponysay -b round -F pinkie 'Hi! I'\'$'ll be your instructor for the lesson on getting around in Unix.\nYou might be used to a window environment that has fancy things like mouse access and menus. \nIt might be hard to get used to doing things without windows, but a hero like you should have no problem!'
    read -p "Press enter to continue"


    ponysay -b round -F pinkiebounce $'What you are looking at now is called a shell - it'\'$'s a program that lets you interact with the underlying computer operating system. \n\nThe specific shell you are using is called Bash, and it has its own kind of language. You issue commands to the bash shell and it executes those commands. \n\nSome commands don'\'$'t seem to do anything after you hit enter! \nThey just return a new line and show some stuff followed by a $ character. This is called a prompt, because it is prompting you to tell it what to do. \n\nNo output is usually a good sign in Unix! If a command fails, it usually tells you.'
    read -p "Press enter to continue"

    ponysay -b round -F pinkie $'Whenever you are logged into a Unix system using a shell, you have a location - also called a directory or a folder. \n\nYou start out a new shell session from your home location. That'\'$'s where you sleep, so it makes sense that that is where you wake up! You can always find out where you are by typing in pwd and hitting enter. Now you try it.'
    getInput 'pwd' "Not quite."
    echo "Great! You are currently in:"
    pwd


    ponysay -b round -F pinkiebounce $'To move to a different location, you will use the cd command. CD stands for change directory. \n\nThink of it as opening a door, and going from one room into another. \n\nDirectories in Unix are hierarchical, which means that a directory can contain other directories in a nested way.'
    read -p "Press enter to continue"
    ponysay -b round -F pinkie $'Directories inside the current directory are called subdirectories. The directory that contains your current location is called the parent directory. \n\nIn the bash shell, the current directory can be denoted by a shorthand of one dot, or period: ".". The parent is two dots: "..". There isn'\'$'t a three dot shorthand though. \n\nTo go up a directory, you would use the cd command followed by two dots. You should try it! '
    getInput 'cd ..' "Make sure you have a space between cd and the two dots."
    cd ..
    echo "Nothing happened, so it worked! You are currently in:"
    pwd

    ponysay -b round -F pinkiebounce $'Sometimes, you want to backtrack to where you just were. For this, you can use the minus sign, or dash. Try it:'
    getInput 'cd -' "Make sure you have just one dash."
    echo "Now you backtracked to:"
    cd -
    #pwd

    ponysay -b round -F pinkiesilly $'You can only backtrack one step. If you keep typing in cd -, you'\'$'ll just bounce back and forth between two directories. See?'
    getInput 'cd -' "Make sure you have just one dash."
    echo "And now you are back to:"
    cd -

    ponysay -b round -F pinkie $'Have you seen a squiggly line, like ~? This special character stands for your home directory in Unix. You can use with the cd command to, like:\ncd ~\nThere is an even easier way, though. The cd command, by itself, with nothing after it, also takes you back home. No matter how lost you are, or how hard you party, you can always get home with just cd.'
    getInput 'cd' "Don't give up!"
    echo "Now you are back home!"
    cd
    pwd
    read -p "Press enter to continue"

    ponysay -b round -F pinkacopter "Great job! You are done with the first section. Good luck, $name!"
    read -n 1 -r -p "Press any key to continue"
    echo "cdtutdone:  (Done)" >> ~/.unixTut/config
    menu
}
function dirtut(){
    ponysay -b round -F rainbow 'Hi there. I'\'$'ll be teaching you more gory details about directories. \n\nSo you learned how to cd around, huh? But how do you know where to go, or what commands you can run?'
    read -p "Press enter to continue"


    ponysay -b round -F rainbowfirm $'The first thing you want to learn, is what directories come standard in Unix.\n\n If you do cd .. until you get dizzy, you will end up in the mega-parent directory. This directory is called the root directory, and it is denoted by a forward slash: /. \n\nThe root directory is like the base of a tree, and all other directories radiate out of it. Since directories are hierarchical, you can think of it like a tree with thick branches that split off into smaller and smaller ones, all the way down to the leaves.\n\nYou noticed that your location always starts with a / when you do pwd, right?'
    echo "Your current location:"
    pwd
    read -p "Press enter to continue"


    ponysay -b round -F rainbowsalute $'Inside the root directory, there are a few folders you should know about. One is the /bin directory, which contains commands that you might want to run, like bash itself. Bin stands for binary, which is the format that many commands are in - binary machine code which is ready to talk to the operating system directly. Binary files are hard to read by humans.\n\nAnother good directory to know is /usr/local, which has code in it customized to this computer. \n\nThe /lib and /lib64 directories contain libraries, which are software codes that are intended to be put inside other code and work in a modular way. \n\n The /tmp directory is a place you might end up putting temporary files that are generated while a command runs.\n\n/etc, /var, /proc, and /sbin are usually locked down to only admins - they contain operating system files. '
    read -p "Press enter to continue"


    ponysay -b round -F rainbowfly $'Okay, so now you know a little bit about the structure of Unix directories. How do you find out what'\'$'s in them? The next command you should know is ls'
    getInput 'ls' "Make sure it's a lowercase L followed by s. You don't need anything after it."
    #read -p $'Type in the command, cd  \n $ ' variable1
    #while [[ $variable1 != *"ls"* ]]; do
    #    read -p $"Don't give up! Try the command, ls \n $ " variable1
    #done
    ls
    read -p "Press enter to continue"


    ponysay -b round -F rainbowhurricane 'Great job, '$name'! Now get out there and be victorious!'
    read -n 1 -r -p "Press any key to continue"

# more about ~, and how it doesn't have /~
# more about ls
#which

    menu
}
function usertut(){
    ponysay -b round -F applejack 'Hi, '$name'. I'\'$'m going to teach you all about users in Unix.\n\nWell, you are using it right now, so you are a Unix user! \n\nOne thing about Unix is that spaces are a big issue. It'\'$'s really hard to include spaces in directory names, file names, and commands. \n\nThe same applies to user names; the computer won'\'$'t refer to you by Firstname Lastname like would be polite. Instead, your username is all lowercase and 8 or so characters long. You logged in, so maybe you already know it, but to find your username, type the id command.'
    read -n 1 -r -p "Press any key to continue"

    menu
#id
#permissions
#rwx
#chmod
#chgrp
}
function opentut(){
    ponysay -b round -F fluttershy 'Hello '$name', I'\'$'m going to tell you about opening files in Unix.'
    read -n 1 -r -p "Press any key to continue"

    menu
#less
#nano
#what to do if you vim by accident
# navigating
#man pages
}
function complicated(){
    menu
#pipes
#stderr
#stdout
# redirect
# awk, sed, wc
# grep
}
function srchtut(){
    ponysay -b round -F twilight 'Hi '$name', let'\'$'s go through how you can find files, directories, and content!'
    read -n 1 -r -p "Press any key to continue"

    menu
#find
#grep
#head
#tail
}
function battle(){
    ponysay -b round -F shiningarmor 'Alright, '$name', so you'\'$'re feeling ready to explore the dungeon? \n\nGood! Let me give you just a few more pointers before you head out there, hero.'
    read -n 1 -r -p "Press any key to continue"
    ponysay -b round -F shiningarmor 'You will need to cd into the dungeon first. Cd into a folder called dungeon. '
    read -p "Press enter to continue"

    ponysay -b round -F shiningarmorguard 'You will be on your own, working on the actual system. We won'\'$'t be able to guide you directly, but if you ever need help remembering how to run the scripts, just type in:\nguide\nto come back to this place and learn a bit more.'
    read -p "Press enter to continue"

    ponysay -b round -F  shiningarmorwedding 'Ok, let me make sure everything is prepared for you. Please bring back our Princess, safe and sound!'

    read -n 1 -r -p "Press any key to continue"
    if [[ ! -e dungeon ]]; then
	bash buildPrincessDungeon.sh &
	PID=$!
	echo "Preparing dungeon.."
	while [ -d /proc/$PID ]
	do
	    printf "."
	    sleep 1
	done
	wait
    fi
    echo "You make your final preparations. You look back on your new friends and hope that you won't let them down. The dungeon looms ominously in front of you - easily a ten-story stone structure made of what once must have been beautiful limestone, it is now blackened and foreboding. A chill wind pushes you forward to meet your fate. Will you save the day?"
    . ponyrun.sh
    
    exit 0
}

function getInput(){
    cmd=$1
    retry=$2
    local tries=2
#    strcmd='Type in this command: '${cmd}$' \n $ '
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

    read -p "$(ponysay -b round -F rarity 'Hello! What is your name, friend?')" variable1
    echo "name: $variable1" > ~/.unixTut/config
    name=$variable1
    ponysay -b round -F rarity "I'ts a pleasure to meet you, $variable1."
    read -p "Press enter to continue"
    #sleep 1

    ponysay -b round -F strawberrycream  'My lady, I have terrible news! The Princess has been kidnapped and is now locked in a dungeon!'
    read -p "Press enter to continue"
    #sleep 1

    ponysay -b round -F raritycomplaining 'Oh, Woe! Oh, what terrible news!'
    read -p "Press enter to continue"
    #sleep 1

    ponysay -b round -F raritydrama 'What will we do? Who will possibly save the Princess?'
    read  -p "Press enter to continue"
    #sleep 1

    ponysay -b round -F rarityponder "Wait, you just showed up! You are right on time to be volunteered as the Princess's hero!"
    read -p "Press enter to continue"
    #sleep 1

    menu 1
}

function menu(){

    string="Welcome back, $name! Ready to do some more training?"
    if [[ $1 = 1 ]]; then
	string="Alright, hero-in-training, Let's get you prepared to save the Princess! What would you like to learn first?"
    fi 
    ponysay -b round -F rarity ${string}$'\n\t1.) Getting around '${cdtutdone}$'\n\t2.) Directories '${dirtutdone}$'\n\t3.) Users and permissions '${usertutdone}$'\n\t4.) Opening and Navigating files '${opentutdone}$'\n\t5.) I am ready to face the dungeon!\n\t6.) I wanna do the intro over again.\n\t7.) Quit'

    read -p $'Please choose a number and press enter. You can always redo a tutorial you'\'$'ve already done.\n ' variable1

    case $variable1 in
	1)
	    cdtut
	    ;;
	2)
	    dirtut
	    ;;
	3)
	    usertut
	    ;;
	4)
	    opentut
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
    esac
}
checkProgress
greet="Welcome to Unix!"
if [[ $name ]]; then
    greet="Hi, $name!"
fi
read -p "$(ponysay -b round -F stevenmagnet ${greet}$'\nWould you like to play the Intro to Unix Tutorial Game? \n Press (y)es to play; Press (n)o exit for now, and (q)uit to exit and never have this screen come up on login.')" variable1
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
