Moving development environment around.
------

Mac Terminal theme: https://github.com/flipxfx/gruvbox-terminal

Check out good vim color schemes: http://cocopon.me/app/vim-color-gallery/

------

## Quickstart

    git clone --recursive http://github.com/raycheung/dotfiles ~/.dotfiles
    bash -c 'ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"'
    brew tap homebrew/services
    cat ~/.dotfiles/brews | xargs brew install
    RCRC=~/.dotfiles/rcrc rcup -f -v
    direnv allow .
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
    git clone https://github.com/riywo/ndenv.git ~/.ndenv
    git clone https://github.com/riywo/node-build.git ~/.ndenv/plugins/node-build
    git clone https://github.com/talentdeficit/erlenv.git ~/.erlenv
    git clone https://github.com/mururu/exenv.git ~/.exenv
    git clone https://github.com/mururu/elixir-build.git ~/.exenv/plugins/elixir-build
    git clone https://github.com/yyuu/pyenv.git ~/.pyenv

------

### My crontab

    35 9-17/2 * * 1-5 /usr/local/bin/brew update &> /dev/null
    35 9-17/2 * * 1-5 find ~ -maxdepth 3 -type d \( -name ".*env" -o -path "$HOME/.*env/*-build" \) -exec git -C {} pull \; &> /dev/null
