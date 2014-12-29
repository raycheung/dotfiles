# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme cor

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins brew rbenv bundler ndenv

# Path to your custom folder (default path is $FISH/custom)
set fish_custom ~/.dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# I love vim
set -x EDITOR (which vim)

# for direnv
if type direnv > /dev/null 2>&1
  eval (direnv hook fish)
end
