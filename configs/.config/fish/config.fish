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

alias i='ipython'
alias d='docker'

alias dps='docker ps -a'
alias di='docker images'


alias gs='git status'
alias gsec='git-crypt'

alias whatismyip='curl ipinfo.io/ip'
alias fix='sudo apt --fix-broken install'

alias kill_vpn="sudo kill (pgrep -f openvpn);"
alias rvpn="kill_vpn vpn"
#alias killvpn="ps auxww | grep 'openvpn' | awk '{print $2}' | xargs kill "

alias fa="setxkbmap -option grp:switch,grp:alt_shift_toggle,grp_led:scroll us,ir"

alias pp='python -mjson.tool'


function fish_prompt --description 'Write out the prompt'
    # Just calculate these once, to save a few cycles when displaying the prompt
    if not set -q __fish_prompt_hostname
    set -g __fish_prompt_hostname (hostname|cut -d . -f 1)
    end

    if not set -q __fish_prompt_normal
    set -g __fish_prompt_normal (set_color normal)
    end

    if not set -q __git_cb
    set __git_cb "("(set_color brown)(git branch ^/dev/null | grep \* | sed 's/* //')(set_color normal)")"
    end

    switch $USER

    case root

    if not set -q __fish_prompt_cwd
        if set -q fish_color_cwd_root
            set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
        else
            set -g __fish_prompt_cwd (set_color $fish_color_cwd)
        end
    end

    printf '%s:%s%s%s%s# ' $USER "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" $__git_cb

    case '*'

    if not set -q __fish_prompt_cwd
        set -g __fish_prompt_cwd (set_color $fish_color_cwd)
    end

    printf '%s:%s%s%s%s-> $ ' $USER "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal" $__git_cb

    end
end

function proxy_env
      set -x -g https_proxy '127.0.0.1:8123'
      set -x -g http_proxy '127.0.0.1:8123'
end

function newpass
    date +%s | sha256sum | base64 | head -c 20 ; echo
end
