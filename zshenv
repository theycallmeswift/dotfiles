typeset -U path # ensure unique paths within PATH

# General
export LANG=en_US.UTF-8
export EDITOR=vim
export ZSH_HISTORY_PATH=$HOME/.zsh_history
export HOMEBREW_SEARCH_CACHE_PATH=$HOME/.homebrew-search-cache

# Version Managers
if [[ -s $HOME/.rvm/scripts/rvm ]] ; then source $HOME/.rvm/scripts/rvm ; fi
if [[ -s $HOME/.nvm/nvm.sh ]] ; then source $HOME/.nvm/nvm.sh ; fi

# Path Extensions
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin" # Add Postgress App to PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#Optional
if [[ -s $HOME/.credentials ]] ; then source $HOME/.credentials ; fi
