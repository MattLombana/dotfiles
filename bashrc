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

# Save the date and time
HISTTIMEFORMAT='%F %T | '

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# Save history after running each command
# history -a - save command to global history
# history -c - update count of global history
# history -r - read global history into current session
# Each of these comes from lesmana's answer on stack exchange:
# https://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
#export PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

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

# PS1 Color setting
#
# Pattern:
# (chroot)user@hostname:path$
#
# Colors:
# +---------------------------+----------+----------------+------------------+
# |                           |  Chroot  |  User Color    |  Hostname Color  |
# +---------------------------+----------+----------------+------------------+
# | Chroot                    |  Yellow  |                |                  |
# | Standard user (local)     |          |  Green         |                  |
# | Standard user (ssh)       |          |  Blue          |                  |
# | Root user (local/ssh)     |          |  Red           |                  |
# | Local Machine             |          |                |  Green           |
# | Bare-Metal Machine (ssh)  |          |                |  Purple          |
# | Virtual Machine (ssh)     |          |                |  Blue            |
# | Container (ssh)           |          |                |  Orange          |
# |                           |          |                |                  |
# +---------------------------+----------+----------------+------------------+

GREEN="\[\033[1;32m\]"
RED="\[\033[38;5;160m\]"
PURPLE="\[\033[38;5;164m\]"
BLUE="\[\033[38;5;45m\]"
DARK_BLUE="\[\033[01;34m\]"
ORANGE="\[\033[38;5;208m\]"
YELLOW="\[\033[38;5;226m\]"
RESET="\[\033[00m\]"

if [[ "$color_prompt" = yes ]]; then
    # If SSH'd In
    if [[ -n $SSH_CLIENT ]]; then
        USER_COLOR="$BLUE"

        # VirtualMachine
        if [[ $(cat /proc/cpuinfo | grep hypervisor) ]]; then
            HOSTNAME_COLOR="$BLUE"

        # Container
        elif [[ $(grep 'container' /proc/1/cgroup) ]]; then
            HOSTNAME_COLOR="$ORANGE"

        # Bare-Metal Machine
        else
            HOSTNAME_COLOR="$PURPLE"
        fi

    # If on a local machine
    else
        USER_COLOR="$GREEN"
        HOSTNAME_COLOR="$GREEN"
    fi

    # If Root, use a red username
    if [[ $EUID -eq 0 ]]; then
        USER_COLOR="$RED"
    fi

    PS1="${YELLOW}${debian_chroot:+($debian_chroot)}${USER_COLOR}\u@${HOSTNAME_COLOR}\h${RESET}:${DARK_BLUE}\w${RESET}\$ "

# Not a color prompt
else
    PS1="${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "
fi

unset color_prompt force_color_prompt  GREEN RED PURPLE BLUE DARK_BLUE ORANGE YELLOW RESET USER_COLOR HOSTNAME_COLOR


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

else
    export CLICOLOR=YES
    export LSCOLORS="ExGxxxxxCxxxxxabagecec"
    alias ls='ls -G'
fi

# Run Tmux upon a bash shell automatically
# If not running interactively, do not do anything
#[[ $- != *i* ]] && return
#[[ -z "$TMUX" ]] && exec tmux
# TMUX
#if [[ -z "$TMUX" ]] ;then
    #ID="$( tmux ls | grep -vm1 attached | cut -d: -f1 )" # get the id of a deattached session
    #if [[ -z "$ID" ]] ;then # if not available create a new one
        #tmux new-session
    #else
        #tmux attach-session -t "$ID" # if available attach to it
    #fi
#fi

#trap '' 2
#if [[ -z "$TMUX" ]]; then
#    SESSIONS="$(tmux ls | cut -d ':' -f 1)"
#    echo $SESSIONS
#    if [[ -z "$SESSIONS" ]]; then
#        TMUXCOMMAND="tmux"
#    else
#        echo "Which session would you like to attach to? (Enter a new name, or press enter for a new session)"
#        read -r ID
#        if [[ -z "$ID" ]]; then
#            #exec tmux
#            TMUXCOMMAND="tmux"
#        elif ! [[ "$SESSIONS" == *"$ID"* ]]; then
#            #exec tmux new-session -s "$ID"
#            tmux new-session -s "$ID"
#            TMUXCOMMAND="tmux new-session -s $ID"
#        else
#            #exec tmux attach-session -t "$ID"
#            TMUXCOMMAND="tmux attach-session -t $ID"
#        fi
#    fi
#    exec $TMUXCOMMAND
#fi
#trap 2


function get-logging-status() {
    log_status="$(tmux show-option -gqv @$(tmux display-message -p '#{session_name}_#{window_index}_#{pane_index}'))"
    if [[ -z $log_status ]]; then
        echo 'Not Logging'
    else
        echo $log_status
    fi
}

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'


# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.aliases ]; then
    . ~/.aliases
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


##########     User Changes       ##########
GPG_TTY=`tty`
export GPG_TTY


##########     User Functions     ##########
# Set title function: sets the tab title in GNOME Terminal
    #Useage: set-title <new-tab-title>
function set-title() {
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  TITLE="\[\e]2;$*\a\]"
  PS1=${ORIG}${TITLE}
}

function iterm-title() {
    echo -ne "\033]0;"$*"\007"
}

# Teamocil autocompletion
complete -W "$(teamocil --list)" teamocil


# Failsafe for moving files (prevent accidental overwritting)
alias mv="mv -i"

complete -C /usr/bin/terraform terraform
