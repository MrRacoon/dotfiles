#!/bin/bash

# initialize all submodules everywhere
git submodule --init --recursive

# Where is this repo? Presuppose you run this script from the dotfiles repo
DOT_FILE_DIR=$PWD

# Install dot files
ln -s $DOT_FILE_DIR/ghci $HOME/.ghci
ln -s $DOT_FILE_DIR/git-commit-template $HOME/.git-commit-template
ln -s $DOT_FILE_DIR/screenrc $HOME/.screenrc
ln -s $DOT_FILE_DIR/vimperatorrc $HOME/.vimperatorrc

# Vim install
ln -s $DOT_FILE_DIR/.vimrc $HOME/.vimrc
ln -s $DOT_FILE_DIR/.vim $HOME/.vim

ln -s $DOT_FILE_DIR/.zshrc $HOME/.zshrc

# Install NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
