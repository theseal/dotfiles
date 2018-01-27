" I like a bit longer command history then the default 20.
set history=1000

" I work most often with terminals using dark backgrounds.
set background=dark

" It's easier to work with code and config if syntax is highlighted.
syntax on

" Make it easier to follow brackets when coding. Will quickly show the starting
" bracket when closing a section set showmatch
set showmatch

" When there is a previous search pattern, highlight all its matches.
set hlsearch

" Show more then default "eol:$" in the list view.
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

" Always show the status-line
set laststatus=2

" Influence how Vim formats text, extend the default "tcq".
" t    Auto-wrap text using textwidth
" c    Auto-wrap comments using textwidth, inserting the current comment
" q    Allow formatting of comments with "gq".
" r    Automatically insert the current comment leader after hitting
"      <Enter> in Insert mode.
" n    When formatting text, recognize numbered lists.
set formatoptions=tcrqn

" Copy indent from current line when starting a new line.
set autoindent

" Do smart autoindenting when starting a new line.
set smartindent

" Four spaces looks nice when coding.
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
au FileType mail set textwidth=72

" Highlight whitespace(s) at the end of line.
autocmd VimEnter * :call matchadd('Error', '\s\+$', -1) | call matchadd('Error', '\%u00A0')
