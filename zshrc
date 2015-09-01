source $HOME/dotfiles/zsh/antigen/antigen.zsh

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

# That awesome syntax highlighting.
antigen bundle zsh-users/zsh-syntax-highlighting

# Get my favorite theme.
antigen theme bureau

# Apply all the above declarations.
antigen apply

PATH="$HOME/bin:$HOME/npm/bin:$HOME/.cabal/bin:$HOME/.node_packages/bin:$PATH"

# If the aliases file is present, then scoop it up.
[ -e "$HOME/.aliases" ] && . $HOME/.aliases


export GEM_HOME=$HOME/gems
export GEM_PATH=$HOME/gems:/usr/lib/ruby/gems/1.8/

export PATH=$PATH:$HOME/gems/bin
export PATH=$PATH:$HOME/.gem/ruby/1.8/bin

# Vim keybindings
# bindkey -v

# Jenv Settings
eval "$(jenv init -)"




