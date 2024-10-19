# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export PATH="$PATH:/home/castroitalo/.config/composer/vendor/bin"
export ZSH="$HOME/.oh-my-zsh"

# ZSH theme
ZSH_THEME="robbyrussell"

# ZSH Plugins
plugins=(git zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# zsh-autosuggestions settings
bindkey '^ ' autosuggest-accept

# General aliases
alias update="sudo apt --fix-broken install && sudo apt clean && sudo apt auto-remove -y &&sudo apt update && sudo apt upgrade -y"
alias open="nautilus"

# tmux aliases
alias tnew="tmux new -s"
alias tls="tmux ls"
alias tk="tmux kill-session -t"
alias tatt="tmux attach-session -t"

# NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PHP_INI_SCAN_DIR="/home/castroitalo/.config/herd-lite/bin:$PHP_INI_SCAN_DIR"
