
INSTALL_DF := vimrc zshrc ctags ghci
DIR = $(shell pwd)

# build all the submodules
submodule_update:
	git submodule update --init --recursive

# Update the apt package list
sysUpdate:
	sudo apt-get update

# Upgrade the apt package list
sysUpgrade: sysUpdate
	sudo apt-get -y dist-upgrade

sysClean:
	sudo apt-get autoclean; \
	sudo apt-get -y autoremove

# Vim Plugins

# YouCompleteMe
deps_you_complete_me:
	sudo apt-get install build-essential cmake python-dev

build_you_complete_me: you_complete_me_deps
	cd vim/bundle/YouCompleteMe && ./install.sh

# VimProc
build_vimproc:
	cd vim/bundle/vimproc.vim; make

# Tern
deps_tern:
	sudo apt-get install npm


build_tern: deps_tern
	cd vim/bundle/tern_for_vim && npm install

# Make the whole shebang
install:
	@for i in $(INSTALL_DF); \
	do \
		echo "ln -s $(DIR)/$$i ~/.$$i" ; \
	done
