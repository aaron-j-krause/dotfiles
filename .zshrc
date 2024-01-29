source "$DOT_PATH/aliases.zsh"
source "$DOT_PATH/p10k"


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Clone zcomet if necessary
if [[ ! -f ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh ]]; then
  command git clone https://github.com/agkozak/zcomet.git ${ZDOTDIR:-${HOME}}/.zcomet/bin
fi

# zgenom
if [[ ! -d $HOME/.zgenom ]]; then
  git clone https://github.com/jandamm/zgenom.git "${HOME}/.zgenom"
fi

source ${ZDOTDIR:-${HOME}}/.zcomet/bin/zcomet.zsh

zcomet load romkatv/powerlevel10k
zcomet load zsh-users/zsh-history-substring-search
zcomet load zsh-users/zsh-syntax-highlighting
zcomet load agkozak/zsh-z
zcomet load zsh-users/zsh-completions
zcomet load ohmyzsh plugins/gitfast


# history (from thoughtbot)
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=1000
SAVEHIST=1000

export ERL_AFLAGS="-kernel shell_history enabled"

__git_files () { 
    _wanted files expl 'local files' _files     
}

# editor
export VISUAL=vim
export EDITOR=$VISUAL

export NVIM_TUI_ENABLE_TRUE_COLOR=1

bindkey -v
bindkey "^F" vi-cmd-mode

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^K" kill-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey "^Q" push-line-or-edit
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"


# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# path (from thoughtbot) probably don't need this
# ensure dotfiles bin directory is loaded first
PATH="/opt/homebrew/bin:$HOME/.nvm:/Applications/Xcode.app/Contents/Developer/usr/bin:$HOME/.bin:/usr/local/bin:/usr/local/sbin:/opt/homebrew/opt:/opt/homebrew/opt/llvm@13/bin:$PATH:/Users/aaron.krause/.local/bin:~/mvn/bin"

export FZF_DEFAULT_COMMAND='rg'

export -U PATH
## pretty menu's
# zstyle ':completion:*' menu select=1
# zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# setopt auto_menu    # show menu on 2nd <tab>
# setopt list_rows_first  # use row list if possible

zmodload -ap zsh/mapfile mapfile

export FZF_DEFAULT_COMMAND="rg --files"
export FZF_DEFAULT_OPTS="--extended"

autoload -Uz compinit
compinit

# faster git complete?
__git_files () { 
    _wanted files expl 'local files' _files     
}

# disable underline from zsh-syntax-highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none

export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"  # This loads nvm
[ -s "$(brew --prefix nvm)/bash_completion" ] && \. "$(brew --prefix nvm)/bash_completion"  # This loads nvm bash_completion

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


#[ -f "/Users/aaron.krause/.ghcup/env" ] && source "/Users/aaron.krause/.ghcup/env" # ghcup-env

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

source "$HOME/.zshrc.local"
