# dev-toolbox

A set of ready to use dockerized commands.

One liner install (!! require git and a github ssh key setup):
```
curl https://raw.githubusercontent.com/4sh/dev-toolbox/master/install.sh | bash
```

Installation clones this repo to ~/.4dev-toolbox and adds a line at the end of your env init script (.zshrc | .bashrc | .bash_profile):
source $HOME/.4dev-toolbox/toolsrc

When installed, use `4dev-help` to get a list of commands.

You can also look at `/.4dev-toolbox/toolsrc` to see how it is implemented.
