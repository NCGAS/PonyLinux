#!/usr/bin/env bash
me="$( cd "$(dirname "$0")" ; pwd -P )"
monsterdir=${me}/monsters
export DUNGEON=$(pwd)
# Monsters are in a folder (called monsters) with the names below. We should try not to use any given one more than once.
# To implement a new monster, copy the monster template file in the monsters folder to a new name and put the name in the list below.
declare -a monsters=("azzy"
"coon"
"fido"
"manti"
"owl"
)

declare -a floors=(
"The passage before you seems crudely hewn from the surrounding rock. As you trace your fingers along the stony walls it feels like the marks were left not by tools, but by some large clawed hand. Your blood chills for a moment as you imagine whatever beast might have had the force to do this occupying the tunnel with you, but steeling your heart you look ahead to see several doors, marked Door_ followed by three random seeming letters and numbers."
"As you open the door to this passage the pungent smell of must and mold imediately invades your nostrils. The walls are covered in a slick sheen of black and green mold and you try desperately not to breathe in too deep as you make your way through to the doors, marked Door_ followed by three random seeming letters and numbers."
"It takes you a moment to notice, as you walk through the hall that every sound you make echos back a moment later, just a little too loud and a bit distorted. The further you walk the more the sound of your own footsteps reverberating piles up and you hurry towards one of the doors, marked Door_ followed by three random seeming letters and numbers to escape the sound before it drives you mad."
"Upon opening the door to the hall you are immediately overwhelmed by a stream of bats flying in your face. The noise and wings buffet you, completely drowning out all rational thought as you wave your arms frantically trying to clear the space around your head. Claws and wings leave little papercuts on you as the swarm passes, dealing you 5 damage. As suddenly as they flew out, the last of the bats passes you and once again you are left in silence to take in the rather plain looking passageway before you. To either side, doors marked Door_ followed by three random seeming letters and numbers."
"Your torches flicker as you open up this passageway. It seems there's a fairly strong breeze coming from down the hall. You could almost swear you could detect a faint scent of the ocean in the warm air as it whips around you. That can't be right though, can it? To you left and to your right you see more doors marked Door_ followed by three random seeming letters and numbers."
"This passage seems more finished than those that came before. Carpet lines the ground and the walls are painted and tastefully decorated. Seems like a lot of trouble for a place like this. The doors here too are just a bit nicer with brass hinges and solid looking doorknobs."
"You open the door and the hallway before you looks like it belongs in a tavern. Wooden beams and panelling make up the walls and ceiling, and there are unadorned wool rugs under your feet. Wrought iron candle holders jut from the walls, with long ivory candles that keep the hall well-lit. There are several chandeliers hanging from iron chains from the beams of the ceiling, also lit with candles. At the end of the hall, iron-braced wooden doors stand before you, marked with black paint: Door_ followed by three random seeming letters and numbers." 
"The hallway before you has strange markings on the floor. You walk carefully, trying to figure out what they mean, when one of the floor tiles gives way when you step on it. A dart flies out of a hole in the wall you didn't see before, striking you in the arm for 10 damage. You yipe in surprise, briefly glad no one is around to witness your un-heroic squeak. More cautious now, you find three more tiles that look suspicious and are able to avoid tripping them. You get to the other side where there are innocent-looking doors marked Door_ followed by three random seeming letters and numbers."  
"The passage grows more and more narrow as you progress. What started out wide enough for two to walk side by side with ease before long leaves one feeling cramped and claustrophobic. Probably best to pick one of the doors to either side before risking getting stuck in the passage itself."
"Nothing seems too particularly notable about this dark hallway until you let your hand graze against the wall. Everything, it seems, is lined with soot. The dark powder sticks instantly to you and soon starts to spread to your clothes as well. Whatever color you had on your items is soon obscured by the clinging soot. Ahead you see door after door, marked Door_ followed by three random seeming letters and numbers."
"A small stream flows through the center of this passageway. The soft burble of running water is soothing and, after so much thirst-inducing walking, drinking a bit of the water seems mighty tempting. As you lean close there's something about the scent of the water that warns you away though, perhaps another source would be better. As you walk along you see to either side, doors marked Door_ followed by three random seeming letters and numbers."
"A dark, musty hall lurks before you. Seemingly endless, featureless doors loom ahead through the gloom. It smells dank and moldy, like you are in the basement of an old building that occasionally floods. The floor has a fine layer of silt, causing your footsteps to scrape and shuffle as you walk. You feel doubt that you will ever find the Princess by groping randomly through these endless halls."
"This hall is lined with timber, the whole thing managing to seem positively warm and inviting compared to some of the passages you've seen. The scent of pine pervades the space as your light reflects warmly off the timber to reveal doors on either side of the hall marked Door_ followed by three random seeming letters and numbers."
"You see a large lair with bones piled in dark corners. The air is foul with the smell of death. On the far side is a set of identical-looking doors marked Door_ followed by three random seeming letters and numbers."
"This hallway has an inch or two of water on the floor, like you are walking under a leaky water main. You hear the steady sound of dripping water, playing like the ominous background music of a horror movie. There are doors to your left and right, marked Door_ followed by three random seeming letters and numbers."
"You open the door and step into a dark hallway. The black walls are pocked and pitted, as though they were limestone eroded by ages of acidic rain. There is a disconcerting stickiness to the floor, like the floor of a dive bar. As you reach out to steady yourself, your hand drifts through a mat of cobwebs. Invisible threads stick to your face as you walk, and there is the sound of skittering from the ceiling. You turn to look at the sound, but you see only darkness."
"As you walk through the door, your feet slip out from under you and you tumble into a pit, taking 5 damage from the fall. It looks like there are enough stones from a wall or ceiling cave-in long ago, that you can pile them into a makeshift stairway out of the pit. As you climb out, bruised and scratched from moving rocks, the shaky floor ahead of you solidifies into a smooth hallway. The low light reveals a set of doors, marked Door_ followed by three random seeming letters and numbers."
"A spiral staircase ascends before you. You see a hole in the wall, which may have been an intentional window. The wind blowing in from the window, and the dizzying view down, confirms that you are high up in a tower. Impossibly, doors fork off of the stairwell to the left and right as you go up. Each is labelled Door_ followed by three random seeming letters and numbers."
"The blank white walls, white ceiling and white floor yawn before you. The lack of shadow or definition give you a brief feeling of vertigo as you are not sure which way is up or down, and you feel like you might fall down this white tube forever. You shake your head and make it to the end of the hall, where there are doors marked Door_ followed by three random seeming letters and numbers."
"The door opens up not to a hallway or room, but to the outside world. There is a meadow ahead of you that is in full Spring splendor, with flowers and the smell of fresh rain. You look behind you and the door stands there like a portal. As you proceed, your tracks are apparent in the dew of the grass, but as you walk you come upon your tracks again and again. You find yourself in front of more doors standing in the middle of the meadow, marked Door_ followed by three random seeming letters and numbers."
"The way before you is pitch black. As you probe forward with your foot, your solid-seeming footing gives way to a slick surface and you find yourself sliding down a chute. You land in a pile of pillows which cough feathers out the seams as you scramble over them. There are doors ahead of you which appear to be upholstered in silk, marked Door_ followed by three random seeming letters and numbers."
"The hallway before you curves to the left, and as you follow it it keeps curving to the left. You feel like it must hit itself at some point, but it never does. You do what feels like 3 rotations and there is finally a wall with some doors. You wonder if you are going about this dungeon the right way as you look at the doors marked Door_ followed by three random seeming letters and numbers."
"A set of stairs bend upward before you, getting steeper and steeper as you ascend. A faint wind pulls cloyingly at your clothes as the wide, wooden stairs give way to metal-railed industrial-looking steps, then to a ladder that you would expect to find in a sewer drain, then finally to a rickety rope-and-wood-dowel ladder that you remember building for a treehouse in your childhood. It sways in the wind and you cling to it as you look down and realize the ground is far below you. Terror grips you and you can't move your body. Just as you hear the sound of creaking rope strands tearing apart from age and strain, you see before you a wide tree branch in an impossibly large tree. You step onto the platform of the treehouse, and there are child-sized wooden doors on the treehouse, marked Door_ followed by three random seeming letters and numbers."
"Driving rain greets you as you open the door to the next room. You don't see anything through the sheet of water angrily pelting you from somewhere above. You run full-tilt to get to the other side, but you find yourself drenched to the bone. Your teeth chatter as you are soaked through-and-through, and the clammy dungeon walls offer neither respite nor shelter. You take 5 damage as your blood chills, and you run faster to try to keep warm. Just as you think to turn back, you see an awning ahead and dive for it. Under the awning, the sound of rain fades and you find yourself warm and dry once more. You wonder if this is the right way to be looking for the Princess. There are doors in front of you, painted in pastel colors and marked Door_ followed by three random seeming letters and numbers."
"You open the door and find yourself knocked flat to the ground by strong wind whipping from around the room. The sound of ripping wood, stone, and metal from above makes you look up to see a hole in the window of this dungeon hall. Glass lines the floor where it looked like a boulder was chucked through the wall. A black cloud outside has touched down on the ground and in a moment you take in the terrible beauty of the tornadic storm. Hail starts pelting you sideways from the hole in the wall and you run to the other side. Part of the wall here has collapsed inward but you squeeze under it to get out of the stinging ice storm. You take 5 damage from being struck by ice and debris. You see damaged doors marked Door_ followed by three random seeming letters and numbers."
)

