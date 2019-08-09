### For developers
### When running ponygo, make sure your text has this format: $'Text and stuff, newlines are slash n. \n If you have an apostrophe, you'\'$'ll have to quote it'
### One more time: dollar sign, single quote, text, end single quote. If you need a ' inside, it has to be '\'$' .
### This ensures that the shell interprets your newlines correctly when passed to ponysay.
### If you need to test your string, use echo (no -e)

function gentleTut(){
ponygo fluttershyshy $'Oh, hello there. I will try to introduce you to this Unix and bash thing as gently as possible.'
ponygo fluttershy $'Let'\'$'s start with the basic way you interact with the computer. You might be used to a screen with pictures and icons, with nice things like mouse access and menus and sounds. \n\nIt might be hard to get used to doing things with just text.'

ponygo fluttershy $'There are advantages, too! For instance, the actions that you define with commands can scale really well.\n\nYou can do things to one file or a thousand files with ease. You can string commands together one after another, find things quickly, rename lots of files, move things around, and encode decision-making logic. You control and can customize your computing experience limited only by your imagination and coding skills.'

ponygo fluttershy $'What you are looking at now is called a shell - it'\'$'s a program that lets you interact with the underlying computer operating system.\n\nThe specific shell you are using is called Bash, and it has its own kind of language. You issue commands to the bash shell and it executes those commands.'

ponygo fluttershystare "When you first invoke Bash, you may see a line with your name and other text, followed by a \[$bold\]$\[$normal\]$ or a \[$bold\]#\[$normal\]$ character. This line is called a prompt, because it is prompting you to tell it what to do."

ponygo fluttershy $'You issue commands to the shell by typing them out and hitting enter.\n\nThis is important - the first thing that you type after the prompt must be a command. Unix is very picky about order, capitalization, spaces, and punctuation.'

ponyNoClear fluttershyshy $'For example, there is a command called '$bold'ls'$normal$', which lists information about a file or directory.'

echo 'Just typing '$bold'ls'$normal$' and hitting enter yeilds:'
ls
read -p "Press enter to continue"
clear

ponygo fluttershygala $'You can change the exact behavior of the command by adding more things to it. These extra words are called parameters, arguments, or flags.\n\nThese can override the default behavior of the command; for example, '$bold'ls'$normal$' by itself gives you the contents of the current directory that you are in.\n\nMore on directories later, but if I wanted to know information about a specific file or directory, I could put its name after '$bold'ls'$normal$', with a space in between.'

ponyNoClear fluttershy $'For example, let'\'$'s look at what is in the very top directory\n(denoted by '$bold'/'$normal$'):'

echo $bold$'ls /'$normal
ls /
read -p "Press enter to continue"
clear

ponygo fluttershybat $'So we gave '$bold'/'$normal$' as an argument to the '$bold'ls'$normal$' command. Now, we can change it even further by adding parameters. If we want '$bold'ls'$normal$' to give more information than just the contents of the directory, we could add a parameter called '$bold'long.'$normal

ponyNoClear fluttershystare $'But we can'\'$'t just say, '$bold$'ls long /'$normal$'. Then '$bold'ls'$normal$' would not be sure if '$bold'long'$normal$' was a directory name or an argument. There'\'$'s nothing to stop you from naming directories whatever you want, even command names or parameter names. So to make sure '$bold'ls'$normal$' knows to print a long format, we put dashes in the command.'

echo $bold$'ls -l /'$normal
echo ...
ls -l / | tail -n 5
read -p "Press enter to continue"
clear

ponygo fluttershy $'Unix expects one dash for single-letter parameters, and two dashes for whole-word parameters. Most parameters have a short form with just one letter, and a longer form that is a more readable word.\n\nI could say '$bold'ls -l'$normal$' or '$bold'ls --long'$normal$' and they would be exactly the same.'

ponyNoClear fluttershygala $'Because a single dash is understood to be a single-letter form of a parameter, you can put multiple ones together. If I type in '$bold'ls -lah'$normal$', this is the same as typing '$bold'ls -l -a -h'$normal$'. It does not mean that "lah" is a word, and it is not the same as '$bold'ls --lah.'$normal

echo $bold$'ls -lah /'$normal
echo ...
ls -lah / | tail -n 5
read -p "Press enter to continue"
clear

ponygo fluttershyshy $'Ok, now here are some general tips and tricks you should know before you get started.'

ponygo fluttershystare $'Many commands don'\'$'t seem to do anything after you enter them. A lack of output is usually a good sign in Unix! If a command fails, it usually tells you.'

ponygo fluttershy $'The up arrow key allows you to see commands you entered before! Keep hitting up to walk backward through your command history.' 

ponygo fluttershygala $'The control key does special things in Unix. If you hold down the control (ctrl) key and tap the letter "r" at the same time, a handy prompt will come up that lets you search your history for the most recent commands that match what you type in the search. We refer to this key combination as ctrl+r.'

ponygo fluttershybat $'If you hit ctrl and the c key at the same time, it will quit most programs (press the q key if ctrl+c doesn'\'$'t work). You can also use ctrl+c if you make a mistake while typing a command as a faster way to cancel the command rather than pressing backspace.'

ponygo fluttershy $'Other keyboard shortcuts you might use are:\n\tctrl+a to go to the beginning of the line;\n\tctrl+e to go to the end of the line;\n\tthe escape key plus the > character to go to the end of a document;\n\tescape+< to go to the beginning of a document;\n\tctrl+d to log out of your current Bash session.' 

ponygo fluttershy $'In addition to the up arrow key, the tab key will also save you a ton of typing. Use tab to complete a command or to fill in the rest of a file name. Hit tab twice in a row quickly to see your completion options.'

ponygo fluttershy $'For example, if I had two files - one named '$bold'verylongfilename.txt'$normal$', the other '$bold'veryshort.txt'$normal$' - I could type in '$bold'ls v'$normal$' and then hit tab. This would fill in "very" and then wait for me to enter the next character.'
ponygo fluttershyshy $'There are two files that start with very, so Unix is now waiting to see which one you want to run with the ls command.\n\nIf you hit tab twice, it will show you both files that start with "very".'

ponygo fluttershy $'If you type '$bold'ls veryl'$normal$', the tab key would fill in the whole '$bold'verylongfilename.txt'$normal$'. This is also a good way to avoid spelling mistakes, and to make sure that the file or command exists where Unix is looking.'

ponygo pinkiehugfluttershy $'I think with that, you are ready to learn more about directories from my friend..'

ponygo pinkiehugsfluttershy 'Oof.'

read -n 1 -r -p "Press any key to continue"
echo "gentletutdone: (Done)" >> ~/.unixTut/config
}