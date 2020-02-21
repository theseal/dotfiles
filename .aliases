# View files in an SVN repo without the SVN crap files.
sfind() {
    if [ -z ${1} ]; then
       dir="."
    else
        dir=$(echo ${1} |sed 's#/$##')
    fi
    find ${dir} -path '*/.svn*' -prune -o -print
}
# View files in an GIT repo without the GIT crap files.
gfind() {
    if [ -z ${1} ]; then
       dir="."
    else
        dir=$(echo ${1} |sed 's#/$##')
    fi
    find ${dir} -path '*/.git*' -prune -o -print
}

if [ -f ~/.workz ]; then
    source ~/.workz
fi
