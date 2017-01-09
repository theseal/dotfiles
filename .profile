#!/bin/bash

# A long path is a good path.
export PATH=/usr/local/sbin:/usr/local/bin:/usr/lib/rancid/bin:$PATH

# Always use vim!
export EDITOR=vim
export VISUAL=vim

# I like a long history without dupes
export HISTSIZE=
export HISTFILESIZE=
export HISTCONTROL=ignoredups

# UTF8 is nice to have.
export LC_ALL=en_US.UTF-8

# If @Work, source some secret work related stuff
WORK="${HOME}/.work"
if [ -f "${WORK}" ]; then
    source "${WORK}"
fi
unset WORK

# Source "local" secrets or stuff thats not generic
LOCAL="${HOME}/.local"
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
    find . -path '*/.svn*' -prune -o -print
}
# View files in an GIT repo without the GIT crap files.
gfind() {
    find . -path '*/.git*' -prune -o -print
}

tunnel() {
    sudo networksetup -setsocksfirewallproxy "Wi-Fi" localhost 7777
    ssh -D 7777 ${1}
    sudo networksetup -setsocksfirewallproxystate "Wi-Fi" off
}
login() {
    kinit
    kinit "$(whoami)/root"
}
