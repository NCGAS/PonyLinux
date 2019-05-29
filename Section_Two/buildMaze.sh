#!/bin/bash

#width=$arg[0]
#depth=$arg[1]

width=1
depth=2

# Each node in a maze needs the following directions: forward, left, and right. 
# Possibly back as well, but I would recommend making that a random node just to be an awful person.
mkdir -p maze
cd maze
treeroot=$(pwd -P)
currentDepth=0
currentLoc=$(pwd -P)
# Initialize the first step
mkdir -p forward
mkdir -p right
mkdir -p left
echo "initializing"
echo "Currently in $currentLoc"
for wide in $(seq 0 $width); do
    mkdir -p right
    cd right
    echo "stepping right $wide"
    echo "currently in $(pwd -P)"
    mkdir -p forward
    ln -s .. back 
    ln -s .. left
    leftloopy="left/left/$leftloopy"
done
ln -s $leftloopy right
cd $currentLoc
for wide in $(seq 0 $width); do
    mkdir -p left
    cd left
    echo "stepping left $wide"
    echo "currently in $(pwd -P)"
    mkdir -p forward
    ln -s .. right
    ln -s .. back
    rightloopy="right/right/$rightloopy"
done
ln -s $rightloopy left
echo "finished initializing"
cd $currentLoc
echo "looks like:"
tree $treeroot

while (( $currentDepth < $depth )); do
    mkdir -p forward
    cd forward
    echo "starting depth $currentDepth"
    currentLoc=$(pwd -P)
    leftloopy=""
    rightloopy=""
    for wide in $(seq 0 $width); do
	ln -s ../right/forward right
	cd right
	echo "stepping right $wide"
	echo "currently in $(pwd -P)"
	mkdir -p forward
	ln -s .. left
	ln -s .. back
	leftloopy="left/left/$leftloopy"
    done
    ln -s $leftloopy right
    cd $currentLoc
    for wide in $(seq 0 $width); do
	ln -s ../left/forward left
	cd left
	echo "stepping left $wide"
	echo "currently in $(pwd -P)"
	rightloopy="right/right/$rightloopy"
	mkdir -p forward
	ln -s .. right
	ln -s .. back
    done
    ln -s $rightloopy left
    cd $currentLoc
    currentDepth=$((currentDepth + 1))
    echo "looks like:"
    tree $treeroot
done

rightloopy="right"
echo "Cleaning up forward/backs"
echo "Currently in $currentLoc"
ln -s ${treeroot} forward
ln -s ${currentLoc} ${treeroot}/back
cd $currentLoc
for wide in $(seq 0 $width); do
    cd right
    echo "currently in $(pwd -P)"
    rmdir forward
    ln -s ${treeroot}/${rightloopy} forward
    ln -s ${currentLoc}/${rightloopy} ${treeroot}/${rightloopy}/back 
    rightloopy="right/$rightloopy"
done
leftloopy="left"
cd $currentLoc
for wide in $(seq 0 $width); do
    cd left
    echo "currently in $(pwd -P)"
    rmdir forward
    ln -s ${treeroot}/${leftloopy} forward
    ln -s ${currentLoc}/${leftloopy} ${treeroot}/${leftloopy}/back
    leftloopy="left/$leftloopy"
done
echo "finished maze"
