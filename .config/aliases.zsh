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
alias dotv="nvim ~/dotfiles/.config/nvim -c ':lcd ~/dotfiles/.config/nvim'"
alias ls="ls -A"

alias g="git"
alias gs="git status"
alias gc="git commit -m"
alias gd="git diff"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gr="git reset"
alias gp="git push"
alias gb="git branch"
alias g\-="git checkout -"
# yarn specific
alias y="yarn"
alias ya="yarn add"
alias yr="yarn remove"

# alias f="nvim $(fzf)"


# jira specific
# requires: https://github.com/ankitpokhrel/jira-cli
# and JIRA_API_TOKEN in environment
# TODO: check for jira cli

alias j="jira-cli"
alias ji="jira-cli issues"
alias jio="jira-cli issues list --sOpen"
alias jime="jira-cli issues list --tOpen $WORK_EMAIL"


# tmux
alias t="tmux"
alias tx="tmuxinator start"
alias tk="tmux kill-session -t"
alias tn="tmux new -s"
alias ta="tmux attach-session -t"
alias v="vim"
alias kreact="pkill -2 'react(\/scripts)?(\/| )start'"

alias dockerip="docker inspect --format '{{ .NetworkSettings.IPAddress }}'"

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

