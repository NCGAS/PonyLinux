#!/bin/bash
#alias ls=usb

# QUESTION #1
echo "Hello! Welcome to the a mini game called: Decode That Command!"
sleep 2
echo -ne '\n'
echo "Here is a text in reverse:"
rev GeekSquad.txt
sleep 2
echo -ne '\n'
echo "It is your job to decode what the statement means, and then write what bash command defines that statement. "
sleep 2
echo -ne '\n'
#sed -n '1!d' GeekSquad.txt
echo "Please type the bash command that corresponds with the statement."
read n
WRONGANSWER=$n

if [[ ( $n == ls || $n  != $WRONGANSWER ) ]]
then
echo "Great job! You've answered correctly"
else
echo "Nice try, but this is not the answer."
fi

echo -ne '\n'

# QUESTION #2
echo "Moving on to the next statement. This one will be a little more challenging."
sleep 2
echo -ne '\n'
echo "Here is a text in reverse:"
rev GeekSquad2.txt
echo -ne '\n'
echo "Please type the bash command that corresponds with the statement."
sleep 2
read n2
WRONGANSWER2=$n2
if [[ ( $n2 == stderr || $n2  != $WRONGANSWER2 ) ]]
then
echo "You got it!"
else
echo "Sorry, wrong answer"
fi

echo -ne '\n'

# QUESTION #3
echo "FINAL STATEMENT. This one is also challenging."
sleep 2
echo -ne '\n'
echo "Here is a text in reverse:"
rev GeekSquad3.txt
echo -ne '\n'
echo "Please type the bash command that corresponds with the statement."
sleep 2
read n3
WRONGANSWER3=$n3
if [[ ( $n3 == stdout || $n3  != $WRONGANSWER3 ) ]]
then
echo "Awesome Job! You got it!"
else
echo "Sorry, that's wrong. Correct answer is: stdout"
fi