#!/usr/bin/env bash

# Install the toys
# sudo apt update
# sudo apt install rofi xmonad mate git slock vim screen zsh exuberant-ctags

# Assume the dotfils repo is in $HOME
DOT_FILE_DIR=$HOME/dotfiles
cd $DOT_FILE_DIR

# initialize all submodules everywhere
git submodule update --init --recursive

# copy git config, because of the jorb
cp $DOT_FILE_DIR/gitconfig $HOME/.gitconfig

# link all atom configs
mkdir -p $DOT_FILE_DIR/.atom
ln -s $DOT_FILE_DIR/atom/* $HOME/.atom/

# Install dot files
ln -s $DOT_FILE_DIR/ghci $HOME/.ghci
ln -s $DOT_FILE_DIR/haskeline $HOME/.haskeline
ln -s $DOT_FILE_DIR/xmonad $HOME/.xmonad
ln -s $DOT_FILE_DIR/xmobarrc $HOME/.xmobarrc
ln -s $DOT_FILE_DIR/git-commit-template $HOME/.git-commit-template
ln -s $DOT_FILE_DIR/screenrc $HOME/.screenrc
ln -s $DOT_FILE_DIR/Xresources $HOME/.Xresources

# Vim install
ln -s $DOT_FILE_DIR/vimrc $HOME/.vimrc
ln -s $DOT_FILE_DIR/vim $HOME/.vim
ln -s $DOT_FILE_DIR/vimperatorrc $HOME/.vimperatorrc

ln -s $DOT_FILE_DIR/zshrc $HOME/.zshrc

# link all aliases
if [ ! -e "$HOME/.alias" ]; then
    ln -s $DOT_FILE_DIR/alias $HOME/.alias
fi

# Install NVM if not already there
if [ ! -d "$HOME/.nvm" ]; then
    curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.32.0/install.sh | bash
fi

# Initialize powerline fonts
if [ ! -d "$HOME/.local/share/fonts" ]; then
    ./fonts/install.sh
fi

# ChSh to zsh if not already
if [ $SHELL != "/usr/bin/zsh" ]; then
    chsh -s /usr/bin/zsh erik
fi

# Ensure that xmonad is used in the mate DM
# http://www.mishu.eu.org/guides/mate-xmonad.html
gsettings set org.mate.session.required-components windowmanager xmonad

# Cleanup
cd -
