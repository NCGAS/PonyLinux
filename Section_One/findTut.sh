function findTut(){
ponygo twilacorn "We talked up the capabilities of Unix for making repetitive tasks easy. One critical command you should know is find."
ponygo twilight "Find is a command that lets you search for files by name, by type, by the last time it was changed, and more. It doesn't look at file contents, though, so if you want to search inside of files, you'll need to use the grep command (we'll cover that later)."
ponygo twilightfly "To use find, you will need to give it a starting point and then some criteria for searching. The easiest starting point is the current directory, denoted by '.'. "
ponygo twilightspike "The criteria which are most useful are -name, -type, -size, and -mtime/ctime/atime."
ponygo twilighttime "The -name parameter is probably the most used. You can find files with particular names, but what is even more helpful is to use the wildcard character '*', which can stand for 0 or more characters."
ponygo twilightzero "Make sure that you put quotes around whatever name you are searching for! If you don't, bash will try to interpret any special characters before find can get to them. This can lead to unexpected consequences, even file overwrites! Be especially careful when searching for characters like |, >, ;, &, and *."
ponygo twilacorn $'If you need to seach for something that has a literal * in the name, you can "escape" the star, or tell find to take it literally, with a backslash in front of it. Like so:\nfind . -name "\*bucks*"\nThis will find *bucks but not any other file that happens to end with "bucks".'
ponygo twilight $'For example, if I wanted to search for my music, I might try the following command:\nfind . -name "*.mp3"\nThis will return all the mp3s I have from my current directory on down.'
ponygo twilacorn "The wildcard is pretty limited. If you want more advanced searches by name, we'll have to look at grep later. But for most searches, this is all you need."
ponygo twilight $'You can put multiple stars (*) in your search too! So I can look for music with names that contain "Twilight" by doing:\nfind . -name  "*Twilight*.mp3"\nThis allows, but does not require, characters in front of or after "Twilight".'
ponygo twilightfly "Find will plunge into all the subdirectories of the starting point by default. You can limit how deep in the directory structure it looks by using -maxdepth and a number."
ponygo twilight $'If I only wanted to look down two directories deep, I would do:\nfind . -maxdepth 2 -name "*.mp3"'
ponygo twilightzero "You can start from directories other than your current directory. Be careful if you are really close to the root directory (/) because it can take a long time for find to go through all the files when you start at the top."
ponygo twilight $'When you start from your current directory, all the results of find will have a ./ in front of them. You can also use a star in place of your starting point, which tells find to start with all of the files in the current directory, like so:\nfind * -name "*.mp3"'
ponygo twilightspike "If you use the -maxdepth parameter, be careful as * and . are counted differently."
ponygo twilighttime "Find can't enter directories if you don't have permission to enter them. If you get a permission error, that means that find encountered a directory it wasn't allowed to search in."
ponygo twilightwings "There are other, more advanced features of find. For example, you can use -exec to run any command on each file found by find. This is very handy if you want to use chmod, but want to be selective about which files to change permissions for."
ponygo twilightzero "There is also a -delete flag, which will delete the found files. Needless to say, be VERY careful about using -delete with find. If you get the order of the search wrong, you could wipe out all your files."
ponygo twilightprincess "That's it! It might take a few tries to get the syntax just right, but it's totally worth it when you can easily search your files."
}