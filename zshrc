source $HOME/dotfiles/zsh/antigen/antigen.zsh
source $HOME/.aliases

# Load the framework
antigen use oh-my-zsh

# Got to get the git
antigen bundle git

# Hehehe
antigen bundle nyan

# Cause Im sick of forgetting
antigen bundle ssh-agent

# Some web stuff I do.
antigen bundle node
antigen bundle npm

antigen bundle cabal

# That awesome syntax highlighting.
antigen bundle zsh-users/zsh-syntax-highlighting

# Get my favorite theme.
antigen theme bureau

# Apply all the above declarations.
antigen apply

#PATH="$HOME/bin:$HOME/npm/bin:$HOME/.cabal/bin:$HOME/.npm_packages/bin:$PATH"

# If the aliases file is present, then scoop it up.
[ -e "~/.aliases" ] && . ~/.aliases

export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY


export PATH=$PATH:/home/erik/.npm/bin

