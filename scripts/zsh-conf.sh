#/bin/bash
cat > ~/.zshrc << EOF
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

#export PATH="$ PATH:/opt/bin"
EOF

curl -fsSL https://github.com/hecdelatorre/common/raw/master/common.zsh-theme > ~/.zsh_prompt

chsh -s $(which zsh)
