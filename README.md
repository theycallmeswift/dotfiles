# Installation Instructions

These are the installation instructions for Hacker League on a Macbook running
OSX v10.8, but setup should be similar for other linux enviornemts and
versions of OSX.

## Step 1: Install XCode v4+

If you're installing XCode 5, the CLI tools will be installed automatically,
but if you're installing version 4, you may need to install them yourself.

[More info](https://developer.apple.com/xcode/)

## Step 2: Install Homebrew

My Mac Package manager of choice is [Homebrew](http://brew.sh/), so this 
install guide will use it exclusively.  You could use MacPorts as an 
alternative if you were foolish enough to try.

To install homebrew, exectute the following command:

```
ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go)"
```

## Step 3: Install zsh and change your shell

My dotfiles take advantage of a lot of the utilities that ZSH offers, so
you'll need to switch to ZSH if you're not using it already.

```
$ brew install zsh && chsh -s zsh
```

Make sure you restart your terminal for this to take effect.

## Step 4: Install tools

I use the following tools as part of my setup:

 - git - version management
 - TMUX - window management
 - reattach-to-user-namespace - fixed copy paste bug in TMUX
 - ack - better than grep

You can install them using Homebrew with the following command:

```
$ brew install git tmux reattach-to-user-namespace ack
```

## Step 5: Clone and install

Now we need to clone and install the actual dotfiles.  Run the following
command to take care of that stuff:

```
$ git clone https://github.com/theycallmeswift/dotfiles.git ~/.dotfiles
```

**Note:** It's important that we use the ~/.dotfiles directory because it adds
some nice binary support to our path.

Now to install everything:

```
$ cd ~/.dotfiles && rake install
```

## Step 6: Install Vundle and Bundle vim stuff nicely

I use vundle to handle my Vim plugins.  To install it run:

```
$ git clone https://github.com/gmarik/vundle.git ~/.dotfiles/vim/bundle/vundle
```

and then install the dependencies with:

```
$ vim +BundleInstall +qall
```

## Step 7: Install optional fun stuff

Optionally, I use RVM and NVM for ruby and node.js version management.  You
can find out some more details about those here:

 - [https://rvm.io/](https://rvm.io/)
 - [https://github.com/creationix/nvm](https://github.com/creationix/nvm)
