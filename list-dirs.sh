#!/bin/bash
path=$1

cd $path
tree -J -d -L 1 | jq -c '.[0].contents | map(.name)' > main.json
mv main.json ..
cd ..

jq -c '.[]' main.json | while read i; do
    providers="${i%\"}"
    providers="${providers#\"}"
    cd $path/$providers
    tree -J -d -L 1 | jq -c '.[0].contents | map(.name)' > $providers.json
    mv $providers.json ../..
    cd ../..
done

jq -c '.[]' main.json | while read i; do
    providers="${i%\"}"
    providers="${providers#\"}"
    tail="${path#./}"
    jq -r --arg tail $tail --arg providers $providers 'to_entries|map("\($providers)/\(.value): \($tail)\($providers)/\(.value)/**\n")|.[]' $providers.json >> file.yml
    rm $providers.json
done

rm main.json