###############################################################################
# Homebrew Environment Initialization (Login Shell Only)
###############################################################################
# Homebrew recommends placing this in .zprofile so that PATH and other
# environment variables are set before .zshrc loads.
# This ensures Homebrew binaries are prioritized correctly at login.
eval "$(/opt/homebrew/bin/brew shellenv)"%
