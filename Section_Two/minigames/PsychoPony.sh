#!/bin/bash
#alias ls=usb

echo "I am the princess's personal psychotherapist pony, here at your service! Describe to me how you feel today."
say "I am the princess's personal psychotherapist pony, here at your service! Describe to me how you feel today."
#echo "I am the princess's personal psychologist, here are at your service! Describe to me how you feel today."
sleep 1
echo "Type...${b}'I feel great', or 'I feel sad'${r}"
say "Type...'I feel great', or 'I feel sad'"
#echo "Type...'I feel great', or 'I feel sad'"
read n

if [[ ( $n == "I feel great" || $n  != "I feel sad" ) ]]
then
echo "That's great. Tell me more! Do you feel like...'I learned a lot from the lesson and feel like a master!'? Type Y"
say "That's great. Tell me more! Do you feel like...'I learned a lot from the lesson and feel like a master!'? Type Y"
else
echo "I am sorry to hear that. Why do you feel this way? Do you feel like...'Linux is hard and I wanna cry'? Type N"
say "I am sorry to hear that. Why do you feel this way? Do you feel like...'Linux is hard and I wanna cry'? Type N"
fi

read n2

if [[ ( $n2 == "Y" || $n2  != "N" ) ]]
then
echo "Why do you feel this way? Type...'It was so easy, even my grandpa could do it'"
say "Why do you feel this way? Type...'It was so easy, even my grandpa could do it'"
else
echo "Why do you feel like it is hard? Type...'I do not get what is going on'"
say "Why do you feel like it is hard? Type...'I do not get what is going on'"
fi

read n3

if [[ ( $n3 == "It was so easy, even my grandpa could do it" || $n3  != "I do not get what is going on" ) ]]
then
echo "Interesting...I am glad you feel so confident! I think you got the hang of this, so we're done! type 'q' to quit."
say "Interesting...I am glad you feel so confident! I think you got the hang of this, so we're done! type 'q' to quit."
else
echo "You are not a failure, keep trying! Go back over the lesson, and maybe that will help. type 'QUIT' to quit."
say "You are not a failure, keep trying! Go back over the lesson, and maybe that will help. type 'QUIT' to quit."
fi

read n4

if [[ ( $n4 == "q" || $n4  != "QUIT" ) ]]
then
echo "Goodbye and see you next time!"
say "Goodbye and see you next time!"
else
echo "Keep your head up! You've got this. Come back anytime."
say "Keep your head up! You've got this. Come back anytime."
fi