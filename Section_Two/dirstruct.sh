function dirTut2(){
ponygo rainbowsalute "The root directory is like the base of a tree, and all other directories grow out from it. Since directories are hierarchical, you can think of it like a tree with thick branches that split off into smaller and smaller ones, all the way down to the leaves."

#dupped here for good measure:
ponygo rainbowfirm "Good. Now that you know that directories have structure, let's talk about common directories in Unix.${n2}If you do ${b}cd ../${r} until you get dizzy, you will end up in the mega-parent directory. This directory is called the root directory, and it is denoted by a forward slash: ${b}/${r}."
ponygo rainbowsleep "The next thing to talk about is the terrible, the dreaded, the ${b}No such file or directory${r} error!"
ponygo rainbowfirm "If you type something and get this error, it could mean several things.${n2}Typos and mispellings are probably the most common cause for anguish on Unix. It is very particular about spelling and capitalization!"
ponygo rainbow "The second most common cause is that the file you want isn't actually in the same directory you are in."

#not dupped
ponygo rainbowsalute "Inside the root directory, there are a few folders you should know about: ${b}bin, lib, usr,${r} and ${b}tmp${r}."
ponygo rainbowfirm "The ${b}/bin${r} directory contains many commands that you can run, like bash itself. Bin stands for binary, which is the format that many commands are in - binary machine code which is ready to talk to the operating system directly. Binary files are hard for humans to read!"
ponygo rainbow "Another good directory to know is ${b}/usr/local${r}, which has code in it customized to this computer. ${n2}The ${b}/lib${r} and ${b}/lib64${r} directories contain libraries, which are software codes that are intended to be put inside other code and work in a modular way."
ponygo rainbowfly "The ${b}/tmp${r} directory is a place you can put temporary files that are generated while a command runs.${n2}${b}/etc, /var, /proc,${r} and ${b}/sbin${r} are usually locked down to administrators - they contain operating system files."
ponygo rainbow "Your home directory might be in ${b}/home/username${r}. For me it would be ${b}/home/rdash${r}, for example.${n2}It is also possible that your home directory is somewhere custom to that machine, for example in ${b}/N/u/rdash${r} or ${b}/users/rdash${r}. Where home directories are located depends on how the operating system was installed."
ponygo rainbowfly "Okay, so now you know a little bit about the structure of Unix directories."
ponygo rainbowsleep "The next thing to talk about is the terrible, the dreaded, the ${b}No such file or directory${r} error!"
ponygo rainbowfirm "If you type something and get this error, it could mean several things.${n2}Typos and mispellings are probably the most common cause for anguish on Unix. It is very particular about spelling and capitalization!"
ponygo rainbow "The second most common cause is that the file you want isn't actually in the same directory you are in."
}

# This is added in case the script is invoked instead of sourced
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    me="$( cd "$(dirname "$0")" ; cd ../ ; pwd -P )"
    source ${UNIXTUT:-$me}/Utilities.sh
    if [[ -z $PONYUSER ]]; then
        checkProgress
    fi
    dirTut
fi