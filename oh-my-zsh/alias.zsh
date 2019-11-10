# Apt
alias upgrade='sudo apt update; sudo apt upgrade -y'

# Vim
alias zshrc='vim ~/.zshrc'
alias bashrc='vim ~/.bashrc'
alias vimrc='vim ~/.vimrc'
alias wiki='vim ~/vimwiki/index.md'
alias zettel='vim ~/zettel/index.md'
alias i3wm='vim ~/.config/i3/config'

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
sp () { echo "$1" | aspell -a; }
tc () { task "$1" done; }

# Git
alias dotup='cd ~/Git/dotfiles/; git add -A; git stage -A; git commit; git push;cd -'
alias dotdown='cd ~/Git/dotfiles/; git pull; cd -'
alias gitup='git add -A; git stage -A; git commit; git push'
alias gitall='git add -A; git stage -A; git commit'

# Python
alias python=python3
alias pip=pip3
alias bpython=bpython3
alias prun="pipenv run python"

# Movement aliases
alias dot='cd ~/Git/dotfiles/'

# Phobetor MPD
alias mp='mpc add http://192.168.0.28:8000; mpc play'
alias mr='ncmpcpp -h 192.168.0.28 -p 6600'

# Other
alias lastfm="mpdscribble --conf /home/alasdair/.config/mpdscribble/mpdscribble.conf"
alias fitbit="sudo /home/alasdair/.tmp/galileo/run --debug --bluetooth PyDBUS --database RemoteRESTDatabase --force"

