# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# fix https://gnunn1.github.io/tilix-web/manual/vteconfig/
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
  source /etc/profile.d/vte-2.91.sh
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
export EDITOR='vim'
export VISUAL='vim'
export TERM=xterm-256color

# set color with Base16 Shell
BASE16_SHELL="$HOME/.config/base16-shell/"
[ -n "$PS1" ] && \
    [ -s "$BASE16_SHELL/profile_helper.sh" ] && \
        eval "$("$BASE16_SHELL/profile_helper.sh")"

# for binstubs
export PATH="./bin:$PATH"

# for direnv
[[ ! -x direnv ]] || eval "$(direnv hook zsh)"

# for pyenv
if [ -d $HOME/.pyenv ]; then
  export PATH="$HOME/.pyenv/bin:$PATH"
  eval "$(pyenv init --path)"
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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
