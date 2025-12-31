#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='\[\e[38;5;39m\]\u@\h \[\e[38;5;82m\]\w \[\e[38;5;244m\]$(git branch 2>/dev/null | sed -n "s/* \(.*\)/(\1)/p")\[\e[0m\]$ '

# General alias
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias this='fastfetch'
alias open='thunar'
alias update='sudo pacman -Syu && sudo pacman -Sc && sudo pacman -Rns $(pacman -Qtdq 2>/dev/null)'

# Tmux alias
alias tnew="tmux new -s"
alias tls="tmux ls"
alias tk="tmux kill-session -t"
alias tatt="tmux attach-session -t"


