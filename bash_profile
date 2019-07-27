# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs


# Path stuff
PATH=$PATH:$HOME/.local/bin:$HOME/bin:/usr/local/QEMU/Programs/

export PATH

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

source /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash
