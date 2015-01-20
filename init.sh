#!/bin/bash

# default expectation
dotFileDir="$HOME/dotfiles"

# Load the following dotfiles
dotFiles=("vimrc")

for i in "${dotFiles[@]}"; do
    # Ensure that the file exists in the source directory
    if [ -e "$dotFileDir/$i" ]; then
        echo "File $i exists already"
        continue
    fi

    # Ensure that the file doesn't already exist in the destination dir
    if [ -e "~/.$i" ]; then
        echo "File $i exists already"
    else
        ln -s $dotFileDir/$i $HOME/.$i
    fi
done

