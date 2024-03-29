# ensure dotfiles bin directory is loaded first
PATH="$HOME/.bin:/usr/local/sbin:/opt/homebrew/bin:$PATH"

# Load rbenv
if command -v rbenv >/dev/null; then
  eval "$(rbenv init - --no-rehash)"
fi

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# QT 5.5
if [ -n "$(brew ls --versions qt@5.5)" ]; then
  PATH="$(brew --prefix qt@5.5)/bin:$PATH"
fi

# Load Postgres.app
export PG_APP_PATH="/Applications/Postgres.app/Contents/Versions/latest/bin"
if [ -s "$PG_APP_PATH" ]; then
  PATH="$PG_APP_PATH:$PATH"
fi

# Load Rust
export RUST_PATH="$HOME/.cargo/bin"
if [ -s "$RUST_PATH" ]; then
  PATH="$RUST_PATH:$PATH"
fi

# Load JDK
export JDK_PATH="/opt/homebrew/opt/openjdk/bin"
if [ -s "$JDK_PATH" ]; then
  PATH="$JDK_PATH:$PATH"
fi

# mkdir .git/safe in the root of repositories you trust
PATH=".git/safe/../../bin:$PATH"

export -U PATH
