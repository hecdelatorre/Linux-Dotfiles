autoload -U colors && colors

source ~/.zsh_prompt

ZSH_AUTOSUGGEST=true
autoload -Uz compinit
compinit
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'
zstyle ':completion:*:approximate' max-errors 1 numeric
zstyle ':completion:*:approximate' max-results 20
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:ssh:*' tag-order 'hosts:-host: :userhosts:-userhost: :users:-user: :completion:*'
zstyle ':completion:*:scp:*' tag-order 'hosts:-host: :completion:*'

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

setopt inc_append_history
setopt share_history
setopt nocaseglob
setopt interactivecomments

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -lhtr'
alias btm='btm --color nord'
alias c='clear'
alias ..='cd ..'
alias xc='xclip -selection clipboard'

export PATH="$PATH:/opt/aria2-1.36.0/bin"
export PATH="$PATH:/opt/bottom"
export PATH="$PATH:/opt/curl-8.0.1/bin"
export PATH="$PATH:/opt/gcc-11.3.0/bin"
#export PATH="$PATH:/opt/git-2.32.6/bin"
export PATH="$PATH:/opt/nvim-linux64/bin"
export PATH="$PATH:/opt/pfetch-0.6.0"
#export PATH="$PATH:/opt/r-wallpaper"
export PATH="$PATH:/opt/sqlite-3.41.2/bin"
#export PATH="$PATH:/opt/ytop"
export PATH="$PATH:/opt/wget-1.21.3/bin"
export PATH="$PATH:/opt/wget2-2.0.1/bin"
export PATH="$PATH:/opt/r-wallpaper/"
