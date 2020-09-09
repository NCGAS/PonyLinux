#!/usr/bin/env bash
me="$( cd "$(dirname "$0")" ; pwd -P )"
monsterdir=${me}/monsters
export DUNGEON=$(pwd)

desc="This room looks much the same as the next. The ruins of the dungeon seems to have been sapped of any magic. There are rocks strewn around from caved-in walls, and several broken doors labeled with faded signs lead out. Some rooms are dark and doors are locked. There are some big stones and other obstacles to get through in order to search the dungeon."
start="The dungeon looks so different the second time you enter. It looks a lot more like a castle that has gone far past decay now that the magic holding its mysteries has unraveled. Big chunks of stone have fallen over the once uniform doors, but you can still see small signs that read 'Door_###'."
key="You find the key ground into the dust and rubble. You feel excited as you shake the keyring to get the dirt off, the jangling of metal ringing like bells of triumph. Cd into the directory 'teleporter' in order to get back to the Princess' castle."

function builddir {
# Sometimes, its just easier to brute force.
mkdir -p Door_001/Door_101/Door_201
mkdir -p Door_001/Door_102/Door_201
mkdir -p Door_001/Door_103/Door_201

mkdir -p Door_002/Door_104/Door_201
mkdir -p Door_002/Door_105/Door_201
mkdir -p Door_002/Door_106/Door_201

mkdir -p Door_003/Door_107/Door_201
mkdir -p Door_003/Door_108/Door_201
mkdir -p Door_003/Door_109/Door_201


mkdir -p Door_001/Door_101/Door_202
mkdir -p Door_001/Door_102/Door_202
mkdir -p Door_001/Door_103/Door_202

mkdir -p Door_002/Door_104/Door_202
mkdir -p Door_002/Door_105/Door_202
mkdir -p Door_002/Door_106/Door_202

mkdir -p Door_003/Door_107/Door_202
mkdir -p Door_003/Door_108/Door_202
mkdir -p Door_003/Door_109/Door_202


mkdir -p Door_001/Door_101/Door_203
mkdir -p Door_001/Door_102/Door_203
mkdir -p Door_001/Door_103/Door_203

mkdir -p Door_002/Door_104/Door_203
mkdir -p Door_002/Door_105/Door_203
mkdir -p Door_002/Door_106/Door_203

mkdir -p Door_003/Door_107/Door_203
mkdir -p Door_003/Door_108/Door_203
mkdir -p Door_003/Door_109/Door_203
echo "Yep, it's a big heavy rock!" > boulder
doors=$(find * -type d)
for door in $doors; do
echo "${desc}" >> ${door}/Description
done
echo "${key}" >> Door_003/Door_109/Door_202/key
cp ${monsterdir}/key.txt Door_003/Door_109/Door_202/
chmod -R a-rwx Door_001/* 2>/dev/null
chmod -R a-rx Door_002/*  2>/dev/null
chmod -R a-rwx Door_003/*  2>/dev/null
}
if [[ -d dungeon_ruins ]]; then
    exit 0
else
    mkdir -p dungeon_ruins
    cd dungeon_ruins
    echo "${start}" >> Description
    builddir
fi

