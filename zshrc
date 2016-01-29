source $HOME/dotfiles/zsh/antigen/antigen.zsh
source $HOME/.aliases

# Load the framework
antigen use oh-my-zsh

# Got to get the git
antigen bundle git

# Cause Im sick of forgetting
antigen bundle ssh-agent

# Some web stuff I do.
antigen bundle node
antigen bundle npm
export PATH="$HOME/.npm/bin:$PATH"

# That awesome syntax highlighting.
antigen bundle zsh-users/zsh-syntax-highlighting

# Get my favorite theme.
antigen theme bureau

# Apply all the above declarations.
antigen apply

#PATH="$HOME/bin:$HOME/npm/bin:$HOME/.cabal/bin:$HOME/.npm_packages/bin:$PATH"

# If the aliases file is present, then scoop it up.
[ -e "$HOME/.aliases" ] && . $HOME/.aliases

export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

if [ -e /Users/erik.sutherland/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/erik.sutherland/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export PATH="$HOME/bin:$PATH"
