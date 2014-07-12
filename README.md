Moving development environment around.
------

Check out good vim color schemes: http://cocopon.me/app/vim-color-gallery/

------

## Quickstart

    git clone --recursive http://github.com/raycheung/dotfiles ~/.dotfiles
    brew install rcm
    env RCRC=~/.dotfiles/rcrc rcup -f -v

------

### My brews

my stuff:

    brew install rcm fish vim git tig ag

and:

    brew install android-sdk chromedriver phantomjs postgresql qt imagemagick

------

### My crontab

    45 8-17 * * 1-5 /usr/local/bin/brew update &> /dev/null
    45 8-17 * * 1-5 git -C ~/.oh-my-fish pull &> /dev/null
    45 8-17 * * 1-5 (git -C ~/.rbenv pull && git -C ~/.rbenv/plugins/ruby-build pull) &> /dev/null
    45 8-17 * * 1-5 (git -C ~/.ndenv pull && git -C ~/.ndenv/plugins/node-build pull) &> /dev/null
