#!/usr/bin/env bash
alias unlock=hint
alias open=hint
alias Start=start
alias cd=cdp
alias flee=escape
export TREASURE=0
export HEALTH=100
alias search=find
alias Attack=attack
alias kill=attack
alias Kill=attack
alias stab=attack
alias sword=attack
alias slay=attack
alias apple='echo -n "A crisp, hearty apple is just what you needed! "; heal 5'
alias candy='echo -n "You pull out some tasty candy from your pack. Nomnom. "; heal 2'
alias help=halp
alias menu=help
alias n=walk
alias s=walk
alias e=walk
alias w=walk
alias go=walk
alias ls-lah=oops
export bold=$(tput bold)
export normal=$(tput sgr0)
export pick=use
export get=use

# Shorthand for newline
export n=$'\n'
# Shorthand for two newlines
export n2=$'\n\n'
# Shorthand for newline followed by tab
export nt=$'\n\t'
# Shorthand for bold face
export b=$'\033[1m'
# Shorthand for italic face
export i=$'\033[3m'
# Shorthand for reset font to normal
export r=$'\033[0m'

function checkColumns(){
#    cols=${COLUMNS:-50}
#    echo $cols
    tput cols
}

function use(){
    echo "Manipulating items is very limited. Maybe just try typing in the name of the item itself?"
}

function save(){
    echo "Saving your treasure for you!"
    echo "treasure: $TREASURE" >> ~/.unixTut/config
}
function load(){
    echo "Load not implemented. Here's 50 bucks for your trouble."
    export TREASURE=$((TREASURE + 50))
}
function oops(){
    echo "Oops, make sure you have a space after the command and before any dashes or other arguments." | fold -sw $(checkColumns)
}

function look(){
    echo "Use the "$bold"ls"$normal" command to look around. Try running "$bold"help"$normal" for more details!" | fold -sw $(checkColumns)
}
function walk(){
    echo "In Unix, you move around by changing directories using the "$bold"cd"$normal" command. There isn't a sense of north, south, east, west, but the available directories you can go to are listed using "$bold"ls"$normal". To go back a directory (sometimes referred to as 'up' a directory), type "$bold"cd .."$normal | fold -sw $(checkColumns)
}

function start(){
    echo "Welcome to the dungeon! Type "$bold"help"$normal" for some tips on moving around." | fold -sw $(checkColumns)
}

function halp(){
    echo "Welcome to the ponylinux dungeon! Muahahah...ahem. Here are some hints to help you with the basics." | fold -sw $(checkColumns)
    echo "If your bottom bar doesn't show up well, type light or dark to toggle it." | fold -sw $(checkColumns)
    echo -e "To move around, use the "$bold"cd"$normal" command, followed by where you want to go. To go back through the door you came from, type:\n\t"$bold"cd .."$normal"\nTo go into a room, let's say through Door_One, type:\n\t"$bold"cd Door_One"$normal | fold -sw $(checkColumns)
    echo -e "To look and see what is inside the room you are in, type "$bold"ls"$normal". To look really closely, type:\n\t"$bold"ls -lah"$normal | fold -sw $(checkColumns)
    echo "If you see a file using ls, you can open it with the "$bold"less"$normal" command, followed by the file name." | fold -sw $(checkColumns)
    echo -e 'To search for things, use the find command. It wants you to tell it where to search, and what to search for, like so:\n\t'$bold'find . -name "*monster*"'$normal'\nThat command would tell you where all of the monsters are in the dungeon! That is good to know, right?' | fold -sw $(checkColumns)
    echo -e "If you need to see where you currently are, type in "$bold"pwd"$normal". To get back to the start of the dungeon, type "$bold"escape"$normal"." | fold -sw $(checkColumns)
    #echo "" | fold -sw $(checkColumns)
    echo -e "To unlock doors, use the ${b}chmod${r} command. To make it so anyone can open a door, for example, do:${nt}${b}chmod a+x Door_xxx${r}, where the xxx is the actual letters and numbers of the door you are opening." | fold -sw $(checkColumns) 
    echo -e "To be able to see the contents of a dark room, you also use the ${b}chmod${r} command. To make it so anyone can see inside Door_xxx, do:${nt}${b}chmod a+r Door_xxx${r}" | fold -sw $(checkColumns) 
    #echo -e "(If you meant to invoke the help that comes with Unix, type it with a backslash in the front like so: \\help.)"
}

