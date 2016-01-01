typeset -U path # ensure unique paths within PATH

# General
export LANG=en_US.UTF-8
export EDITOR=vim
export ZSH_HISTORY_PATH=$HOME/.zsh_history
export HOMEBREW_SEARCH_CACHE_PATH=$HOME/.homebrew-search-cache

# Path Extensions
export PATH="$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin" # Add Postgress App to PATH

#Optional
if [[ -s $HOME/.credentials ]] ; then source $HOME/.credentials ; fi
