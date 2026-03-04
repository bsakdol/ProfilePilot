# Make it easier to view my configured alias commands
alias aa='cat ~/.bash_aliases'

# Most commonly used git aliases
alias gco='git checkout'
alias glo='git log --oneline --abbrev-commit --graph --decorate --color'
alias gst='git status'
alias gsw='git switch'
alias new='git checkout -b'
alias yolo='git push origin --force-with-lease'
alias grpo='git remote prune origin'

# Less commonly used git aliases
alias grc='git rebase --continue'
alias grs='git rebase --skip'
alias gsb='git branch --verbose'
alias get='git pull origin master'
alias recommit='git commit --amend --no-edit'
alias uncommit='git reset --soft HEAD~1'
alias unstage='git reset HEAD --'
alias yeet='git push origin HEAD'

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

# Virtualenv Commands
alias here='mkvirtualenv -a $(pwd)'

# Make a directory and go into it
mkcd() {
  mkdir -p "$@" && cd "${@: -1}"
}

# Populate a Terraform directory with the standard files
tf_init() {
  local dir_name=$(basename "$PWD")
  touch README.md backend.tf main.tf variables.tf outputs.tf providers.tf locals.tf terraform.tf
  cat > README.md <<EOF
# $dir_name

<!-- BEGIN_TF_DOCS -->
<!-- END_TF_DOCS -->

EOF
  echo "Terraform files created in $dir_name."
}
