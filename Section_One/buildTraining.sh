#!/usr/bin/env bash
me="$( cd "$(dirname "$0")" ; pwd -P )"
#echo "me is $me"
#monsterdir=${me}/monsters
#echo "tut dir is $monsterdir"

export DUNGEON=$(pwd)

start="The training grounds consists of a few different areas; you catch sight of a jousting arena, a running track, and a strength training weight pull. Each of these training areas are in their own directory. Your task is to go into each training area using the cd command. You will need to use ls to figure out what each training area is called. Once in the training area, use ls to accomplish the task in the area. You can type 'done' when you are finished or want to return to the menu."

joust="You walk into the training grounds, and the jousting area catches your attention. You see a display of wooden practice swords, sand sacks, and a ball pit. You decide to pick a fight with the practice dummy. You take a sand sack and throw it at the dummy, but it mocks you, unfazed. You grab a sword and charge at the dummy, and with a flourish, knock off its head and body slam it into the ball pit. You feel accomplished and fierce! You can go back by doing cd .."

track="The track curves around the outside of the joust arena and the strength training area. The dirt is hard packed and smooth, and you pick up speed pretty easily. As you near the first lap, hurdles appear that you didn't see before. You clear the first one just in time, and manage a much more graceful jump over the second and third one. You make a few more laps before you cool down and catch your breath. You feel good from the cardio."

strength="The strength training seems pretty prehistoric. There is a harness on the ground that is tied with rope to a huge rock. It looks like generations of soldiers have moved this rock back and forth across this stretch of ground, given the huge rut that is gouged out of the dirt. You shimmy the harness on and put your shoulders into it. Sweat beads down your face by the time you manage to pull the stone across to the other side. You feel unstoppable!"
if [[ -d "training" ]]; then
    exit 0
fi
mkdir -p training
echo $?
cd training
echo "${start}" >> Description
mkdir -p joust
cd joust
echo "${joust}" >> Description
cd ..
mkdir -p strength
cd strength
echo "${strength}" >> Description
cd ..
mkdir -p track
cd track
echo "${track}" >> Description
cd ../..
exit 0

