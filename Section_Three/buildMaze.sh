#!/bin/bash

#width=$1
#depth=$2
depth=4

# Each node in a maze needs the following directions: forward, left, and right. 
# Possibly back as well, but I would recommend making that a random node just to be an awful person.
# Initialize the first step
mkdir -p maze
cd maze || exit
mkdir -p left
mkdir -p right
mkdir -p forward
index=1
currentDepth=0
treeroot=$(pwd -P)
echo "initializing"
echo "Currently in $treeroot"
while (( $currentDepth < $depth )); do
    if (( $currentDepth != $depth -1 )); then
	cd left
	mkdir -p forward
	ln -s ../right left
	ln -s ../forward right
	ln -s ../ back
	cd ../right
	mkdir -p forward
	ln -s ../left right
	ln -s ../forward left
	ln -s ../ back
	cd ../forward
	mkdir -p forward
	ln -s ../right/forward right
	ln -s ../left/forward left	
	ln -s ../ back
    else
	cd left
	ln -s $treeroot/left forward
	ln -s ../right left
	ln -s ../forward right
	ln -s ../ back
	cd ../right
	ln -s $treeroot/right forward
	ln -s ../left right
	ln -s ../forward left
	ln -s ../ back
	cd ../forward
	ln -s $treeroot/forward forward
	ln -s ../right/forward right
	ln -s ../left/forward left
	ln -s ../ back
	cd ..
	currentLoc=$(pwd -P)
	cd $treeroot
	ln -s $currentLoc back
	cd $currentLoc/forward
    fi
    let "currentDepth++"
    echo "depth is $currentDepth"
done

cd $treeroot
echo "looks like:"
tree $treeroot
echo "finished maze"
