DOTFILES = $(HOME)/dotfiles

all: vim git zsh haskell aliases utils fonts ssh

# =============================================================================
# Vim
#
vim: $(HOME)/.vim $(HOME)/.vimrc $(HOME)/.vimperatorrc

$(HOME)/.vim:
	ln -s $(DOTFILES)/vim $(HOME)/.vim

$(HOME)/.vimrc:
	ln -s $(DOTFILES)/vimrc $(HOME)/.vimrc

$(HOME)/.vimperatorrc:
	ln -s $(DOTFILES)/vimperatorrc $(HOME)/.vimperatorrc

# =============================================================================
# Zsh
#
zsh: $(HOME)/.zshrc

$(HOME)/.zshrc:
	ln -s $(DOTFILES)/zshrc $(HOME)/.zshrc

# =============================================================================
# Git
#
git: $(HOME)/.git-commit-template $(HOME)/.gitconfig

$(HOME)/.git-commit-template:
	ln -s $(DOTFILES)/git-commit-template $(HOME)/.git-commit-template

$(HOME)/.gitconfig:
	cp $(DOTFILES)/gitconfig $(HOME)/.gitconfig


# =============================================================================
# haskell
#
haskell: $(HOME)/.ghci $(HOME)/.xmonad $(HOME)/.xmobarrc $(HOME)/.haskeline

$(HOME)/.ghci:
	ln -s $(DOTFILES)/ghci $(HOME)/.ghci

$(HOME)/.xmonad:
	ln -s $(DOTFILES)/xmonad $(HOME)/.xmonad

$(HOME)/.xmobarrc:
	ln -s $(DOTFILES)/xmobarrc $(HOME)/.xmobarrc

$(HOME)/.haskeline:
	ln -s $(DOTFILES)/haskeline $(HOME)/.haskeline

# =============================================================================
# alias
#
aliases: $(HOME)/.alias

$(HOME)/.alias:
	ln -s $(DOTFILES)/alias $(HOME)/.alias

# =============================================================================
# utils
#
utils: $(HOME)/.screenrc $(HOME)/.Xresources $(HOME)/.profile $(HOME)/.tmux.conf

$(HOME)/.screenrc:
	ln -s $(DOTFILES)/screenrc $(HOME)/.screenrc

$(HOME)/.Xresources:
	ln -s $(DOTFILES)/Xresources $(HOME)/.Xresources

$(HOME)/.profile:
	ln -s $(DOTFILES)/profile $(HOME)/.profile

$(HOME)/.tmux.conf:
	ln -s $(DOTFILES)/tmux.conf $(HOME)/.tmux.conf

# =============================================================================
# fonts
#
fonts: $(HOME)/.local/share/fonts

$(DOTFILES)/fonts/install.sh:
	git submodule update --init --recursive

$(HOME)/.local/share/fonts: $(DOTFILES)/fonts/install.sh
	bash $(DOTFILES)/fonts/install.sh

# =============================================================================
# ssh
#
ssh: $(HOME)/.ssh/id_rsa

$(HOME)/.ssh:
	mkdir $(HOME)/.ssh

$(HOME)/.ssh/id_rsa: $(HOME)/.ssh
	ssh-keygen -o -a 100 -t ed25519 -f $(HOME)/.ssh/id_rsa

