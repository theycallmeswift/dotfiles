# Helper Functions

## Color

function color() {
  if [ -n "$1" ]; then
    echo "%{$fg_bold[$2]%}$1%{$reset_color%}"
  fi
}

function default_color() {
  if [ -n "$1" ]; then
    echo "%{$reset_color%}$1"
  fi
}

function _cyan()        { echo "$(color "$1" cyan)" }
function _green()       { echo "$(color "$1" green)" }
function _grey()        { echo "$(default_color "$1")" }
function _magenta()     { echo "$(color "$1" magenta)" }
function _red()         { echo "$(color "$1" red)" }
function _white()       { echo "$(color "$1" white)" }
function _yellow()      { echo "$(color "$1" yellow)" }

## Git

function git_branch() {
  current_branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  if [[ -n $current_branch ]]; then
    echo "$(git_prompt_color $current_branch)"
  fi
}

function git_difference_from_track() {
  git_status="$(git status 2> /dev/null)"

  if [ ! -n "$(echo $git_status | grep "Your branch is up-to-date")" ]; then
    if [ -n "$(echo $git_status | grep "Your branch is behind")" ]; then
      difference="-"
    elif [ -n "$(echo $git_status | grep "Your branch is ahead of")" ]; then
      difference="+"
    fi

    if [ -n $difference ]; then
      difference+=$(echo $git_status | grep "Your branch is" | sed "s/Your branch is .* by//g" | sed "s/[^0-9]//g")
      echo "$(_yellow $difference)"
    fi
  fi
}

function git_prompt_color() {
  if [ -n "$1" ]; then
    current_git_status=$(git_status)

    if [ "changed" = $current_git_status ]; then
      echo "$(_red $1)"
    elif [ "pending" = $current_git_status ]; then
      echo "$(_yellow $1)"
    elif [ "unchanged" = $current_git_status ]; then
      echo "$(_green $1)"
    elif [ "untracked" = $current_git_status ]; then
      echo "$(_cyan $1)"
    fi
  else
    echo "$1"
  fi
}

function git_status() {
  git_status="$(git status 2> /dev/null)"

  if [ -n "$(echo $git_status | grep "Changes not staged")" ]; then
    echo "changed"
  elif [ -n "$(echo $git_status | grep "Changes to be committed")" ]; then
    echo "pending"
  elif [ -n "$(echo $git_status | grep "Untracked files")" ]; then
    echo "untracked"
  else
    echo "unchanged"
  fi
}

## Misc.

function bracket_wrap() { echo "$(_grey "[") $1 $(_grey "]") " }
function current_ruby() { echo "$(rbenv version-name)" }
function path()         { echo "$(_grey "%~")" }
function username()     { echo "$(_magenta "%n")" }

# Prompts

function prompt() {
  echo "$(bracket_wrap "$(path) $(git_branch) $(git_difference_from_track)")"
}

function rprompt() {
  if [ $COLUMNS -gt 80 ]; then
    echo "$(_white "$(current_ruby)")"
  fi
}

setopt promptsubst

PROMPT='$(prompt) '
RPROMPT='$(rprompt)'
