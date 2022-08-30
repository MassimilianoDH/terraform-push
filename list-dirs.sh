#!/bin/bash

path=$(basename $1) # ./stacks/ - stacks
tree -J -d -L 1 ./$path | jq -c '.[0].contents | map(.name)' > $path.json

jq -c -r '.[]' $path.json | while read provider; do
    tree -J -d -L 1 ./$path/$provider | jq -c '.[0].contents | map(.name)' > $provider.json
done

jq -c -r '.[]' $path.json | while read provider; do
    jq -r --arg path $path --arg provider $provider 'to_entries|map("\($path)/\($provider)/\(.value): \($path)/\($provider)/\(.value)/**\n")|.[]' $provider.json >> filters.yml
    rm $provider.json
done

rm $path.json