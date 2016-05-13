export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

source $HOME/dotfiles/zsh/antigen/antigen.zsh
antigen use oh-my-zsh
antigen theme bureau
antigen bundle docker
antigen bundle git
antigen bundle grunt
antigen bundle gulp
antigen bundle node
antigen bundle npm
antigen bundle ssh-agent
antigen bundle vagrant
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

# Grab any of my random scripts (lein)
export PATH="$HOME/bin:$PATH"

# For web deving
export PATH="$HOME/.npm/bin:$PATH"

# If the nix package manager is around (i.e. OSX) then get that all setup
if [ -e /Users/erik.sutherland/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/erik.sutherland/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# pull in any aliases from ~/.alias
[ -d "$HOME/.alias" ] && for FILE in `ls $HOME/.alias`; do . $HOME/.alias/$FILE; done

# Vim mode in Zsh
bindkey -v

# This loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
