#!/usr/bin/env bash
alias key=hint
alias unlock=hint
alias open=hint
alias Start=start
alias cd=cdp
alias ls=lsp
alias less=lessp
alias flee=escape
alias search=find
alias Attack=attack
alias kill=attack
alias Kill=attack
alias stab=attack
alias sword=attack
alias slay=attack
alias help=halp
alias menu=help
alias Princess=princess
alias n=walk
alias s=walk
alias e=walk
alias w=walk
alias go=walk
alias ls-lah=oops
export pick=use
export get=use
alias done=exit

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
    echo "If your bottom bar doesn't show up well, type light or dark to toggle it." | fold -sw $(checkColumns)
    echo -e "To move around, use the "$bold"cd"$normal" command, followed by where you want to go. To go back through the door you came from, type:\n\t"$bold"cd .."$normal"\nTo go into a room, for example bedroom, type:\n\t"$bold"cd bedroom"$normal | fold -sw $(checkColumns)
    echo -e "To look and see what is inside the room you are in, type "$bold"ls"$normal". To look really closely, type:\n\t"$bold"ls -lah"$normal | fold -sw $(checkColumns)
    echo -e "If you need to see where you currently are, type in "$bold"pwd"$normal"." | fold -sw $(checkColumns)
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

function cdp(){
    if [[ "$1" = "portal" ]]; then
#    if (( $1 == "*portal*" )); then
	export SUCCESS=true
	exit 3
    fi
    result="$(\cd $1 2>&1)";
    ec=$?
    #echo "exit is $ec, result is $result"
    if [[ $ec == 0 ]]; then
	\cd $1
	if [[ -e .monster ]]; then 
	    . .monster
	    monsterrun
	fi

    elif [[ $result && $result = *"Permission"* ]];then
	echo "You try the door, but it's locked tight."
    elif  [[ "$result" && "$result" = *"No such"* ]];then
	echo "What door are you trying to open? I can't find that one."
    else
	echo "Something went wrong, try again. Result is $result, exit code is $ec."
    fi
}

function lsp(){
    curdir=${PWD##*/}   
    result="$(\ls $@ 2>&1)"
    #echo "$result"
    if [[ ! "$result" ]]; then
	testForEmpty="$(\ls -lah $@ 2>&1)"
	if [[ "$testForEmpty" = *"Permission"* ]];then
	    echo "You can't look behind locked doors. Maybe try unlocking it first?"
	else
	    num=$(echo "$testForEmpty" | wc -l)	    
	    if [[ $num > 3 ]]; then
		echo "There are no doors or obvious items, but maybe there are some secret hiding places in here."
	    else
		echo "The room appears empty and bare."
		#echo " There are $num items."
	    fi
	fi
    elif  [[ "$result" = *"Permission"* ]];then
	
	testForEmpty="$(\ls $@ 2>&1)"
	if [[ ! "$testForEmpty" ]];then
	    echo "You can't look behind locked doors. Maybe try unlocking it first?"	   
	else
	    echo "It's pitch black, you can't see anything!"
	fi
    elif  [[ "$result" = *"No such"* ]];then
	echo "That place doesn't exist. Where exactly are you trying to look? Make sure you have a space after ls and dash if doing "$bold"ls -lah"$normal"."
    else
	#cat Description 2>/dev/null	
	if [[ -e Description ]]; then
	    fold -sw $(checkColumns) <Description 2>/dev/null	
	    #echo "Checking term... $TERM"
	fi
	if [[ $TERM = 'tty' ]]; then
	    \ls --color=tty $@
	else
	    echo "Here are the directoy contents:"
	    echo "$result"
	    #\ls $@
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
    echo -e "To unlock doors, use the ${b}chmod${r} command. To make it so anyone can open a door, for example, do:${nt}${b}chmod a+x Door_xxx${r}, where the xxx is the actual letters and numbers of the door you are opening." | fold -sw $(checkColumns) 
 
}

function light(){
    if [ "$PS1" ]; then
        PS1="\[\033[0;95m\]Hero: \$PONYUSER \[\033[0;91m\] You are currently in \$PWD.\n\[\033[0;96m\](Type done to return to menu)\[\033[0;92m\] $\[\033[0m\] "
    fi
}

function dark(){
    if [ "$PS1" ]; then
        PS1="\[\033[35m\]Hero: \$PONYUSER \[\033[31m\] You are currently in \$PWD.\n\[\033[34m\](Type done to return to menu)\[\033[32m\] $\[\033[0m\] "
    fi
}

dark