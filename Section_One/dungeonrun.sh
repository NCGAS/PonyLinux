#!/usr/bin/env bash
alias key=hint
alias unlock=hint
alias open=hint
alias Start=start
alias cd=cdp
alias ls=lsp
alias less=lessp
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
alias Princess=princess
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

function princess(){
    echo "You are looking for the Princess. It's a little weird now that you think about it, but no one ever told you her full name. You hope to "$(tput bold)"find"$(tput sgr0)" her somewhere in this dungeon."
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

function ouch()
{
    if [[ "$1" != 0 ]]; then
	re='^[0-9]+$'
	if [[ "$1" =~ $re ]] ; then
	    export HEALTH=$((HEALTH - $1))
	    if [ "$HEALTH" -le 0 ]; then
		echo "The last thought that goes through your mind before you lose consciousness is a deep sense of self disappointment and failure."
		pause=0
		while [ $pause -lt 7 ]; do
		    sleep 1
		    echo -n "."
		    let pause=pause+1
		done
		exit 1
	    fi
	    echo "Ouch! You lost $1 health!"	
	fi
    fi    
}

function heal()
{
    if [[ "$1" != 0 ]]; then
	re='^[0-9]+$'
	if [[ "$1" =~ $re ]] ; then
	    export HEALTH=$((HEALTH + $1))
	    if [ "$HEALTH" -ge 100 ]; then
		echo "You feel as good as new!"
		export HEALTH=100
	    fi
	    echo "Yay! You gain $1 health!"	
	fi
    fi    
}

	
function cdp(){
    #echo $1
    if [[ "$1" = "portal" ]]; then
#    if (( $1 == "*portal*" )); then
	export SUCCESS=true
	exit 3
    fi
    #stat $1
    #\cd $1 2>&1 > $PIPE
    #result="<$PIPE"; then
    #if \cd $1 2>&1; then
    result="$(\cd $1 2>&1)";
    ec=$?
    #echo "exit is $ec, result is $result"
    if [[ $ec == 0 ]]; then
	\cd $1
	echo "You walk through the door. It creaks as it swings shut."
	if [[ -e Description ]]; then 
	    ouchies=$(perl -0777 -ne 'print m/(\d+) damage[ .!]/ ? $1 : 0;' Description 2>/dev/null)	
	    ouch $ouchies
	    #echo "found desc"
	fi
	if [[ -e .monster ]]; then 
	    . .monster
	    monsterrun
	fi
	if [[ -e "Princess" ]];then
	    . Princess
	    monsterrun
	fi
    elif [[ $result && $result = *"Permission"* ]];then
    #local lss="$(ls -ld "$1")"
    #if [ "${lss:5:1}" = "x" ]; then
	echo "You try the door, but it's locked tight."
    elif  [[ "$result" && "$result" = *"No such"* ]];then
	case "$1" in
	    "back") walk;;
	    "forward") walk;;
	    "left") walk;;
	    "right") walk;;
	    "n") walk;;
	    "N") walk;;
	    "s") walk;;
	    "S") walk;;
	    "e") walk;;
	    "E") walk;;
	    "w") walk;;
	    "W") walk;;
	    *) echo "What door are you trying to open? I can't find that one." ;;
	esac	
    else
	echo "Something went wrong, try again. Result is $result, exit code is $ec."
    fi
}

function lsp(){
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
	    echo "$result"
	    #\ls $@
	fi
    fi
}

function lessp(){
    if [[ -e "$1" && "$1" == ".treasure" ]]; then
	. .treasure
	moneyrun
	echo -e 'function moneyrun(){\n echo "There is an empty treasure chest in here." \n}' > .treasure
    else
	\less $@
    fi

}

function timer(){
    while sleep 600; do
	printf "\n\nSorry for this interruption, but you've been in here for a little while now. Are you trying every door? There must be a better way to FIND the Princess!\n\n"
    done
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
    echo -e "To be able to see the contents of a dark room, you also use the ${b}chmod${r} command. To make it so anyone can see inside Door_xxx, do:${nt}${b}chmod a+r Door_xxx${r}" | fold -sw $(checkColumns) 
#    echo -e "Doors in Unix are selective to WHO is allowed to pass or look around. There are three groups of people - the User, the Group, and Other.\n\tIf you own the directory you are going to (the door you are about to open), then the User permissions apply.\n\tIf you don't own the directory you are going to, but you are a member of the group that the directory belongs to, then the Group permissions apply.\n\tIf you don't own the directory you are going to and don't belong to the directory's group, then the Other permissions apply.\n\nTo figure out who you are and what group you are in, type in the id command. The output shows your username, your user id, and all the groups you belong to and their respective group ids. \nIt is normal to belong to a group that is the same as your username, and to be a part of multiple groups.\nTo figure out who owns the directory you are in or want to go in, type ls -lah. The . directory means the one you are currently in. The .. directory refers to the directory that contains the current one, also called parent directory.\n" | fold -sw $(checkColumns) 
}
# For Jetstream, use dark!
dark
#light
