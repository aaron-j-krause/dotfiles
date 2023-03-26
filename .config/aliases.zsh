alias mkdir="mkdir -p"
alias e="$EDITOR"
alias v="$VISUAL"

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'

alias myip="ifconfig | grep 'inet ' | grep -Fv 127.0.0.1 | awk '{print $2}'"
alias src="source ~/.zshrc"

alias h=httpie

# overrides
alias ls="ls -A"
alias cat="ccat"
alias vim="nvim"
alias vi="nvim"

alias c="clear"
alias jp="prettier --stdin-filepath j.json"
alias md="mkdir"
alias dot="nvim ~/dotfiles/.config -c ':lcd ~/dotfiles/.config'"
alias g="git"
alias gs="g status"
alias ls="ls -A"
#
# TODO: doesn't work
# alias nzf="fzf | xargs nvim"
# TODO: also doesn't work. But this one was close. Runs fzf when the file is sourced, might be a zsh expansion thing?
# alias fv="nvim $(fzf)\n"

# tmux
alias tx="tmuxinator start"
alias tk="tmux kill-session -t"
alias tn="tmux new -s"
alias ta="tmux attach-session -t"


alias kreact="pkill -2 'react(\/scripts)?(\/| )start'"

p () {
  directory=$(pwd)
  echo $directory
  echo $@

  plop --plopfile='/Users/krauseaa/plop/plopfile.js' --cwd=$directory --pwd=$directory "$@"
}

ga () {
  arg=$@
  if [ $# -eq 0 ]
    then
      arg='.'
  fi
  git add "$arg"
  git status
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

