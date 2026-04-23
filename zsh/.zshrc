export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"
plugins=(git)

source $ZSH/oh-my-zsh.sh

# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Aliases
alias ll="eza -all"
alias sync-media="rsync -avz \"/Users/jyn/Jellyfin/Shows/\" doyeon@100.100.165.110:/mnt/storage/media/shows/ & rsync -avz \"/Users/jyn/Jellyfin/Movies/\" doyeon@100.100.165.110:/mnt/storage/media/movies/"
alias lazyvim='NVIM_APPNAME=nvim-lazyvim nvim'
alias f="fzf --height 40% --layout reverse --border"

export FZF_DEFAULT_OPTS=" \
--color=fg:#cdcdcd \
--color=bg:#000000 \
--color=hl:#f3be7c \
--color=fg+:#aeaed1 \
--color=bg+:#252530 \
--color=hl+:#f3be7c \
--color=border:#606079 \
--color=header:#6e94b2 \
--color=gutter:#141415 \
--color=spinner:#7fa563 \
--color=info:#f3be7c \
--color=pointer:#aeaed1 \
--color=marker:#d8647e \
--color=prompt:#bb9dbd"

export BAT_THEME="vague"
alias lg='lazygit'
