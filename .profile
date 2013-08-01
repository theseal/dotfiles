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
LOCAL="~/.local"
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

# Handle some diffrent package managers
update() {
    KERNEL=$(uname)
    if [[ "${KERNEL}" = "Darwin" ]]; then
        brew update
        OUTDATED=$(brew outdated)
        if [[ ! "${OUTDATED}x" = "x" ]]; then
            echo "==> Outdated"
            echo "${OUTDATED}"
        fi
    elif [[ "${KERNEL}" = "Linux" ]]; then
        ISSUE=$(cat /etc/issue)    
        if egrep -i 'debian|ubuntu' ${ISSUE}; then
            apt-get update
            apt-get -s upgrade
        elif egrep -i 'arch' ${ISSUE}; then
            pacman -Sy
            pacman -Qu
        fi
    fi
}
upgrade() {
    KERNEL=$(uname)
    if [[ "${KERNEL}" = "Darwin" ]]; then
        brew upgrade
    elif [[ "${KERNEL}" = "Linux" ]]; then
        ISSUE=$(cat /etc/issue)    
        if egrep -i 'debian|ubuntu' ${ISSUE}; then
            apt-get upgrade
        elif egrep -i 'arch' ${ISSUE}; then
            pacman -Syu
        fi
    fi
}

tunnel() {
  ssh -D 7777 ${1} 
}
login() {
kinit 
kinit "$(whoami)/root"
}
