export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY


source $HOME/dotfiles/zsh/antigen/antigen.zsh

antigen use oh-my-zsh
antigen theme bureau
antigen bundle git
antigen bundle ssh-agent
antigen bundle zsh-users/zsh-syntax-highlighting
antigen apply

export PATH="$HOME/.npm/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"

# If the nix package manager is around (i.e. OSX) then get that all setup
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

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

alias nix-zsh="nix-shell --command zsh"

# Set the full zsh prompt for nix shell.
function set_zsh_prompt {
        # Set the PROMPT_SYMBOL variable. We do this first so we don't lose the
        # return value of the last command.
        set_prompt_symbol $?
        if [[ -v IN_NIX_SHELL ]]; then
                NIX_SHELL="${CYAN}[${IN_NIX_SHELL}]${COLOR_NONE} "
        else
                NIX_SHELL=''
        fi
        # Set the GIT_BRANCH variable.
        if is_git_repository ; then
                set_git_branch
        else
                GIT_BRANCH=''
        fi
        # Set the bash prompt variable.
        PS1="${LIGHT_GREEN}\u${WHITE}@${YELLOW}\h${WHITE}:${LIGHT_BLUE}\w${COLOR_NONE} ${NIX_SHELL}${GIT_BRANCH}\n${PROMPT_SYMBOL} "
}
PROMPT_COMMAND='set_zsh_prompt'


alias monitor-work="xrandr --output DP-2 --right-of HDMI-1 --mode 1920x1080 --rotate left  --output HDMI-1 --mode 1920x1080 --above eDP-1"
alias monitor-home="xrandr --output DP-1-1 --left-of DP-1-2 --output eDP-1 --below DP-1-1 --mode 1920x1080"
