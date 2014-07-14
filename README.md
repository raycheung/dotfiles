Moving development environment around.
------

Check out good vim color schemes: http://cocopon.me/app/vim-color-gallery/

------

## Quickstart

    git clone http://github.com/raycheung/dotfiles ~/.dotfiles
    bash -c 'ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"'
    cat ~/.dotfiles/brews | xargs brew install
    env RCRC=~/.dotfiles/rcrc rcup -f -v

------

### My crontab

    45 8-17 * * 1-5 /usr/local/bin/brew update &> /dev/null
    45 8-17 * * 1-5 git -C ~/.oh-my-fish pull &> /dev/null
    45 8-17 * * 1-5 (git -C ~/.rbenv pull && git -C ~/.rbenv/plugins/ruby-build pull) &> /dev/null
    45 8-17 * * 1-5 (git -C ~/.ndenv pull && git -C ~/.ndenv/plugins/node-build pull) &> /dev/null