more="A perfectly normal dungeon hallway extends before you. At the end of the hall there are perfectly normal dungeon doors, marked Door_ followed by three random seeming letters and numbers. You feel a little like you are losing your mind in here."
start="You look around as the large, ponderous dungeon doors close behind you. There's an unsettling finality to the way they shut, but your job is to perform a rescue. Whoever built this dungeon had an odd sense of naming rooms. Each door is labeled Door_ followed by three random seeming letters and numbers."
deadend="You walk into a room which is round, with even stone blocks making up the walls. It looks like the only door out of this room is the one you came from."
princess="Your weariness and battered body seem to fade away from your worries as soon as you step into this room. The one you were trying so desperately to find stands before you. The Princess, even though she is locked in a small cell with little amenity, radiates such splendor that is takes you a moment to realize that you have succeeded. You run to her aide, unlocking the iron door to her cell a the key you find in the room. With a tired smile, your princess thanks you graciously and leans on your proferred shoulder as you make haste to retreat from this awful place." 
travelpack="You have several things in your pack: Some shiny red apples, some candy that looks like raffy wrapped in paper, and a decent-looking sword! in your pack. There are a few spots of tarnish on the blade, but it feels solid. The hilt is inscribed with the Princess's insignia. You can use the sword by typing sword, and eat an apple or candy by typing apple or candy."
#key="To unlock doors, use the chmod command. To make it so anyone can open a door, for example, do chmod a+x Door_xxx, where the xxx is the actual letters and numbers of the door you are opening. To be able to see the contents of a dark room, you also use the chmod command. To make it so anyone can see inside Door_xxx, do chmod a+r Door_xxx"
locked=""
darked=""
numDescriptions=${#floors[@]}
RANDOM=$$
function buildSubdir {
    local depth=$1
    local breadth=$2
    #echo "buildSubdir was called with depth $depth and breadth $breadth"
    local depthminus=$((depth - 1))   
    if [[ $depth -lt 1 ]]; then
	#echo "done, going back up"
	cd ..
	pwd
    else
	#echo "depth is $depth"
	local i=1
	for (( i; i<=$breadth; i++ )); do
	    #echo "Building number $i of $breadth at depth $depth"
	    local tempdir=$(mktemp -d ${PWD}/Door_XXX)
	    cd $tempdir
	    local ndex=$(( (globaldepth - depth ) * breadth ))
	    #echo "ndex is $ndex"
	    local ndex=$((ndex + (i - 1)))
	    #echo "ndex is now $ndex"
	    if (( $depth == 1 )); then
		#echo "$ndex, $i, $depth, $breadth" >> Description
		if (( $princessplaced >= 1 )); then
		    echo $deadend >> Description
		else
		    cp ${monsterdir}/Princess .
		    chmod a+x Princess
		    ln -s Princess "princess"
		    ln -s Princess "the princess"
		    ln -s Princess "the Princess"
		    ln -s Princess "The Princess"
		    ln -s Princess "The princess"
		    ln -s Princess "the Princess"
		    echo $princess >> Description		   
		    ((princessplaced++))
		fi
	    elif (( $ndex < $numDescriptions )); then
		#echo "$ndex, $i, $depth, $breadth" >> Description
		echo "${floors[ndex]}" >> Description
		monstertest=$((RANDOM % $monsterodds))
		echo "rolling randomly $monstertest"		
		#if (( $monsterindex < $nummonsters)); then
		if (( $monstertest == 0 )); then
		    #echo "monster at index $ndex rolling randomly $monstertest"
		    monsterid=$((RANDOM % $nummonsters))
		    cp ${monsterdir}/${monsters[$monsterid]} .monster
		    chmod a+x .monster
			#((monsterodds--)) # it gets more likely with time
			#((monsterindex++))
		        #fi
		fi
                treasuretest=$((RANDOM % $treasureodds))
                #echo "rolling randomly $treasuretest"
		if (( $treasuretest == 0)); then
		    echo 'function moneyrun(){' >> .treasure
		    #echo "treasure at index $ndex"
		    treasure=$((RANDOM%100+10))
		    echo "cat $monsterdir/treasure" >> .treasure
		    echo "moneymoneymoney $treasure" >> .treasure		    
		    chmod a+x .treasure
		    echo '}' >> .treasure
		fi
		if (( $globaldepth - $depth == 0 )); then
		    here=$(pwd)
		    locked="$locked $here"
		fi
		if (( $globaldepth - $depth == 0 )); then
		    darked="$darked $here"
		fi
	    else
		#echo "We wrote $numDescriptions descs, and ndex is $ndex"
		#echo "$ndex, $i, $depth, $breadth" >> Description
		echo $more >> Description
	    fi
	    echo -n "Recursing into dir: "
	    pwd
	    buildSubdir $depthminus $breadth
	    echo "back to depth $depth, i is $i"
	    pwd
	done
	cd ..
    fi
}

# TODO: Ask if user wants dungeon rebuilt.
if [[ -d "dungeon" ]]; then
    exit 0
fi
mkdir -p dungeon
echo $?
cd dungeon
echo "${start}" >> Description
#echo "${travelpack}" >> travelpack
#echo "${key}" >> key
cp ${monsterdir}/start .monster
globaldepth=6
breadth=2
# There is a one in $monsterodds chance that a given dir will have a monster. 
# Since we consume monsters, a small initial number is more likely to have monsters in the upper end of the dungeon.
monsterodds=$#monsters
# Treasure is not consumed, so this number shouldn't be too high. 
treasureodds=5
monsterodds=10
nummonsters=${#monsters[@]}
monsterindex=0
princessplaced=0
buildSubdir $globaldepth $breadth
for dir in $darked; do
chmod a-r $dir
done

for dir in $locked; do
chmod a-x $dir
done

cd ..
exit 0

