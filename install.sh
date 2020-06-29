#!/bin/bash

set -eu -o pipefail

git clone git@github.com:4sh/dev-toolbox.git 

mv dev-toolbox $HOME/.4dev-toolbox

if [ -f "$HOME/.zshrc" ]; then
  echo '\nsource $HOME/.4dev-toolbox/toolsrc' >> $HOME/.zshrc
  echo "installed in .zshrc - please open a new shell to get functions"
elif [ -f "$HOME/.bashrc" ]; then
  echo '\nsource $HOME/.4dev-toolbox/toolsrc' >> $HOME/.bashrc
  echo "installed in .bashrc - please open a new shell to get functions"
elif [ -f "$HOME/.bash_profile" ]; then
  echo '\nsource $HOME/.4dev-toolbox/toolsrc' >> $HOME/.bash_profile
  echo "installed in .bash_profile - please open a new shell to get functions"
else
  echo "source env file not found - please add this to your env init script"
  echo '    source $HOME/.4dev-toolbox/toolsrc'
fi
