export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

source $HOME/dotfiles/zsh/antigen/antigen.zsh

antigen use oh-my-zsh
antigen theme bureau
antigen bundle docker
antigen bundle git
antigen bundle git-flow
antigen bundle grunt
antigen bundle git@github.com:spwhitt/nix-zsh-completions.git
antigen bundle man
antigen bundle node
antigen bundle nyan
antigen bundle zlsun/solarized-man
antigen bundle ssh-agent
antigen bundle stack
antigen bundle vagrant
antigen bundle Tarrasch/zsh-functional
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle nviennot/zsh-vim-plugin
antigen apply

export PATH="$HOME/.npm/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"

# If the nix package manager is around (i.e. OSX) then get that all setup
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# pull in any aliases from ~/.alias
[ -d "$HOME/.alias" ] && for FILE in `ls $HOME/.alias`; do . $HOME/.alias/$FILE; done

# Vim mode in Zsh
bindkey -v
bindkey -M viins 'kj' vi-cmd-mode

# This loads nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Load jenv if availible
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# exercism completion
if [ -f ~/.config/exercism/exercism_completion.zsh ]; then
    . ~/.config/exercism/exercism_completion.zsh
fi
