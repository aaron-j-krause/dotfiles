alias mkdir="mkdir -p"
alias e="$EDITOR"
alias v="$VISUAL"

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

alias myip="ifconfig | grep 'inet ' | grep -Fv 127.0.0.1 | awk '{print $2}'"
alias src="source ~/.zshrc"

alias h=httpie

alias cat="ccat"
alias vim="nvim"
alias vi="nvim"
alias nzf="fzf | xargs nvim"
alias jp="prettier --stdin-filepath j.json"

alias g="git"
alias gs="git status"

alias tx="tmuxinator start"
alias tk="tmux kill-session -t"
alias tn="tmux new -s"
alias ta="tmux attach-session -t"

alias dot="nvim ~/dot/.config -c ':lcd ~/dot/.config'"

alias kreact="pkill -2 'react(\/scripts)?(\/| )start'"

p () {
  directory=$(pwd)
  echo $directory
  echo $@

  plop --plopfile='/Users/krauseaa/plop/plopfile.js' --cwd=$directory --pwd=$directory "$@"
}


ts () {
tmux \
    new-session  '$@' \; \
    split-window -v \; \
    split-window -h \; \
    select-pane -t 1 \; \
    resize-pane -y 20 \; \
    select-pane -t 0 \; \
}

