# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
    ;;
*)
    ;;
esac

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval `dircolors -b`
    alias ls='ls --color=auto'
fi

# some more ls aliases
alias l='ls -l'
alias la='ls -la'

# admin aliases
alias tf='tail -f /var/log/allmessages'
alias v='chcontext --ctx 1'

HISTSIZE=999999
HISTFILESIZE=$HISTSIZE
HISTCONTROL=erasedups
CDPATH=.:/var/lib/vservers/
export MANWIDTH=80

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found ]; then
	function command_not_found_handle {
		# check because c-n-f could've been removed in the meantime
		if [ -x /usr/lib/command-not-found ]; then
			/usr/bin/python /usr/lib/command-not-found -- $1
			return $?
		else
			return 127
		fi
	}
fi

# basic command wrapper
# convert "sudo su" into "sudo su -"
function sudo() {
  if [[ $@ == "su" ]] ; then
    command sudo su -
  else
    command sudo "$@"
  fi
}

export GEM_HOME=$HOME/.gems

# allow local modifications
if [ -f /etc/bash.bashrc.local ]; then
    . /etc/bash.bashrc.local
fi
