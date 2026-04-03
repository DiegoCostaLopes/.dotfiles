#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ls='eza --color=always --group-directories-first --icons'
alias ll='eza -la --icons --octal-permissions --group-directories-first'


PS1='[\u@\h \W]\$ '

eval "$(starship init bash)"

# fzf setup
eval "$(fzf --bash)"
export FZF_DEFAULT_OPTS='-m --height 40% --layout reverse --border --style full'
export FZF_DEFAULT_COMMAND='fd --type f --strip-cwd-prefix --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# zoxide
eval "$(zoxide init bash)"

# Created by `pipx` on 2025-08-09 18:24:17
export PATH="$PATH:/home/diego/.local/bin"
export PATH="$PATH:/home/diego/.cargo/bin"

# gurobi setup
export GUROBI_HOME=/opt/gurobi1203/linux64
export PATH="$PATH:/opt/gurobi1203/linux64/bin"
export LD_LIBRARY_PATH=/opt/gurobi1203/linux64/lib
export GRB_LICENSE_FILE=/opt/gurobi1203/linux64/gurobi.lic

# hyprland
#
export XDG_CURRENT_DESKTOP=Hyprland
export XDG_SESSION_DESKTOP=Hyprland

# quickshell
export PATH="$PATH:/usr/lib/qt6/bin/qmlls"

# Defaults
export EDITOR='nvim'


# filen-cli
PATH=$PATH:~/.filen-cli/bin
