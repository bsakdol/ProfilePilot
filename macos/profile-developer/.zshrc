###############################################################################
# Homebrew Zsh Completions
###############################################################################
# Add Homebrew-managed Zsh completion scripts to the function search path.
# These enhance autocompletion for tools installed through Homebrew.
if [[ -d "/opt/homebrew/share/zsh/site-functions" ]]; then
    fpath+=('/opt/homebrew/share/zsh/site-functions')
fi

# Initialize Zsh’s completion framework.
autoload -Uz compinit
compinit


###############################################################################
# Prompt / Theme (Oh My Posh)
###############################################################################
# Load Oh My Posh for non-Apple terminals.
# Apple Terminal can be noticeably slower when loading OMP, so we skip it there.
if [[ "$TERM_PROGRAM" != "Apple_Terminal" ]]; then
    if command -v oh-my-posh >/dev/null 2>&1; then
        eval "$(oh-my-posh init zsh --config ~/.poshthemes/meridian-2.omp.json)"
    fi
fi


###############################################################################
# Shell Aliases
###############################################################################
# Load custom alias definitions.
# The file is optional and kept separate for clarity.
if [[ -f "$HOME/.zsh_aliases" ]]; then
    source "$HOME/.zsh_aliases"
fi


###############################################################################
# Python Virtual Environment Support
###############################################################################
# Enable virtualenvwrapper if the environment directory exists
# and the tool is installed. Avoids errors on fresh systems.
if [[ -d "$HOME/.virtualenvs" ]] && command -v virtualenvwrapper.sh >/dev/null 2>&1; then
    export WORKON_HOME="$HOME/.virtualenvs"
    export VIRTUALENVWRAPPER_PYTHON="$(command -v python3)"
    source /opt/homebrew/bin/virtualenvwrapper.sh
fi


###############################################################################
# Fuzzy Finder (fzf) Integration
###############################################################################
# Load fzf’s Zsh integration only if fzf is installed.
# This provides keybindings and completion enhancements.
if command -v fzf >/dev/null 2>&1; then
    source <(fzf --zsh)
fi


###############################################################################
# Default Terminal Editor Configuration
###############################################################################
# Set Visual Studio Code as the system editor.
# --wait ensures commands (git commit, crontab -e, etc.) pause correctly.
export EDITOR="code --wait"
export VISUAL="$EDITOR"


###############################################################################
# Additional Environment Overrides
###############################################################################
# These are stored separately to keep ~/.zshrc clean.
# The file is optional and used for machine- or user-specific env settings.
if [[ -f "$HOME/.local/bin/env" ]]; then
    . "$HOME/.local/bin/env"
fi