function attack(){
    if [[ -e .monster ]]; then
	echo "With a daring charge, you hack through the monster before you, dispatching it with one swing of your weapon. It fades away with an eerie laugh echoing from all around you."
	echo -e "function monsterrun(){ \necho 'There is a small spot of soot on the floor where once stood a frightful beast.' \n}" > .monster
    else
	echo "You look around alertly, but there is nothing to attack."	
    fi
}

function me(){
    echo "You are the brave hero! Your name on this system is $USER."
}

function light(){
    if [ "$PS1" ]; then
	PS1="\[\033[0;95m\]Hero: \$PONYUSER \[\033[0;91m\]Health: \$HEALTH \[\033[0;96m\]Treasure: \$TREASURE \[\033[0;92m\] $\[\033[0m\] "
    fi
}
function dark(){
    if [ "$PS1" ]; then
	PS1="\[\033[35m\]Hero: \$PONYUSER \[\033[31m\]Health: \$HEALTH \[\033[34m\]Treasure: \$TREASURE \[\033[32m\] $\[\033[0m\] "
	#PS1="\[\033[0;30m\]Hero: \$PONYUSER \[\033[0;52m\]Health: \$HEALTH \[\033[0;17m\]Treasure: \$TREASURE \[\033[0;54m\] $\[\033[0m\] "
    fi
}

function moneymoneymoney()
{
    echo "Wow, awesome! You gain $1 gold."
    TREASURE=$((TREASURE + $1))
}
	
function cdp(){
    if [[ "$1" == "teleport" ]]; then
	export SUCCESS=true
	exit 3
    fi
    if [[ -f "boulder" ]]; then
	ponysay -F tom "I'm conflicted."
	echo "There is a boulder in the way! Can you move it into a different room, turn it into dust, or remove it?"
	return
    fi
    if [[ "$1" == *"Door_002"* ]]; then
	if [[ ! -f "apple" ]]; then
	    ponysay -F squirrel "Hey, this door is locked from the inside. I can squeeze in and unlock it if you give me an apple. Just make a file called apple and we have a deal!"
	    return
	else
	     ponysay -F squirrel "Yay! Thanks, friend!"
	fi
    fi
    if [[ "$1" == *"Door_003"* ]]; then	
	if [[ ! -f "riddle" ]]; then
	    ponysay -F owl "WHooo goes there? I'll let you pass if you answer three riddles.  Please put the answers into a file called riddle. Ready? WHAT is your name? What is your quest? WHat is your favorite color? You must label which is which, such as 'name: Owl, color: purple, quest: to watch adventurers suffer! Hahahooohoooo!"
	    return
	else
	    pass=0
	    if  ! grep -qi "name" riddle ; then
		echo "I don't see your name."
		pass=1
	    fi
	    if  ! grep -qi "color" riddle ; then
		echo "I don't see your favorite color."
		pass=1
	    fi
	    if  ! grep -qi "quest" riddle ; then
		echo "I don't see your quest."
		pass=1
	    fi
	    if [[ $pass -eq 1 ]]; then return; fi
	    ponysay -F owl "You may pass."
	fi
    fi
    \cd $1
    if [[ $? -eq 0 ]]; then 
	echo "You walk through the door. It creaks as it swings shut."
	if [[ -e .monster ]]; then 
	    . .monster
	    monsterrun
	fi
	if [[ -e "key.txt" ]];then
	    cat key.txt
	    cat key
	    mkdir -p teleport
	fi
    fi
}

function escape(){
    if [[ -e "$DUNGEON" ]]; then
	cd $DUNGEON
    else
	echo "Not sure where to send you. Did you enter the dungeon yet?"
    fi
}
function guide(){
    hint
}
function hint(){
    echo e "You can make chmod work harder for you if you use the -R flag, which will unlock all subdirectories too!"
    echo -e "To unlock doors, use the ${b}chmod${r} command. To make it so anyone can open a door, for example, do:${nt}${b}chmod a+x Door_xxx${r}, where the xxx is the actual letters and numbers of the door you are opening." | fold -sw $(checkColumns) 
    echo -e "To be able to see the contents of a dark room, you also use the ${b}chmod${r} command. To make it so anyone can see inside Door_xxx, do:${nt}${b}chmod a+r Door_xxx${r}" | fold -sw $(checkColumns) 
}
# For Jetstream, use dark!
dark
#light
