#!/usr/bin/env bash
alias key=halp
alias unlock=halp
alias open=halp
alias Start=start
alias cd=cdp
alias hint=halp
alias guide=halp
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
# Variables for tracking each section of the training
export completed_joust=0
export completed_track=0
export completed_strength=0

function checkColumns(){
    tput cols
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
    echo -e "To move around, use the "$bold"cd"$normal" command, followed by where you want to go. To go back to the area you came from, type:\n\t"$bold"cd .."$normal"\nTo go into an area, for example track, type:\n\t"$bold"cd track"$normal | fold -sw $(checkColumns)
    echo -e "To look and see what is inside the room you are in, type "$bold"ls"$normal". To look really closely, type:\n\t"$bold"ls -lah"$normal | fold -sw $(checkColumns)
    echo -e "If you need to see where you currently are, type in "$bold"pwd"$normal"." | fold -sw $(checkColumns)
}

function me(){
    echo "You are the brave hero! Your name on this system is $USER."
}

function cdp(){
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
    
    #Testing file location, and progress completion indicator
    if [[ $(basename $PWD) == 'joust' || $(basename $PWD) == 'strength' || $(basename $PWD) == 'track' ]]; then
	echo "use ls to look around, and then you can exit."	
    fi    
}
   
function lsp(){    
    if [[ -e Description ]]; then
	fold -sw $(checkColumns) <Description 2>/dev/null
	export test=1
    fi

    curdir=${PWD##*/}
    result="$(\ls $@ 2>&1)"
    echo "Here are the directoy contents:"
    echo "$result"
    dirname=$(basename $PWD)
    case $dirname in
	'joust')
	    echo "1 Great Job! Move onward!"
  	    let completed_joust=1
	    ;;
	'strength')
	    echo "1 You have made it!"
	    let completed_strength=1
	    ;;
	'track')
            echo "1 You have finished viewing this room!"
            let completed_track=1 #$completed
	    ;;
    esac
    if [[ $(basename $PWD) == 'joust' ]]; then
	echo "2 Great Job! Move onward!"
  	#let completed_joust=1
    fi
	    
    if [[ $(basename $PWD) == 'strength' ]]; then
	echo "2 You have made it!"
	#let completed_strength=1 
    fi		
    if [[ $(basename $PWD) == 'track' ]]; then 
	echo "2 You have finished viewing this room!"
	#let completed_track=1 #$completed
    fi		
	# After all is said and done, prompt user to a final message.
	export final_completion=$(($completed_joust+$completed_strength+$completed_track))
	# by adding if 'result' equals the description, it will count the completion.
	# putting it in this if-then statement, will assist it to not appear when it lists the results
	# and it will continue to count the completion after each directory has been entered, and the description has been printed.
	
	if [[ "$result" = Description ]]; then
	echo "You have completed: $final_completion of 3"
	fi
		
	if [[ $final_completion == 3 ]]; then
	sleep 1
	echo "You have completed all of the trainings! Please type exit to get back to the menu."
	fi
	
}  

function findBGColor(){
 # Check background color and revise light vs dark
    Ps=${1:-11}
 #printf "\033]$Ps;?\033\\" > filenm
 #perl -p -e 'm/rgb:([0-9A-Fa-f]{2})/' filenm
}

function light(){
    if [ "$PS1" ]; then
        PS1="\[\033[0;95m\]Hero: \$PONYUSER \[\033[0;91m\] You are currently in \$PWD.\n\[\033[0;96m\]To explore all the training areas, type ${b}ls${r}. Type done to return to the main menu\[\033[0;92m\] $\[\033[0m\]"
        
    fi
}

function dark(){
    if [ "$PS1" ]; then
        PS1="\[\033[35m\]Hero: \$PONYUSER \[\033[31m\] You are currently in \$PWD.\n\[\033[34m\]To explore all the training areas, type ${b}ls${r}. Type done to return to the main menu\[\033[32m\] $\[\033[0m\]"
    fi
}

dark
