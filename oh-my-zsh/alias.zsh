# Apt
alias upgrade='sudo apt update; sudo apt upgrade -y; sudo apt autoremove -y; flatpak update -y'

# Vim
alias zshrc='lvim ~/.zshrc'
alias bashrc='lvim ~/.bashrc'
alias vimrc='lvim ~/.config/nvim/init.vim'
alias wiki='lvim ~/vimwiki/index.md'
alias zettel='lvim ~/zettel/index.md'
alias i3wm='lvim ~/.config/i3/config'
alias aliasrc='lvim ~/.oh-my-zsh/custom/alias.zsh'
alias vim='lvim '
alias v='lvim '

# TaskWarrior
# alias ts='task sync'
# alias tw='task work'
# alias tp='task personal'
# alias td='task due'
# alias tl='task projects'
# alias ti='task inbox'
# alias ta='task add'
# alias t='task'
# alias tn='task sync;clear;td'
# alias tu='task +Urgent'
# alias tt='ts;clear;ti;tu;t +DUE; t +OVERDUE'
# tc () { task "$1" done; }

# Spelling
sp () { echo "$1" | aspell -a; }

# Git
alias dotup='cd ~/Git/dotfiles/; git add -A; git commit; git push;cd -'
alias dotdown='cd ~/Git/dotfiles/; git pull; cd -'
alias gitup='git add -A; git commit; git push'
alias gitall='git add -A; git commit'

# Python
# alias python=python3
# alias pip=pip3
# alias bpython=bpython3
alias prun="pipenv run python"

# Movement aliases
alias dot='cd ~/Git/dotfiles/'
alias ja='cd ~/Dropbox/work/JournalArticles/;ls'

# Phobetor MPD
alias mp='mpc add http://192.168.0.4:8000; mpc play'
alias mr='ncmpcpp -h 192.168.0.4 -p 6600'

# Other
alias lastfm="mpdscribble --conf /home/alasdair/.config/mpdscribble/mpdscribble.conf"
#alias fitbit="sudo /home/alasdair/.tmp/galileo/run --debug --bluetooth PyDBUS --database RemoteRESTDatabase --force"
#alias gpg="gpg2"
alias keyfix="setxkbmap -layout gb,pl -option caps:escape"

# Backups
alias SteamSaves="rsync -aP --delete ~/.local/share/Tabletop\ Simulator/Saves /mnt/files/Backups"
alias journalBack="rsync -aP --delete ~/Dropbox/notes/journal ~/Nextcloud/"

# Let's encrypt
alias letsencrypt='sudo certbot certonly --manual -d *.$DOMAIN -d $DOMAIN --agree-tos --manual-public-ip-logging-ok --preferred-challenges dns-01 --server https://acme-v02.api.letsencrypt.org/directory --register-unsafely-without-email --rsa-key-size 4096'
alias check-acme='nslookup -q=TXT _acme-challenge.constellations.scot'
alias copy-certs='sudo cp -r /etc/letsencrypt/live/constellations.scot/ ~/Dropbox/personal/'

# SSH
alias ssh-phobetor='ssh pi@192.168.0.6'
#alias ssh-osmc='ssh osmc@192.168.0.6'

# Camera
alias cam-fix='sudo v4l2-ctl -d /dev/video0 --set-ctrl=exposure_auto=1; sudo v4l2-ctl -d /dev/video0 --set-ctrl=exposure_absolute=active; sudo v4l2-ctl -d /dev/video0 --set-ctrl=exposure_absolute=600; sudo v4l2-ctl -d /dev/video0 --set-ctrl=zoom_absolute=130'
cam-ex() {
    sudo v4l2-ctl -d /dev/video0 --set-ctrl=exposure_absolute="$1"
}

# GCALCLI
alias agenda="gcalcli agenda --details all --tsv --nodeclined  \"`date '+%Y-%m-%d'`\" \"`date '+%Y-%m-%d 23:59'`\" | awk -vprefix=\"$prefix\" -F \$'\t'  '{print prefix \$2 \"-\" \$4 \" \" \$9 \" \" \$8}'"
