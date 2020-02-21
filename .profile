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

# If @Work, source some secret work related stuff
WORK="${HOME}/.work"
if [ -f "${WORK}" ]; then
    source "${WORK}"
fi
unset WORK

# Source "local" secrets or stuff thats not generic
LOCAL="${HOME}/.localz"
if [ -f "${LOCAL}" ]; then
    source "${LOCAL}"
fi
unset LOCAL

# Create dir and cd in to it
cdm() {
    mkdir -p ${1}
    cd ${1}
}

# View files in an SVN repo without the SVN crap files.
sfind() {
    if [ -z ${1} ]; then
       path="."
    else
        path=$(echo ${1} |sed 's#/$##')
    fi
    find ${path} -path '*/.svn*' -prune -o -print
}
# View files in an GIT repo without the GIT crap files.
gfind() {
    if [ -z ${1} ]; then
       path="."
    else
        path=$(echo ${1} |sed 's#/$##')
    fi
    find ${path} -path '*/.git*' -prune -o -print
}
