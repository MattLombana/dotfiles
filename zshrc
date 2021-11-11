# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="gentoo"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    brew
    copyfile
    docker
    extract
    macos
    pip
    python
    tmux
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

HISTFILE=~/.zsh_history         # where to store zsh config
HISTSIZE=1024                   # big history
SAVEHIST=1024                   # big history
setopt append_history           # append
setopt hist_ignore_all_dups     # no duplicate
unsetopt hist_ignore_space      # ignore space prefixed commands
setopt hist_reduce_blanks       # trim blanks
setopt extended_history
# setopt hist_verify              # show before executing history commands
# setopt inc_append_history       # add commands as they are typed, don't wait until shell exit
setopt share_history            # share hist between sessions
setopt bang_hist                # !keyword





# Save the date and time
HISTTIMEFORMAT='%F %T | '

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"


# Define Prompt command and run it
precmd() { eval "$PROMPT_COMMAND" }


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

GREEN="%{$fg_bold[green]%}"
YELLOW="%{$fg_bold[yellow]%}"
RESET="%{$reset_color%}"
RED="%{$fg_bold[red]%}"
DARK_BLUE="%{$fg_bold[blue]%}"
PURPLE="%F{164}"
LIGHT_BLUE="%F{045}"
ORANGE="%F{208}"



if [[ "$color_prompt" = yes ]]; then
    # If SSH'd In
    if [[ -n $SSH_CLIENT ]]; then
        USER_COLOR="$LIGHT_BLUE"

        # VirtualMachine
        if [[ $(cat /proc/cpuinfo | grep hypervisor) ]]; then
            HOSTNAME_COLOR="$LIGHT_BLUE"

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

    PROMPT="${YELLOW}${debian_chroot:+($debian_chroot)}${USER_COLOR}%n@${HOSTNAME_COLOR}%m${RESET}:${DARK_BLUE}%~${RESET}%f%(!.#.$) "

# Not a color prompt
else
	PROMPT="${debian_chroot:+($debian_chroot)}\u@\h:\w\$ "
fi

unset color_prompt force_color_prompt  GREEN RED PURPLE BLUE DARK_BLUE ORANGE YELLOW RESET USER_COLOR HOSTNAME_COLOR


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

# Run Tmux upon a shell automatically
trap '' 2
if [[ -z "$TMUX" ]]; then
    SESSIONS="$(tmux ls | cut -d ':' -f 1)"
    echo $SESSIONS
    if [[ -z "$SESSIONS" ]]; then
        tmux
        echo '1'
    else
        echo "Which session would you like to attach to? (Enter a new name, or press enter for a new session, or 'exit' to exit)"
        read -r ID
        if [[ -z "$ID" ]]; then
            tmux
        elif [[ "exit" == *"$ID"* ]]; then
            trap 2
            exit
        elif ! [[ "$SESSIONS" == *"$ID"* ]]; then
            tmux new-session -s "$ID"
        else
            tmux attach-session -t "$ID"
        fi
    fi
fi
trap 2


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
# See /usr/share/doc/bash-doc/examples in the bash-doc package.
if [ -f ~/.aliases ]; then
    . ~/.aliases
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

function docker-remove-exited() {
    docker rm $(docker ps -a -f status=exited -q)
}

# Teamocil autocompletion
compctl -g '~/.teamocil/*(:t:r)' teamocil


# Failsafe for moving files (prevent accidental overwritting)
alias mv="mv -i"

# Ubuntu function for creating a quick Ubuntu container
ubuntu() {
    docker run --rm -it -v "$(pwd):/host" -w /host ubuntu:latest /bin/bash
}


python2-docker() {
    docker run --rm -it -v "$(pwd):/host" -w /host python:2 /bin/bash
}

python3-docker() {
    docker run --rm -it -v "$(pwd):/host" -w /host python:3 /bin/bash
}

docker-pwd() {
    docker run --rm -it -v "$(pwd):/host" -w /host "$@"
}

msfvenom() {
    docker run --rm -it -v "${PWD}:/data" metasploitframework/metasploit-framework ./msfvenom "$@"
}

msfconsole() {
    docker run --rm -it -v "${PWD}:/data" metasploitframework/metasploit-framework ./msfconsole
}

realpath() {
    OURPWD=$PWD
    cd "$(dirname "$1")"
    LINK=$(readlink "(basename "$1")")
    while [ "$LINK" ]; do
        cd "$(dirname "$LINK")"
        LINK=$(readlink "(basename "$1")")
    done
    REALPATH="$PWD/$(basename "$1")"
    cd "$OURPWD"
    echo "$REALPATH"
}

#Pretty print csv output
#example: cat outputs.csv | csv
alias csv="sed 's/,/ ,/g' | column -t -s,"


watch=all                       # watch all logins
logcheck=30                     # every 30 seconds
WATCHFMT="%n from %M has %a tty%l at %T %W"


setopt auto_remove_slash        # self explicit
setopt chase_links              # resolve symlinks
setopt correct                  # try to correct spelling of commands
setopt extended_glob            # activate complex pattern globbing
setopt glob_dots                # include dotfiles in globbing
setopt print_exit_value         # print return value if non-zero
unsetopt beep                   # no bell on error
unsetopt bg_nice                # no lower priority for background jobs
    # unsetopt clobber                # must use >| to truncate existing files (wont let `>` overwrite)
unsetopt hist_beep              # no bell on error in history
unsetopt hup                    # no hup signal at shell exit
unsetopt list_beep              # no bell on ambiguous completion
unsetopt rm_star_silent         # ask for confirmation for `rm *' or `rm path/*'


bindkey \^U backward-kill-line  # Stop deleting the whole line with Ctrl-U


# ZSH Tmux plugin settings
ZSH_TMUX_AUTOCONNECT=false
DISABLE_AUTO_TITLE=true
