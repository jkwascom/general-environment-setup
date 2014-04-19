# The following lines were added by compinstall
#source ~/.zkbd/xterm-256color-unknown-linux-gnu

zstyle ':completion:*' add-space true
zstyle ':completion:*' completer _complete _ignored _correct _approximate _prefix
zstyle ':completion:*' glob 0
zstyle ':completion:*' match-original both
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' prompt 'Possible Corrections'
zstyle ':completion:*' substitute 0
zstyle :compinstall filename '/home/jkwascom/.zshrc'

fpath=("$HOME/.zsh/functions" $fpath)
testingit() {
  print 'output of tty: ' `tty`
  print 'value of $TTY: ' `echo $TTY`
}
autoload -Uz edit-zshrc 
zle -N edit-zshrc
zle -N testingit

bindkey -v
bindkey '[1~' vi-beginning-of-line
bindkey '[4~' vi-end-of-line
bindkey '[24~' edit-zshrc
bindkey '[23~' testingit 
##autoload -Uz compinit
##compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=100000
SAVEHIST=100000
setopt appendhistory

# default apps
  (( ${+BROWSER} )) || export BROWSER="w3m"
  (( ${+PAGER} ))   || export PAGER="less"

# format titles for screen and rxvt
function title() {
  # escape '%' chars in $1, make nonprintables visible
  a=${(V)1//\%/\%\%}

  # Truncate command, and join lines.
  a=$(print -Pn "%40>...>$a" | tr -d "\n")

  case $TERM in
  screen)
    print -Pn "\ek$a:$3\e\\"      # screen title (in ^A")
    ;;
  xterm*|rxvt)
    print -Pn "\e]2;$2 | $a:$3\a" # plain xterm title
    ;;
  esac
}

# precmd is called just before the prompt is printed
function precmd() {
  title "zsh" "$USER@%m" "%55<...<%~"
}

# preexec is called just before any command line is executed
function preexec() {
  title "$1" "$USER@%m" "%35<...<%~"
}

# colorful listings
zmodload -i zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

autoload -Uz compinit
compinit

# End of lines configured by zsh-newuser-install

alias vi=vim
alias pacs=pacsearch
alias paci='sudo pacman -Syu'
# aliases
alias mv='nocorrect mv'       # no spelling correction on mv
alias cp='nocorrect cp'
alias mkdir='nocorrect mkdir'
alias j=jobs
if ls -F --color=auto >&/dev/null; then
  alias ls="ls --color=auto -F"
else
  alias ls="ls -F"
fi
alias ll="ls -lArti"
alias l.='ls -d .[^.]*'
alias lsd='ls -ld *(-/DN)'
alias md='mkdir -p'
alias rd='rmdir'
alias cd..='cd ..'
alias ..='cd ..'
alias po='popd'
alias pu='pushd'
alias tsl="tail -f /var/log/syslog"
alias df="df -hT"
alias em="emacs -nw"
alias rg="grep -ri"
alias cat="less -FX"

# functions
mdc() { mkdir -p "$1" && cd "$1" }
setenv() { export $1=$2 }  # csh compatibility
sdate() { date +%Y.%m.%d }
pc() { awk "{print \$$1}" }
rot13 () { tr "[a-m][n-z][A-M][N-Z]" "[n-z][a-m][N-Z][A-M]" }
vim-command-show () {
	vim -c "redir @\" | silent $@ | redir END | set paste | exe \"normal pdd\" | x! /tmp/supertmp.tmpytmp"
  cat /tmp/supertmp.tmpytmp
  rm /tmp/supertmp.tmpytmp
}

# shuffle input lines. Nice for mp3 playlists etc...
shuffle() {
  RANDOM=`date +%s`
  (
  while IFS= read -r i; do
    echo $RANDOM$RANDOM "$i";
  done
  ) | sort | sed 's/^[0-9]* //'
}

prompt adam2

# prompt (if running screen, show window #)
#if [ x$WINDOW != x ]; then
#    export RPROMPT="$WINDOW:%~%# "
#else
#    export RPROMPT='%~ %# '
#fi

export LESS='SRFX'
export PATH=~/.local/bin:$PATH
export POWERLINE_HOME=/lib/python3.4/site-packages/powerline
source $POWERLINE_HOME/bindings/zsh/powerline.zsh
export ADVOCATE_HOME=/workspace/jkwascom/dti/all
export MAIN_PUBS="$ADVOCATE_HOME/ADVOCATE $ADVOCATE_HOME/NEWORLEANS $ADVOCATE_HOME/SHARED"
pubcrawl() { grep -r -E $@ $ADVOCATE_HOME/ADVOCATE $ADVOCATE_HOME/NEWORLEANS $ADVOCATE_HOME/SHARED}

if [ x$TMUX == x ]; then
    tmux has-session -t 0 2> /dev/null || tmux new-session -s 0
    tmux new-session -t 0
    #`tmux list-sessions 2> /dev/null 1>&2` || tmux -l && tmux attach
fi

#echo 'new-session -t 0 is the tmux command you keep looking for'
echo 'hmm... http://linuxlefty.com/tools/favorite-vim-plugins-vi-gvim.html'
export KEYTIMEOUT=1
