#!/bin/bash

# default expectation
DOT_FILE_DIR="$HOME/dotfiles"

# linkerate :: String -> String -> IO (LinkFromAToB)
linkerate() {
    if [ ! "$1" ]; then
        echo "LINKERATE: Missing Source param"
        return -1
    fi
    if [ ! "$2" ]; then
        echo "LINKERATE: Missing Destination Param"
        return -1
    fi
    [ ! -e "$HOME/$2" ]       || (echo "LINKERATE: $2 Exists"; return -1) && \
    [ -e "$DOT_FILE_DIR/$1" ] || (echo "LINKERATE: Source file does not exist"; return -1) && \
    ln -s "$DOT_FILE_DIR/$1" "$HOME/$2"
}


linkerate vimrc     .vimrc
linkerate vimrc     .ideavimrc
linkerate npmrc     .npmrc
linkerate ghci      .ghci
linkerate tmux.conf .tmux.conf
linkerate gitconfig .gitconfig
linkerate ctags     .ctags
linkerate aliases   .aliases

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

