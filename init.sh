#!/bin/bash

# Install the toys
sudo apt update
sudo apt install rofi xmonad git slock vim screen zsh

# Assume the dotfils repo is in $HOME
DOT_FILE_DIR=$HOME/dotfiles

cd $DOT_FILE_DIR

# initialize all submodules everywhere
git submodule update --init --recursive

# initialize powerline fonts
./fonts/install.sh

# copy git config, because of the jorb
cp $DOT_FILE_DIR/gitconfig $HOME/.gitconfig

# link all atom configs
mkdir -p $DOT_FILE_DIR/.atom
ln -s $DOT_FILE_DIR/atom/* $HOME/.atom/

# link all aliases
ln -s $DOT_FILE_DIR/alias $HOME/.alias

# Install dot files
ln -s $DOT_FILE_DIR/ghci $HOME/.ghci
ln -s $DOT_FILE_DIR/haskeline $HOME/.haskeline
ln -s $DOT_FILE_DIR/xmonad $HOME/.xmonad
ln -s $DOT_FILE_DIR/xmobarrc $HOME/.xmobarrc
ln -s $DOT_FILE_DIR/git-commit-template $HOME/.git-commit-template
ln -s $DOT_FILE_DIR/screenrc $HOME/.screenrc

# Vim install
ln -s $DOT_FILE_DIR/vimrc $HOME/.vimrc
ln -s $DOT_FILE_DIR/vim $HOME/.vim
ln -s $DOT_FILE_DIR/vimperatorrc $HOME/.vimperatorrc

ln -s $DOT_FILE_DIR/zshrc $HOME/.zshrc

# Install NVM
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash

cd -
