#!/bin/bash

set -eu -o pipefail

if [ -f $HOME/.4dev-toolbox/toolsrc ]; then
  echo "4dev-toolbox already present - updating..."
  cd  $HOME/.4dev-toolbox
  git pull --rebase || (
    echo "4dev-toolbox already installed, but couldn't update it"
  )
else
  git clone git@github.com:4sh/dev-toolbox.git || (
    echo "
  FAILED - failed to clone github repository
  Please check you have a github ssh key properly setup"
    exit 1
  )

  mv dev-toolbox $HOME/.4dev-toolbox
  echo "4dev-toolbox installed in ~/.4dev-toolbox"
fi

source $HOME/.4dev-toolbox/toolsrc

found=0
for rc in .zshrc .bashrc .bash_profile ; do
    if [ -f "$HOME/$rc" ]; then
      if [[ `grep ".4dev-toolbox" $HOME/$rc` ]]; then
        found=1
        continue
      fi
      echo '' >> $HOME/$rc
      echo 'source $HOME/.4dev-toolbox/toolsrc' >> $HOME/$rc
      echo "4dev-toolbox added to $rc"
    fi
done

if [ $found == 0 ]; then
  echo "source env file not found - please add this to your env init script:"
  echo '    source $HOME/.4dev-toolbox/toolsrc'
  exit 1
fi

echo "4dev-toolbox installed - use 4dev-help to get help"
