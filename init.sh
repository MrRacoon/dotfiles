#!/bin/bash

# default expectation
dotFileDir="$HOME/dotfiles"

# Load the following dotfiles
dotFiles=("vimrc" "zshrc" "npmrc" "ghci")

for i in "${dotFiles[@]}"; do
   # Ensure that the file exists in the source directory
   if [ -e "$dotFileDir/$i" ]; then
      # Ensure that the file doesn't already exist in the destination dir
      if [ -e "$HOME/.$i" ]; then
         echo "File $i exists already"
      else
         ln -s $dotFileDir/$i $HOME/.$i
      fi
   else
      echo "Source file $i does not exist"
      continue
   fi

done

