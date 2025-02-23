# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

## OWN
# MyFunctions

sp () { echo "$1" | aspell -a; }

tc () { task "$1" done; }

# MyAliases

# TaskWarrior

alias ts='task sync'
alias tw='task work'
alias tp='task personal'
alias td='task due'
alias tl='task projects'
alias ti='task inbox'
alias ta='task add'
alias t='task'
alias tn='task sync;clear;td'
alias tu='task +Urgent'
alias tt='ts;clear;ti;tu;t +DUE; t +OVERDUE'
alias shutd='shutdown -h now'

# Vim

alias vimrc='vim ~/.vimrc'
alias bashrc='vim ~/.bashrc'
alias wiki='vim ~/vimwiki/index.md'
alias zettel='vim ~/zettel/index.md'
alias i3wm='vim ~/.config/i3/config'

# Git
alias dotup='cd ~/Git/dotfiles/; git add -A; git stage -A; git commit; git push;cd -'
alias dotdown='cd ~/Git/dotfiles/; git pull; cd -'
alias gitup='git add -A; git stage -A; git commit; git push'
alias gitall='git add -A; git stage -A; git commit'

# Movement aliases
alias dot='cd ~/Git/dotfiles/'

# Phobetor MPD

alias mp='mpc add http://192.168.0.28:8000; mpc play'
alias mr='ncmpcpp -h 192.168.0.28 -p 6600'

# Other aliases

alias hardfought="ssh nethack@eu.hardfought.org"
alias lastfm="mpdscribble --conf /home/alasdair/.config/mpdscribble/mpdscribble.conf"
alias fitbit="sudo /home/alasdair/.tmp/galileo/run --debug --bluetooth PyDBUS --database RemoteRESTDatabase --force"

# PS1

export PS1="\[\e]0;\w\a\]\n\[$(tput bold)\]\[\e[36m\]\u\[\e[32m\]@\[\e[35m\]\h\[\e[2m\]\[\e[0;33m\] \w\[\e[90m\]\[\e[34m\]\n\$ \[$(tput sgr0)\]"

LS_COLORS="ow=01;90:di=01;42"

export LS_COLORS

# Anaconda
# . /home/alasdair/anaconda3/etc/profile.d/conda.sh  # commented out by conda initialize
#export PATH="/home/alasdair/anaconda3/bin:$PATH"
alias python=python3
alias pip=pip3
alias bpython=bpython3

# Automatically fix directory name types when changing directory
shopt -s cdspell 

export XDG_CURRENT_DESKTOP=KDE

export PATH="~/.local/bin:$PATH"

source "$HOME/.vim/bundle/gruvbox/gruvbox_256palette.sh"
# Importing palette creates new shell with //// before prompt so...
clear

# Startup commands
# t +ACTIVE;t +OVERDUE -ACTIVE; t +Urgent -OVERDUE -ACTIVE

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export EDITOR=nvim;
export VISUAL=nvim;
export DOMAIN=constellations.scot

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/.gem/ruby/3.2.0/bin:$PATH"
