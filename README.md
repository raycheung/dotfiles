Moving development environment around.
------

Base16 themes: http://chriskempson.com/projects/base16/

------

## Quickstart

    git clone --recursive http://github.com/raycheung/dotfiles ~/.dotfiles
    git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
    curl https://nixos.org/nix/install | sh
    nix-env -i rcm
    RCRC=~/.dotfiles/rcrc rcup -f -v
    nix-env -i direnv
    direnv allow .
    git clone https://github.com/pyenv/pyenv.git ~/.pyenv
    git clone https://github.com/nodenv/nodenv.git ~/.nodenv
    git clone https://github.com/nodenv/node-build.git ~/.nodenv/plugins/node-build
    git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
    git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

------

### My crontab

    35 9-17/2 * * 1-5 find ~ -maxdepth 3 -type d \( -name ".*env" -o -path "$HOME/.*env/*-build" \) -exec git -C {} pull \; &> /dev/null
