alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

# ZSH_FZF_TAB
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*' list-colors "$\{(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza -1 --color=always $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

source ${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions/fast-syntax-highlighting.plugin.zsh
source ${pkgs.zsh-autoenv}/share/zsh-autoenv/autoenv.zsh
source ${pkgs.pyenv}/share/zsh/site-functions/_pyenv
path+=$HOME/.local/bin
# path+="/opt/homebrew/opt/libiodbc/bin"
export PATH
eval "$(op completion zsh)"; compdef _op op
