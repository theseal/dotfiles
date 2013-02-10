set nocompatible
filetype on
set history=1000

set background=dark
syntax on

set ruler
set number

set showmatch
set mat=5
set hlsearch
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

set novisualbell
set noerrorbells
set laststatus=2

set fo=tcrqn
set ai
set si
set cindent
set cinkeys=0{,0},0),:,!^F,o,O,e
set tabstop=8
set softtabstop=4
set shiftwidth=4
set expandtab

let perl_extended_vars=1 " highlight advanced perl vars inside strings

" SVN commit diff
autocmd BufReadPost svn-commit*.tmp :call Svn_diff()

function Svn_diff()
    silent exe "normal G"
    silent r!svn diff
    silent exe "1"
endfunction

au FileType mail set nocindent
