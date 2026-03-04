# Make it easier to view my configured alias commands
alias aa='cat ~/.bash_aliases'

# Make some possibly destructive commands more interactive.
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

# Add some easy shortcuts for formatted directory listings and add a touch of color.
alias ll='ls -lF --color=auto'
alias la='ls -alF --color=auto'
alias ls='ls -F'

# Make grep more user friendly by highlighting matches
# and exclude grepping through .svn folders.
alias grep='grep --color=auto --exclude-dir=\.svn'

# Make viewing $PATH easy to read (put each dir on a newline)
alias path='tr ":" "\n" <<< "$PATH"'

# Make a directory and go into it
mkcd() {
  mkdir -p "$@" && cd "${@: -1}"
}
