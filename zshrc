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
eval "$(direnv hook zsh)"

# for ndenv
export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"

# for erlenv
export PATH="$HOME/.erlenv/bin:$PATH"
eval "$(erlenv init -)"

# for exenv
export PATH="$HOME/.exenv/bin:$PATH"
eval "$(exenv init -)"

# for pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"

# for OCaml
if [ -x `which opam` ]; then
  eval `opam config env`
  . $HOME/.opam/opam-init/init.zsh &> /dev/null || true
fi
