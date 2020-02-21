#!/usr/bin/env bash


# Load Debian default stuff. Makes terminal colorful.
if [ -f "/etc/skel/.profile" ]; then
    . /etc/skel/.profile
fi

if [ "$(uname)" == "Darwin" ];then
    bind '"\e\e[D": backward-word'
    bind '"\e\e[C": forward-word'
    [ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
fi

if [ -f /etc/bash_completion ]; then
 . /etc/bash_completion
fi

# A long path is a good path.
export PATH=/usr/local/sbin:/usr/local/bin:/usr/lib/rancid/bin:$PATH

# Always use vim!
export EDITOR=vim
export VISUAL=vim

# I like a long history without dupes
export HISTSIZE=
export HISTFILESIZE=
export HISTCONTROL=ignoredups
export HISTTIMEFORMAT="%s "

dbhist_file=/usr/local/lib/dbhist.sh
if [ -f ${dbhist_file} ]; then
    source /usr/local/lib/dbhist.sh
fi

# UTF8 is nice to have.
export LC_ALL=en_GB.UTF-8

if [ -f ~/.aliases ]; then
    source ~/.aliases
fi
