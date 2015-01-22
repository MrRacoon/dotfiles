#!/bin/bash

# default expectation
dotFileDir="$HOME/dotfiles"

# Load the following dotfiles
dotFiles=("vimrc" "zshrc" "npmrc" "ghci" "tmux.conf" "gitconfig" "ctags")

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

# mkdir -p ~/.vim/autoload
# cd ~/.vim/autoload
# https://github.com/tpope/vim-pathogen.git
# cd -

# mkdir -p ~/.vim/autoload ~/.vim/bundle && \
# curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# Vim source
# ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2

# YouCompleteMe in vim requires that you install some packages and build the
# module
# git submodule --recursive update $dotFileDir

# Necessary packages
# PKG_INSTALL=("build-essential" "python-dev" "cmake")

# Updata and install necessary stuff
# sudo apt-get update
# sudo apt-get install $PKG_INSTALL


# cd vim/bundle/vimproc.vim
# make

