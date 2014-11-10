# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
#set fish_theme robbyrussell
#set fish_theme ocean
set fish_theme cor

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set fish_plugins brew rbenv bundler emoji-clock

# Path to your custom folder (default path is $FISH/custom)
set fish_custom ~/.dotfiles/oh-my-fish

# Load oh-my-fish configuration.
. $fish_path/oh-my-fish.fish

# I love vim
set -x EDITOR (which vim)

# for posgres
set -x PGDATA /usr/local/var/postgres

# for Android
#set -x ANDROID_HOME /usr/local/opt/android-sdk
#launchctl setenv ANDROID_HOME $ANDROID_HOME
#set -x JAVA_HOME (/usr/libexec/java_home)
#launchctl setenv JAVA_HOME $JAVA_HOME

# for Python
#set -x PATH $HOME/Library/Python/2.7/bin $PATH
