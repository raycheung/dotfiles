#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

# for binstubs
export PATH="./bin:$PATH"

# for direnv
_direnv_hook() {
  eval "$(direnv export zsh)";
}
typeset -ag precmd_functions
if [[ -z $precmd_functions[(r)_direnv_hook] ]]; then
  precmd_functions+=_direnv_hook;
fi

# for ndenv
export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"
