#!/bin/bash
path=./stacks/ 

tail="${path#./}"
head="${path%/$tail}"
cd $path
tree -J -d -L 2 | jq -c 'map(.[0].contents.name)' > stacks.json


































# jq -c '.[]' stacks.json | while read i; do
#     temp="${i%\"}"
#     temp="${temp#\"}"
#     cd $temp
#     tree -J -d -L 1 | jq -c '.[0].contents | map(.name)' > $temp.json
#     mv $temp.json ..
#     cd ..
# done

# jq -c '.[]' stacks.json | while read i; do
#     temp="${i%\"}"
#     temp="${temp#\"}"
#     jq -r --arg tail $tail --arg stack $temp 'to_entries|map("\( $stack )-\(.value): \( $tail )\( $stack )/\(.value)/**\n")|.[]' $temp.json >> file.json
    
# done
# list=$(jq -r 'to_entries|map("\(.value)\n")|.[]' file.json)
# echo $list