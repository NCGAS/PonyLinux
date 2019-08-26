### For developers
### When running ponygo, make sure your text has this format: "Text and stuff, newlines are slash n. \n If you have an apostrophe, you'll have to quote it'
### One more time: dollar sign, single quote, text, end single quote. If you need a ' inside, it has to be ' .
### This ensures that the shell interprets your newlines correctly when passed to ponysay.
### If you need to test your string, use echo (no -e)

function dirTut(){
ponygo rainbow "Hey $PONYUSER. So you learned how to cd around, huh? But how do you know where to go, or what commands you can run? Well, I'll be teaching you more gory details about directories. Let's get started!"

ponygo rainbowfirm "Directories are also called folders. All computers organize their files in structured directories - even your smartphone!"
ponygo rainbow "In Windows, you might be used to finding your documents, pictures, songs and things in \"My Documents\" on your C drive.${n2}The path to a file might be C:\Users\Rainbow Dash\Documents\My favorite recipes.docx."

ponygo rainbowdrag "On a Mac, you might find your files in /Volumes/Macintosh HD/Users/Rainbow Dash/Documents.${n2}Pictures on my Android phone are in /DCIM/Camera. Get the idea?"
ponygo rainbow "The file structure for my file in Unix is pretty similar:\n\t/home/rdash/documents/myFavoriteRecipes.txt."
ponygo rainbowfly "Notice that I took out spaces in the names of my folders on Unix. That is because spaces in file and folder names is a huge pain to deal with."
ponygo rainbowfirm "Good. Now that you know that directories have structure, let's talk about common directories in Unix.${n2}If you do ${b}cd ../${r} until you get dizzy, you will end up in the mega-parent directory. This directory is called the root directory, and it is denoted by a forward slash: ${b}/${r}."
ponygo rainbowsalute "The root directory is like the base of a tree, and all other directories grow out from it. Since directories are hierarchical, you can think of it like a tree with thick branches that split off into smaller and smaller ones, all the way down to the leaves."

ponyNoClear rainbow "Have you noticed that your location always starts with a ${b}/${r} or a ${b}~${r} when you do ${b}pwd${r}?"
echo "Your current location:"
pwd
read -p "Press enter to continue"
clear

ponygo rainbowsalute "Inside the root directory, there are a few folders you should know about: ${b}bin, lib, usr,${r} and ${b}tmp${r}."
ponygo rainbowfirm "The ${b}/bin${r} directory contains many commands that you can run, like bash itself. Bin stands for binary, which is the format that many commands are in - binary machine code which is ready to talk to the operating system directly. Binary files are hard for humans to read!"
ponygo rainbow "Another good directory to know is ${b}/usr/local${r}, which has code in it customized to this computer. ${n2}The ${b}/lib${r} and ${b}/lib64${r} directories contain libraries, which are software codes that are intended to be put inside other code and work in a modular way."
ponygo rainbowfly "The ${b}/tmp${r} directory is a place you can put temporary files that are generated while a command runs.${n2}${b}/etc, /var, /proc,${r} and ${b}/sbin${r} are usually locked down to administrators - they contain operating system files."
ponygo rainbow "Your home directory might be in ${b}/home/username${r}. For me it would be ${b}/home/rdash${r}, for example.${n2}It is also possible that your home directory is somewhere custom to that machine, for example in ${b}/N/u/rdash${r} or ${b}/users/rdash${r}. Where home directories are located depends on how the operating system was installed."
ponygo rainbowfly "Okay, so now you know a little bit about the structure of Unix directories."
ponygo rainbowsleep "The next thing to talk about is the terrible, the dreaded, the ${b}No such file or directory${r} error!"
ponygo rainbowfirm "If you type something and get this error, it could mean several things.${n2}Typos and mispellings are probably the most common cause for anguish on Unix. It is very particular about spelling and capitalization!"
ponygo rainbow "The second most common cause is that the file you want isn't actually in the same directory you are in."
ponygo rainbowsalute "One way around this problem is to use what is called a full path.${n2}If my file is in ${b}/home/rdash/recipes${r}, but I'm currently in ${b}/home/rdash${r}, I can still use the file with commands by giving the path starting from root (${b}/${r}) and all the way to the file name."
ponygo rainbowfly "I can do this:${nt}${b}ls /home/rdash/recipes/veggie_soup.txt${r}${n2}This would be the same as if I had done:${nt}${b}cd recipes${r}${nt}${b}ls veggie_soup.txt${r}"
ponygo rainbow "Another way to reference it is by using the relative path.${n2}That is, the path to the file relative to my current location. Since I am in ${b}/home/rdash${r}, and my file is in the recipes folder, I could do:${nt}${b}ls recipes/veggie_soup.txt${r}${n2}This is equivalent to the previous methods."
ponygo rainbowfly "If the file is in a directory above me, I would use the ${b}..${r} syntax to say to go up a directory relative to me."
ponygo rainbowfirm "Let's say I am still in ${b}/home/rdash${r}, but my friend wants me to look at her recipe file in:${nt}${b}/home/ajack/recipes.${r}${n2}I would do the following:${nt}${b}ls ../ajack/recipes/apple_pie.txt${r}"
ponygo rainbowsalute "That concludes my lesson on directories."
# add note that you don't have to be inside directory to run a command
ponygo rainbowhurricane "Great job, $PONYUSER! Now get out there and be victorious!"
# more about ~, and how it doesn't have /~
# more about ls
#which

echo "dirtutdone:  (Done)" >> ~/.unixTut/config

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