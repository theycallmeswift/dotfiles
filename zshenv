typeset -U path # ensure unique paths within PATH

path=($HOME/.dotfiles/bin /usr/local/Cellar/python/2.7.5/bin /usr/local/share/python /usr/local/bin $path)

# General
export LANG=en_US.UTF-8
export EDITOR=vim
export ZSH_HISTORY_PATH=$HOME/.zsh_history
export HOMEBREW_SEARCH_CACHE_PATH=$HOME/.homebrew-search-cache

# Version Managers
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
if [[ -s $HOME/.nvm/nvm.sh ]] ; then source $HOME/.nvm/nvm.sh ; fi

#Optional
if [[ -s $HOME/.credentials ]] ; then source $HOME/.credentials ; fi
