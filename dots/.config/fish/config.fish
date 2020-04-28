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
# python
alias p2='python2'
alias p3='python3'
alias load_env='. ./env/bin/activate.fish'
# wget
alias wget='wget -c'
alias nano='vim'
alias v='vim'

alias weather='curl wttr.in/dublin'

alias i='ipython'
alias d='docker'

alias dps='docker ps -a'
alias di='docker images'

alias clip='xclip -selection clipboard -i'

alias gs='git status'
alias gsec='git-crypt'

alias sshr='ssh -o "ConnectionAttempts 20" -v'
alias whatismyip='curl ipinfo.io/ip'
alias fix='sudo apt --fix-broken install'

alias kill_vpn="sudo kill (pgrep -f openvpn);"
alias rvpn="kill_vpn vpn"
#alias killvpn="ps auxww | grep 'openvpn' | awk '{print $2}' | xargs kill "

alias fa="setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,ir"

alias pp='python -mjson.tool'

alias snip='carbon-now --from-clipboard -c'


function proxy_env
      set -x -g https_proxy '127.0.0.1:8123'
      set -x -g http_proxy '127.0.0.1:8123'
end

function newpass
        openssl rand -base64 24
end

set -gx GOROOT /usr/local/go
set -gx GOPATH $HOME/project
set PATH $PATH $GOPATH/bin $GOROOT/bin $HOME/node_modules/.bin $HOME/.yarn/bin /snap/bin

# Start X at login
if status --is-interactive
  if test -z "$DISPLAY" -a $XDG_VTNR = 1
    exec startx -- -keeptty
  end
end
