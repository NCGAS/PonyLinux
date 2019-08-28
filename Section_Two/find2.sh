function findTut2(){
ponygo twilightzero "Make sure that you put \"quotes\" around whatever name you are searching for with find! If you don't, bash will try to interpret any special characters before ${b}find${r} can get to them. This can lead to unexpected consequences, even file overwrites! Be especially careful when searching for characters like ${b}|, >, ;, &,${r} and ${b}*${r}."
ponygo twilightfly "If you want to search inside of files, you'll need to use the ${b}grep${r} command."
ponygo twilacorn "The wildcard is pretty limited. If you want more advanced searches by name, we'll have to look at ${b}grep${r} later. But for most searches, this is all you need."
ponygo twilightfly "${b}Find${r} will plunge into all the subdirectories of the starting point by default. You can limit how deep in the directory structure it looks by using ${b}-maxdepth${r} followed by a number."
ponygo twilight "If I only wanted to look down two directories deep, I would do:${n}${b}find . -maxdepth 2 -name \"*.mp3\"${r}"
ponygo twilightzero "You can start from directories other than your current directory. Be careful if you are really close to the root directory (${b}/${r}) because it can take a long time for find to go through all the files when you start at the top."
ponygo twilight "When you start from your current directory, all the results of find will have a ${b}./${r} in front of them. You can also use a star in place of your starting point, which tells find to start with all of the files in the current directory, like so:${n}${b}find * -name \"*.mp3\"${r}"
ponygo twilightspike "If you use the ${b}-maxdepth${r} parameter, be careful as ${b}*${r} and ${b}.${r} are counted differently."
ponygo twilighttime "${b}Find${r} can't enter directories if you don't have permission to enter them. If you get a permission error, that means that ${b}find${r} encountered a directory it wasn't allowed to search in."
ponygo twilightwings "There are other, more advanced features of ${b}find${r}. For example, you can use ${b}-exec${r} to run any command on each file found by ${b}find${r}. This is very handy if you want to use a command but you want to be selective about which files to use with that command."
ponygo twilightzero "There is also a ${b}-delete${r} flag, which will delete the found files. Needless to say, be ${i}${b}VERY${r} careful about using ${b}-delete${r} with ${b}find${r}. If you get the order of the search wrong, you could wipe out all your files."
ponygo twilacorn "If you need to search for something that has a literal * in the name, you can \"escape\" the star, or tell ${b}find${r} to take it literally, with a backslash in front of it. Like so:${n}${b}find . -name \"\*bucks*\"${r}${n2}This will find *bucks but not any other file that happens to end with \"bucks\"."
}
# This is added in case the script is invoked instead of sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    me="$( cd "$(dirname "$0")" ; cd ../ ; pwd -P )"
    source ${UNIXTUT:-$me}/Utilities.sh
    if [[ -z $PONYUSER ]]; then
        checkProgress
    fi
    findTut2
fi