Moving development environment around.
------

Mac Terminal theme: https://github.com/flipxfx/gruvbox-terminal

Check out good vim color schemes: http://cocopon.me/app/vim-color-gallery/

------

## Quickstart

    git clone --recursive http://github.com/raycheung/dotfiles ~/.dotfiles
    bash -c 'ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"'
    cat ~/.dotfiles/brews | xargs brew install
    env RCRC=~/.dotfiles/rcrc rcup -x README.md -f -v
    direnv allow .
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    git clone https://github.com/riywo/ndenv.git ~/.ndenv
    git clone https://github.com/riywo/node-build.git ~/.ndenv/plugins/node-build
    git clone https://github.com/talentdeficit/erlenv.git .erlenv
    git clone https://github.com/mururu/exenv.git ~/.exenv

------

### My crontab

    35 9-17/2 * * 1-5 /usr/local/bin/brew update &> /dev/null
    35 9-17/2 * * 1-5 (git -C ~/.rbenv pull; git -C ~/.rbenv/plugins/ruby-build pull) &> /dev/null
    35 9-17/2 * * 1-5 (git -C ~/.ndenv pull; git -C ~/.ndenv/plugins/node-build pull) &> /dev/null
    35 9-17/2 * * 1-5 (git -C ~/.erlenv pull) &> /dev/null
    35 9-17/2 * * 1-5 (git -C ~/.exenv pull) &> /dev/null
