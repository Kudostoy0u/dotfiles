# No introductory sentence
set -g -x fish_greeting ''

# Quick way to access fish config
alias fishrc='nvim ~/.config/fish/config.fish'

# Quick way to access vim config
alias vimrc='nvim ~/.vimrc'

# Quick way to cd back n directories
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'

# Shorthand of zoxide
alias z="zoxide"

# Initialize zoxide
z init fish | source

# Because sometimes I forget to type the "n"
alias vim="nvim"

# Add directories to path
fish_add_path /home/kudos/.cargo/bin
fish_add_path /home/kudos/.local/bin

# When I want to use the real cat
alias meow="/usr/bin/cat"

# Because bat defaults to batcat for some reason
alias bat="batcat"

# Use bat instead of cat
alias cat="bat"

# When will I ever use apt without sudo?
alias apt="sudo apt"

# Quick way to install packages
function get
  apt install $argv[1]
end

# Quick way to update
alias update="apt update && apt upgrade -y"

# Generated for envman. Do not edit.
test -s "$HOME/.config/envman/load.fish"; and source "$HOME/.config/envman/load.fish"

# Use double bang in fish to execute previous commands

function bind_bang
    switch (commandline --current-token)[-1]
    case "!"
        # Without the `--`, the functionality can break when completing
        # flags used in the history (since, in certain edge cases
        # `commandline` will assume that *it* should try to interpret
        # the flag)
        commandline --current-token -- $history[1]
        commandline --function repaint
    case "*"
        commandline --insert !
    end
end

function bind_dollar
    switch (commandline --current-token)[-1]
    # This case lets us still type a literal `!$` if we need to (by
    # typing `!\$`). Probably overkill.
    case "*!\\"
        # Without the `--`, the functionality can break when completing
        # flags used in the history (since, in certain edge cases
        # `commandline` will assume that *it* should try to interpret
        # the flag)
        commandline --current-token -- (echo -ns (commandline --current-token)[-1] | head -c '-1')
        commandline --insert '$'
    case "!"
        commandline --current-token ""
        commandline --function history-token-search-backward


    # Main difference from referenced version is this `*!` case
    # =========================================================
    #
    # If the `!$` is preceded by any text, search backward for tokens
    # that contain that text as a substring. E.g., if we'd previously
    # run
    #
    #   git checkout -b a_feature_branch
    #   git checkout master
    #
    # then the `fea!$` in the following would be replaced with
    # `a_feature_branch`
    #
    #   git branch -d fea!$
    #
    # and our command line would look like
    #
    #   git branch -d a_feature_branch
    #
    case "*!"
        # Without the `--`, the functionality can break when completing
        # flags used in the history (since, in certain edge cases
        # `commandline` will assume that *it* should try to interpret
        # the flag)
        commandline --current-token -- (echo -ns (commandline --current-token)[-1] | head -c '-1')
        commandline --function history-token-search-backward
    case "*"
        commandline --insert '$'
    end
end

function fish_user_key_bindings
    bind ! bind_bang
    bind '$' bind_dollar
end
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; test -f /home/kudos/.ghcup/env ; and set -gx PATH $HOME/.cabal/bin /home/kudos/.ghcup/bin $PATH # ghcup-env
set PATH $PATH:/usr/local/go/bin
