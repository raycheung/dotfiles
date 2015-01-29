# for ndenv
export PATH="$HOME/.ndenv/bin:$PATH"
eval "$(ndenv init -)"

# loading local node_modules bin files
node_modules_paths=`find $HOME -maxdepth 3 -name node_modules -type d -execdir npm bin \;`
if [ -n "$node_modules_paths" ]; then
  export PATH="$node_modules_paths:$PATH"
fi
