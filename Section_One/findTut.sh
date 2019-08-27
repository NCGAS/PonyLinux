function findTut(){
ponygo twilacorn "We talked up the capabilities of Unix for making repetitive tasks easy. One critical command you should know is ${b}find${r}."
ponygo twilight "${b}Find${r} is a command that lets you search for files by name, by type, by the last time it was changed, and more.${n2}It doesn't look at file contents, though, so if you want to search inside of files, you'll need to use the ${b}grep${r} command, which we'll cover when Section Two comes out."
ponygo twilightfly "To use ${b}find${r}, you will need to give it a starting point and then some criteria for searching. The easiest starting point is the current directory, denoted by a single dot (${b}.${r}). "
ponygo twilightspike "The criteria which are most useful for filtering searches are ${b}-name${r}, ${b}-type${r}, ${b}-size${r}, and ${b}-mtime/ctime/atime${r}."
ponygo twilighttime "Of those filters, the ${b}-name${r} parameter is probably the most widely used. You can find files with particular names, but what is even more helpful is to use the wildcard character, an asterisk (${b}*${r}), which can stand for 0 or more characters."
ponygo twilight "For example, if I wanted to search for my music, I might try the following command:${n}${b}find . -name \"*.mp3\"${r}${n2}This will return all the mp3s I have from my current directory on down."
ponygo twilacorn "The wildcard is pretty limited. If you want more advanced searches by name, we'll have to look at ${b}grep${r} later. But for most searches, this is all you need."
ponygo twilightzero "Make sure that you put quotes around whatever name you are searching for! If you don't, bash will try to interpret any special characters before ${b}find${r} can get to them. This can lead to unexpected consequences, even file overwrites! Be especially careful when searching for characters like ${b}|, >, ;, &,${r} and ${b}*${r}."
ponygo twilacorn "If you need to search for something that has a literal * in the name, you can \"escape\" the star, or tell ${b}find${r} to take it literally, with a backslash in front of it. Like so:${n}${b}find . -name \"\*bucks*\"${r}${n2}This will find *bucks but not any other file that happens to end with \"bucks\"."
ponygo twilight "You can put multiple stars ( ${b}*${r} ) in your search too! So I can look for music with names that contain \"Twilight\" by doing:${n}${b}find . -name  \"*Twilight*.mp3\"${r}${n}This allows, but does not require, characters in front of or after \"Twilight\"."
ponygo twilight "Did you notice the single dash in front of ${b}-name${r}? ${b}Find${r} cheats. It only uses one dash even though it uses long words, which makes it a little odd for a Unix program."
ponygo twilightfly "${b}Find${r} will plunge into all the subdirectories of the starting point by default. You can limit how deep in the directory structure it looks by using ${b}-maxdepth${r} followed by a number."
ponygo twilight "If I only wanted to look down two directories deep, I would do:${n}${b}find . -maxdepth 2 -name \"*.mp3\"${r}"
ponygo twilightzero "You can start from directories other than your current directory. Be careful if you are really close to the root directory (${b}/${r}) because it can take a long time for find to go through all the files when you start at the top."
ponygo twilight "When you start from your current directory, all the results of find will have a ${b}./${r} in front of them. You can also use a star in place of your starting point, which tells find to start with all of the files in the current directory, like so:${n}${b}find * -name \"*.mp3\"${r}"
ponygo twilightspike "If you use the ${b}-maxdepth${r} parameter, be careful as ${b}*${r} and ${b}.${r} are counted differently."
ponygo twilighttime "${b}Find${r} can't enter directories if you don't have permission to enter them. If you get a permission error, that means that ${b}find${r} encountered a directory it wasn't allowed to search in."
ponygo twilightwings "There are other, more advanced features of ${b}find${r}. For example, you can use ${b}-exec${r} to run any command on each file found by ${b}find${r}. This is very handy if you want to use a command but you want to be selective about which files to use with that command."
ponygo twilightzero "There is also a ${b}-delete${r} flag, which will delete the found files. Needless to say, be ${i}${b}VERY${r} careful about using ${b}-delete${r} with ${b}find${r}. If you get the order of the search wrong, you could wipe out all your files."
ponygo twilightprincess "That's it! It might take a few tries to get the syntax just right, but it's totally worth it when you can easily search your files."
echo "findtutdone:  (Done)" >> ~/.unixTut/config
}
# This is added in case the script is invoked instead of sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    me="$( cd "$(dirname "$0")" ; cd ../ ; pwd -P )"
    source ${UNIXTUT:-$me}/Utilities.sh
    if [[ -z $PONYUSER ]]; then
        checkProgress
    fi
    findTut
fi
