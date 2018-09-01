#!/bin/bash

alias cd=cdp
alias ls=lsp
alias flee=escape

function cdp(){
    #echo $1
    #stat $1
    #\cd $1 2>&1 > $PIPE
    #result="<$PIPE"; then
    #if \cd $1 2>&1; then
    result="$(\cd $1 2>&1)";
    ec=$?
    #echo "exit is $ec, result is $result"
    if [[ $ec == 0 ]]; then
	\cd $1
	echo "You open the door. It creaks a little as it swings open."
    elif [[ $result && $result = *"Permission"* ]];then
    #local lss="$(ls -ld "$1")"
    #if [ "${lss:5:1}" = "x" ]; then
	echo "You try the door, but it's locked tight."
    elif  [[ "$result" && "$result" = *"No such"* ]];then
	echo "What door are you trying to open? Try spelling it out a bit slower."
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
	    echo "You can't look behind locked doors. Maybe try finding a key first?"	   
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
	    echo "You can't look behind locked doors. Maybe try finding a key first?"	   
	else
	    echo "It's pitch black, you can't see anything!"
	fi
    elif  [[ "$result" = *"No such"* ]];then
	echo "That place doesn't exist. Where exactly are you trying to look? Try spelling it out a bit slower."
    else
	cat Description 2>/dev/null
	#echo "$result"
	\ls --color=tty $@
    fi
}

escape(){
    unalias cd
    unalias flee
}
function guide(){
    bash ~/.unixTut/runGuide.sh
}
function key(){
    printf "To unlock doors, use the chmod command. Doors in Unix are selective to WHO is allowed to pass or look around. There are three groups of people - the User, the Group, and Other.\n\tIf you own the directory you are going to (the door you are about to open), then the User permissions apply.\n\tIf you don't own the directory you are going to, but you are a member of the group that the directory belongs to, then the Group permissions apply.\n\tIf you don't own the directory you are going to and don't belong to the directory's group, then the Other permissions apply.\n\nTo figure out who you are and what group you are in, type in the id command. The output shows your username, your user id, and all the groups you belong to and their respective group ids. \nIt is normal to belong to a group that is the same as your username, and to be a part of multiple groups.\nTo figure out who owns the directory you are in or want to go in, type ls -lah. The . directory means the one you are currently in. The .. directory refers to the directory that contains the current one, also called parent directory.\n"
}
