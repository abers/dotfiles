# Apt
alias upgrade='sudo apt update; sudo apt upgrade -y'

# Vim
alias zshrc='nvim ~/.zshrc'
alias bashrc='nvim ~/.bashrc'
alias vimrc='nvim ~/.config/nvim/init.vim'
alias wiki='nvim ~/vimwiki/index.md'
alias zettel='nvim ~/zettel/index.md'
alias i3wm='nvim ~/.config/i3/config'
alias aliasrc='nvim ~/.oh-my-zsh/custom/alias.zsh'
alias keyfix="setxkbmap -layout gb,pl -option caps:escape"
alias vim='nvim'
alias v='nvim'

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
# alias python=python3
# alias pip=pip3
# alias bpython=bpython3
alias prun="pipenv run python"

# Movement aliases
alias dot='cd ~/Git/dotfiles/'

# Phobetor MPD
alias mp='mpc add http://192.168.0.4:8000; mpc play'
alias mr='ncmpcpp -h 192.168.0.4 -p 6600'

# Other
alias lastfm="mpdscribble --conf /home/alasdair/.config/mpdscribble/mpdscribble.conf"
alias fitbit="sudo /home/alasdair/.tmp/galileo/run --debug --bluetooth PyDBUS --database RemoteRESTDatabase --force"
alias gpg="gpg2"

# Backups
alias SteamSaves="rsync -aP --delete ~/.local/share/Tabletop\ Simulator/Saves /media/personal/Backups"

# Let's encrypt
alias letsencrypt='certbot certonly --manual -d *.$DOMAIN -d $DOMAIN --agree-tos --manual-public-ip-logging-ok --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory --register-unsafely-without-email --rsa-key-size 4096'
alias check-acme='nslookup -q=TXT _acme-challenge.constellations.scot'

# SSH
alias ssh-phobetor='ssh pi@192.168.0.4'
alias ssh-osmc='ssh osmc@192.168.0.6'

# Camera
alias cam-fix='sudo v4l2-ctl -d /dev/video0 --set-ctrl=exposure_auto=1; sudo v4l2-ctl -d /dev/video0 --set-ctrl=exposure_absolute=active; sudo v4l2-ctl -d /dev/video0 --set-ctrl=exposure_absolute=250; sudo v4l2-ctl -d /dev/video0 --set-ctrl=zoom_absolute=130'
cam-ex() {
    sudo v4l2-ctl -d /dev/video0 --set-ctrl=exposure_absolute="$1"
}
