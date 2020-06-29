#!/bin/bash

set -eu -o pipefail

git clone git@github.com:4sh/dev-toolbox.git 

mv dev-toolbox $HOME/.4dev-toolbox

if [ -f "$HOME/.zshrc" ]; then
  target=.zshrc
elif [ -f "$HOME/.bashrc" ]; then
  target=.bashrc  
elif [ -f "$HOME/.bash_profile" ]; then
  target=.bash_profile
else
  echo "source env file not found - please add this to your env init script"
  echo '    source $HOME/.4dev-toolbox/toolsrc'
  exit 1
fi

echo '' >> $HOME/$target
echo 'source $HOME/.4dev-toolbox/toolsrc' >> $HOME/$target
echo "installed in $target - please open a new shell to get functions"
