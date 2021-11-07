# PLUGINS
source ~/.zuse/zuse.zsh

zuse github.com/zsh-users/zsh-autosuggestions
source $ZPATH/zsh-autosuggestions/zsh-autosuggestions.zsh

zuse github.com/zsh-users/zsh-completions
source $ZPATH/zsh-completions/zsh-completions.plugin.zsh

zuse github.com/zsh-users/zsh-syntax-highlighting
source $ZPATH/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#-----------------------------------------------------------------------------
# ALIAS
## git
alias g='git'
alias gp='git push --verbose'

alias gb='git branch --verbose'
alias gco='git checkout'

alias ga='git add --verbose'
alias gaa='git add --all --verbose'

alias gc='git commit -am'
alias gca='git commit -av'

alias gr='git reset --soft HEAD^'
alias gcr='git commit --amend --verbose'

alias gs='git status -s'
alias glog='git log --pretty="%h - %s - %ad" --relative-date -10'

# pacman
alias afetch='pacman -Q | wc -l'

# ping
alias aping='ping -c 1 www.gentoo.org'

# mtp mount & unmount
alias amtp-mount='aft-mtp-mount $HOME/Mount'
alias amtp-unmount='fusermount -u $HOME/Mount'

# rclone gdrive copy & sync
alias gdrive-copy='rclone copy -P gdrive: $HOME/Gdrive'
alias gdrive-sync='rclone sync -P $HOME/Gdrive gdrive:'

#-----------------------------------------------------------------------------
# SETTINGS
## Export variables
export EDITOR=nvim
export VISUAL=nvim
export PAGER=less
export BROWSER=firefox

## Vi mode
bindkey -v
KEYTIMEOUT=5

## History
HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

## completion
autoload -Uz compinit
compinit
setopt COMPLETE_ALIASES
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1

## Vcs
autoload -Uz vcs_info
precmd() {vcs_info}
setopt prompt_subst
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' get-revision true
zstyle ':vcs_info:*' check-for-changes true

## Prompt
autoload -Uz promptinit
promptinit
zstyle ':vcs_info:*' formats '%F{magenta}%b%f %F{green}%8.8i %c%u%f'
zstyle ':vcs_info:*' actionformats '%F{magenta}%b%f %F{red}%a %c%u%f'
zstyle ':vcs_info:*' stagedstr '%F{green}↑'
zstyle ':vcs_info:*' unstagedstr '%F{red}↓'

PROMPT=$'%B%F{green}%n@%m%f %F{blue}%~%f $%b%E '
RPROMPT='%B${vcs_info_msg_0_}%b'

#-----------------------------------------------------------------------------
# OTHER
## Sway
if [ -z $DISPLAY ] && [ "$(tty)" = "/dev/tty1" ]; then
    exec sway
fi

## Cursor shape
function zle-keymap-select {
    if [[ ${KEYMAP} == vicmd ]] || [[ $1 = 'block' ]]; then
        echo -ne '\e[1 q'
    elif [[ ${KEYMAP} == main ]] || [[ ${KEYMAP} == viins ]] || [[ ${KEYMAP} = '' ]] || [[ $1 = 'beam' ]]; then
        echo -ne '\e[5 q'
    fi
}

zle -N zle-keymap-select
echo -ne '\e[5 q'
preexec() {echo -ne '\e[5 q'}
