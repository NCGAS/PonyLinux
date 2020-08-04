ponygo aloe "Hiya $PONYUSER, ready to learn some more exercises? I am, let's get started!"
ponygo aloe "Let's talk about Output and Error channels."
ponygo aloe "Within the terminal, which is what you are working in now, it prints out the results after you give it a command."
ponygo aloe "If the command is properly executed, then it will put it in the normal channel, which is called a ${b}standard output${r} or ${b}stdout${r} for short"
ponygo aloe "If something goes wrong, it will place a text for you in standard error, aka ${b}stderr.${r}"
ponygo aloe "Normally, both of these channels just print out to the terminal and there is no way to distinguish them."
ponygo aloe "If you wanted to be able to tell which messages from the terminal are errors, and which are normal messages, you can change how they are printed."
ponygo aloe "Think of this as a fancy way of taking the ${b}pipe${r} we studied before, ${b}which was a command that lets you send the output of one command to another${r}, and directing the flow of information into or out of a file instead of having it print to the screen."
ponygo aloe "We use the greater-than symbol, ${b}'>'${r}, to redirect text into a file instead of printing it normally. Let's try it with the ${b}ls${r} command:
${b}ls > my_file_list.txt${r}"
ponygo aloe "You will notice that nothing prints to the screen. That's because you stole everything that was going to be printed and stuck it into a new file instead, and you named that file ${b}my_file_list.txt${r}. Now open that file with the ${b}less${r} command:
${b}less my_file_list.txt${r}"
ponygo aloe "You'll see what you would have seen with ${b}ls${r}, which if you remember what ${b}ls${r} does, ${b}it lists the computer files within Unix${r}. This time, just inside a file! Go ahead and do ls just to see if it's the same:
${b}ls${r}"
ponygo aloe "A file doesn't have to already exist in order for you to write to it. Bash will create a new file and place the text into it."
ponygo aloe "Remember when I talked about ${b}stdout${r} and ${b}stderr${r}? Try this:
${b}(base) Carries-MBP:unixTut cganoteadmin$ ls myfile >> my_error.txt${r}
${b}ls: myfile: No such file or directory${r}"
ponygo aloe "my error is empty! But the error printed to the screen! Now try this:
${b}(base) Carries-MBP:unixTut cganoteadmin$ ls myfile 2>> my_error.txt${r}
${b}(base) Carries-MBP:unixTut cganoteadmin$ less my_error.txt${r}"
ponygo aloe "Now the error is in the file and didn't print to the screen. So what's with the number 2?"
ponygo aloe "There's an unspoken rule - ok, maybe someone speaks it - but number one is standard out and number 2 is standard error. It's assumed that a ${b}>${r} with no number means #1 by default, but you could also make it more explicit if you wanted. Number 3, you ask? Nope, but if you really wanted, you could create your own channels. That's pretty high level stuff."
ponygo aloe "To hammer this home, let's separate our channels into two different files!
${b}(base) Carries-MBP:unixTut cganoteadmin$ ls myfile * 1>> stdout.txt 2> stderr.txt${r}
${b}(base) Carries-MBP:unixTut cganoteadmin$ less stdout.txt${r}
${b}(base) Carries-MBP:unixTut cganoteadmin$ less stderr.txt${r}"
ponygo aloe "Cool! One more wild idea; we can mix both channels together too. We do that using the ${b}ampersand${r} character to say, take what was in channel 2 and put it into channel 1.
${b}ls myfile * 1>> stdout.txt${r}
${b}ls: myfile: No such file or directory${r}"
ponygo aloe "ls myfile * 1>> stdout.txt 2>&1
${b}(base) Carries-MBP:unixTut cganoteadmin$ less stdout.txt${r}"
ponygo aloe "Be careful though, you want to make sure that you tell #1 where to go before telling #2 to go into #1.
${b}ls myfile * 2>&1 1>> stdout.txt${r}
${b}ls: myfile: No such file or directory${r}"
ponygo aloe "See how that printed the error to the screen? It didn't do what we wanted."
ponygo aloe "You will notice that if you run any of the examples more than once, the file gets longer. That's because we have learned to use the double ${b}>>${r}."
ponygo aloe "A single ${b}>${r} will tell the shell to write the results to a file and to overwrite anything that was previously in that file! This is very destructive and is usually not reversible! ${b}WARNING: CODE RESPONSIBLY${r}"
ponygo aloe "How do you deal with it? Use two ${b}>>${r} in a row to tell the shell to append or attached to the text to the end of the file so that you don't lose what was in there. It'll just keep adding to the end if you run commands over and over."