#!/usr/bin/env bash

minBeans=100000

#!/usr/bin/env bash
me="$( cd "$(dirname "$0")" ; pwd -P )"
RANDOM=$$

declare -a beans=("blue veryberry jelly bean"
"yellow popcorn jelly bean"
"blue veryberry jelly bean"
"green apple jelly bean"
"red raspberry jelly bean"
"green apple jelly bean"
"purple plum jelly bean"
"white mystery jelly bean"
"black licorice jelly bean"
"red raspberry jelly bean"
"blue veryberry jelly bean"
"orange mango jelly bean"
"red raspberry jelly bean"
)
mkdir -p jellybeans
cd jellybeans
numbeans=${#beans[@]}
#let "numbeans--"
echo "how many beans? $numbeans"
for (( i=1; i<=minBeans; i++ )); do
    beanID=$(( $RANDOM % $numbeans ))
    echo "${beans[$beanID]}" >> jar.txt
done