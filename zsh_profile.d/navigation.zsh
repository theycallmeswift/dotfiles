export CURRENT_PROJECT_PATH=$HOME/.current-project

setopt auto_cd
cdpath=($HOME/dev $HOME/dev/personal)

function chpwd {
  echo $(pwd) >! $CURRENT_PROJECT_PATH
  ls
}

current() {
  if [[ -f $CURRENT_PROJECT_PATH && -d "$(cat $CURRENT_PROJECT_PATH)" ]]; then
    cd "$(cat $CURRENT_PROJECT_PATH)"
  fi
}
