#!/bin/bash

declare -a floors=(
"1aA series of doors to your left and right, marked Door_ followed by three random seeming letters and numbers. Each one is exactly the same as the other ones.",
"1bA series of doors to your left and right, marked Door_ followed by three random seeming letters and numbers. Each one is exactly the same as the other ones.",
"1cA series of doors to your left and right, marked Door_ followed by three random seeming letters and numbers. Each one is exactly the same as the other ones.",
"1dA series of doors to your left and right, marked Door_ followed by three random seeming letters and numbers. Each one is exactly the same as the other ones.",
"1eA series of doors to your left and right, marked Door_ followed by three random seeming letters and numbers. Each one is exactly the same as the other ones.",
"2afA series of doors to your left and right, marked Door_ followed by three random seeming letters and numbers. Each one is exactly the same as the other ones.",
"2bA series of doors to your left and right, marked Door_ followed by three random seeming letters and numbers. Each one is exactly the same as the other ones.",
"2xA series of doors to your left and right, marked Door_ followed by three random seeming letters and numbers. Each one is exactly the same as the other ones.",
"2dA series of doors to your left and right, marked Door_ followed by three random seeming letters and numbers. Each one is exactly the same as the other ones.",
"2eA series of doors to your left and right, marked Door_ followed by three random seeming letters and numbers. Each one is exactly the same as the other ones.",
"3aA series of doors to your left and right, marked Door_ followed by three random seeming letters and numbers. Each one is exactly the same as the other ones.",
"3nA series of doors to your left and right, marked Door_ followed by three random seeming letters and numbers. Each one is exactly the same as the other ones.",
"3cA series of doors to your left and right, marked Door_ followed by three random seeming letters and numbers. Each one is exactly the same as the other ones.",
"3dA series of doors to your left and right, marked Door_ followed by three random seeming letters and numbers. Each one is exactly the same as the other ones.",
"3eA series of doors to your left and right, marked Door_ followed by three random seeming letters and numbers. Each one is exactly the same as the other ones.",
"4aA series of doors to your left and right, marked Door_ followed by three random seeming letters and numbers. Each one is exactly the same as the other ones.",
"4nA series of doors to your left and right, marked Door_ followed by three random seeming letters and numbers. Each one is exactly the same as the other ones.",
"4cA series of doors to your left and right, marked Door_ followed by three random seeming letters and numbers. Each one is exactly the same as the other ones.",
"4dA series of doors to your left and right, marked Door_ followed by three random seeming letters and numbers. Each one is exactly the same as the other ones."
"4eA dark, musty hall lurks before you. Seemingly endless, featureless doors loom ahead through the gloom. It smells dank and moldy, like you are in the basement of an old building that occasionally floods. The floor has a fine layer of silt, causing your footsteps to scrape and shuffle as you walk. You feel doubt that you will ever find the Princess by groping randomly through these endless halls.",
"You open the door to catch a glimpse of snapping white teeth gleaming in contrast to the dark gloom. Soft glowing red light from a pair of eyes reveals the outline of a sinister, wolflike monster. The creature regards you as though you were a fly to be swatted. Before you have a chance to collect yourself, it pounces! What do you do? You can go back or try to dash around it, through another set of identical doors marked Door_ followed by three random seeming letters and numbers",
"This hallway has an inch or two of water on the floor, like you are walking under a leaky water main. You hear the steady sound of dripping water, playing like the ominous background music of a horror movie. There are doors to your left and right, marked Door_ followed by three random seeming letters and numbers.",
"You open the door and step into a dark hallway. The black walls are pocked and pitted, as though they were limestone eroded by ages of acidic rain. There is a disconcerting stickiness to the floor, like the floor of a dive bar. As you reach out to steady yourself, your hand drifts through a mat of cobwebs. Invisible threads stick to your face as you walk, and there is the sound of skittering from the ceiling. You turn to look at the sound, but you see only darkness."
"As you walk through the door, your feet slip out from under you and you tumble into a pit. It looks like there are enough stones from a wall or ceiling cave-in long ago, that you can pile them into a makeshift stairway out of the pit. As you climb out, bruised and scratched from moving rocks, the shaky floor ahead of you solidifies into a smooth hallway. The low light reveals a set of doors, marked Door_ followed by three random seeming letters and numbers.",
"A spiral staircase ascends before you. You see a hole in the wall, which may have been an intentional window. The wind blowing in from the window, and the dizzying view down, confirms that you are high up in a tower. Impossibly, doors fork off of the stairwell to the left and right as you go up. Each is labelled Door_ followed by three random seeming letters and numbers.",
)

function buildSubdir {
    local depth=$1
    local breadth=$2
    echo "buildSubdir was called with depth $depth and breadth $breadth"
    local depthminus=$((depth - 1))   
    if [[ $depth -lt 1 ]]; then
	echo "done, going back up"
	cd ..
	pwd
    else
	echo "depth is $depth"
	local i=1
	for (( i; i<=$breadth; i++ )); do
	    echo "Building number $i of $breadth at depth $depth"
	    local tempdir=$(mktemp -d ${PWD}/Door_XXX)
	    cd $tempdir
	    local ndex=$(((depth - 1) * globaldepth))
	    echo "ndex is $ndex"
	    local ndex=$((ndex + i -1))
	    echo "ndex is now $ndex"
	    echo "${floors[ndex]}" >> Description
	    echo -n "Recursing into dir: "
	    pwd
	    buildSubdir $depthminus $breadth
	    echo "back to depth $depth, i is $i"
	    pwd
	done
	cd ..
    fi
}

globaldepth=2
breadth=2
buildSubdir $globaldepth $breadth

exit 0

