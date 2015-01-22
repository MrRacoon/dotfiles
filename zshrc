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

PATH="$PATH:~bin:~/npm/bin:~/.cabal/bin:~/.node_packages/bin"

# If the aliases file is present, then scoop it up.
[ -e "~/.aliases" ] && . ~/.aliases


