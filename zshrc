export HISTSIZE=1000000000
export SAVEHIST=$HISTSIZE
setopt EXTENDED_HISTORY

source $HOME/dotfiles/zsh/antigen/antigen.zsh    # Pull in antigen
antigen use oh-my-zsh                            # Load the framework
antigen theme bureau                             # Get my favorite theme.
antigen bundle git                               # Got to get the git
antigen bundle grunt                             # 
antigen bundle gulp                              # 
antigen bundle docker                              # 
antigen bundle ssh-agent                         # Cause Im sick of forgetting
antigen bundle node                              # Some web stuff I do.
antigen bundle npm
antigen bundle zsh-users/zsh-syntax-highlighting # That awesome syntax highlighting.
antigen apply                                    # Apply all the above declarations.

export PATH="$HOME/.npm/bin:$PATH"
if [ -e /Users/erik.sutherland/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/erik.sutherland/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
export PATH="$HOME/bin:$PATH"

[ -d "$HOME/.alias" ] && for FILE in `ls $HOME/.alias`; do . $HOME/.alias/$FILE; done

# Vim mode in Zsh
bindkey -v

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

