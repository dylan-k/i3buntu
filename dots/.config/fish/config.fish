alias s='sudo'
alias yum='sudo yum'
alias apt='sudo apt'
alias pacman='sudo pacman'
alias systemctl='sudo systemctl'
alias swapoff='sudo swapoff'
alias swapon='sudo swapon'
alias tailf='tail -f'
alias k8="kubectl"
alias l='ls'
alias sl='ls'
alias v='vim'
alias nano='vim'
alias wget='wget -c'

# python
alias p2='python2'
alias p3='python3'
alias load_env='. ./env/bin/activate.fish'
alias i='ipython'
alias pp='python -mjson.tool'


alias weather='curl "wttr.in/dublin?m"'
alias ly='bash ~/bin/spotify/lyrics.sh spotify'


alias d='docker'
alias dps='docker ps -a'
alias dim='docker images'
alias dkill='docker kill (docker ps -q)'

alias clip='xclip -selection clipboard -i'
alias ports='sudo tcpdump -nltpd'
alias tfs="tfswitch -b $HOME/bin/terraform"

alias g='git'
alias gc='git clone'
alias gst='git status'
alias gdiff='git diff'
alias gadd='git add -A'
alias gpus='git push'
alias gcom='git commit'
alias gsec='git-crypt'
alias shell='docker run -it --entrypoint /bin/fish -v "$HOME/.ssh:/work/.ssh" -v "$HOME/.aws:/work/.aws" -v "$HOME/.bash_history:/work/.bash_history"  --privileged efazati/kise'

alias sshr='ssh -o "ConnectionAttempts 20" -o "ConnectTimeout=10" -v'
alias whatismyip='curl ipinfo.io/ip'
alias fix='sudo apt --fix-broken install'

alias kill_vpn="sudo kill (pgrep -f openvpn);"

alias fa="setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,ir"

alias snip='carbon-now --from-clipboard -c'

alias vpn='sudo openvpn --config ~/vpn/vpn_farm_new.ovpn'
alias wg_up='sudo wg-quick up wg0'
alias wg_down='sudo wg-quick down wg0'

function proxy_env
      set -x -g https_proxy '127.0.0.1:8123'
      set -x -g http_proxy '127.0.0.1:8123'
end

function newpass
        openssl rand -base64 24 | tr -d  '\n/+'
end

if test -f /home/efazati/.autojump/share/autojump/autojump.fish; . /home/efazati/.autojump/share/autojump/autojump.fish; end

set -gx GOROOT /usr/local/go
set -gx GOPATH $HOME/project
set PATH $PATH $GOPATH/bin $GOROOT/bin $HOME/node_modules/.bin $HOME/.yarn/bin /snap/bin $HOME/apps/git-fuzzy/bin $HOME/bin

# Start X at login
if status --is-interactive
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end
