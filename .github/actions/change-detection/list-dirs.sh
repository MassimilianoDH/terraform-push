#!/bin/bash
path=$(basename $1) # ./stacks/ > stacks
extension=$2

# create list of all files inside $path with matching file $extension
find $path -name *.$extension > filters.yml 

# remove filename
sed -i 's:[^/]*$::' filters.yml

# remove trailing slash
sed -i 's:/*$::' filters.yml

# remove duplicates
sort -u -o filters.yml filters.yml

# add colon at the end
sed -i 's/$/:/' filters.yml

# add itself at the end
sed -i 's:\(.*\):\1 \1:' filters.yml

# remove trailing colon
sed -i 's/:*$//' filters.yml

# add slash and wildcard (**)
sed -i 's:$:/**:' filters.yml

# remove entries with save-it-for-parts (ignore dir)
sed -i '/save-it-for-parts/d' filters.yml

# remove entries with bootstrap (ignore dir)
sed -i '/bootstrap/d' filters.yml