#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Configure powerlevel9k
export POWERLEVEL9K_MODE='nerdfont-complete'
export POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
export POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export EDITOR='vim'
export VISUAL='vim'

# set color with Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"
base16_material-darker

# for binstubs
export PATH="./bin:$PATH"

# for direnv
eval "$(direnv hook zsh)"

# for pyenv
if [ -d $HOME/.pyenv ]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init -)"
fi

# for rbenv
if [ -d $HOME/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# for nodenv
if [ -d $HOME/.nodenv ]; then
  export PATH="$HOME/.nodenv/bin:$PATH"
  eval "$(nodenv init -)"
fi

## for yarn
if [ -d $HOME/.yarn ]; then
  export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
fi
