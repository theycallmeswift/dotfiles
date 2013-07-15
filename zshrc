source $HOME/.aliasrc

for zsh_source in $HOME/.zsh_profile.d/*.zsh; do
  source $zsh_source
done

current

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
