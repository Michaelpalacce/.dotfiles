# PERSONAL
export TERM="xterm-256color"

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
# END PERSONAL

# BEGIN ANSIBLE MANAGED BLOCK kubectl
alias k='kubectl'
# END ANSIBLE MANAGED BLOCK kubectl
# BEGIN ANSIBLE MANAGED BLOCK kubectl-namespace
alias kubens='kubectl config set-context --current --namespace'
# END ANSIBLE MANAGED BLOCK kubectl-namespace
# BEGIN ANSIBLE MANAGED BLOCK velero
alias v='velero'
# END ANSIBLE MANAGED BLOCK velero
# BEGIN ANSIBLE MANAGED BLOCK helm
alias h='helm'
# END ANSIBLE MANAGED BLOCK helm
