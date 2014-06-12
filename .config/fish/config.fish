# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
#set fish_theme robbyrussell
set fish_theme krisleech

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins brew rbenv bundler rails

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

set -x PGDATA /usr/local/var/postgres
set -x ANDROID_HOME /usr/local/opt/android-sdk
