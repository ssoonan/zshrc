# if we have a screen, we can try a colored screen
if [[ "$TERM" == "screen" ]]; then
    export TERM="screen-256color"
fi

# activate ls colors, (private if possible)
export ZSH_DIRCOLORS="$ZSH_CONFIG/dircolors-solarized/dircolors.256dark"
if [[ -a $ZSH_DIRCOLORS ]]; then
    if [[ "$TERM" == *256* ]]; then
        which dircolors > /dev/null && eval "`dircolors -b $ZSH_DIRCOLORS 2>/dev/null`"
    else
        # standard colors for non-256-color terms
        which dircolors > /dev/null && eval "`dircolors -b`"
    fi
else
    which dircolors > /dev/null && eval "`dircolors -b`"
fi

alias up=" nmcli con up id"
alias down=" nmcli con down id"

LSB_DISTRIBUTOR=`lsb_release -i -s`

# debian and ubuntu specific aliases
## autocomplete-able apt-xxx aliases
if [[ "$LSB_DISTRIBUTOR" == "Ubuntu" ]]; then
    alias acs='apt-cache show'
    alias agi='sudo apt install'
    alias ag='sudo apt'
    alias agu='sudo apt update'
    alias agug='sudo apt upgrade'
    alias aguu='agu && agug'
    alias agr='sudo apt uninstall'
    alias agp='sudo apt purge'
    alias aga='sudo apt autoremove'
    alias ctl='sudo service '
    alias feierabend='sudo shutdown -h now'
fi

# arch linux with systemd aliases
if [[ "$LSB_DISTRIBUTOR" == "archlinux" ]]; then
    # statements
    alias ctl='sudo systemctl '
    alias feierabend='sudo systemctl start poweroff.target'
    alias start=" sudo systemctl start"
    alias stop=" sudo systemctl stop"
    alias status=" sudo systemctl status"
    alias restart=" sudo systemctl restart"
    alias reboot="sudo systemctl start reboot.target"
fi

