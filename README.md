# Dependencies

I use the following tools as part of my setup:

 - homebrew - The Mac Package Manager
 - zsh - My shell of choice
 - git - version management
 - TMUX - window management
 - reattach-to-user-namespace - fixed copy paste bug in TMUX
 - ack - better than grep

Optionally, I use RVM and NVM for ruby and node.js version management.  You
can find out some more details about those here:

 - [RBENV](https://github.com/rbenv/rbenv)
 - [NVM](https://github.com/creationix/nvm)

# Install

```
$ git clone https://github.com/theycallmeswift/dotfiles.git ~/.dotfiles
$ cd ~/.dotfiles && rake install
$ git clone https://github.com/gmarik/vundle.git ~/.dotfiles/vim/bundle/vundle
$ vim +BundleInstall +qall
```
