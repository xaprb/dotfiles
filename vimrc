" execute pathogen#infect()

" colorscheme solarized
set shiftwidth=3 tabstop=3 softtabstop=3 autoindent tw=80
set history=150
set hlsearch incsearch ruler showcmd modeline
set nocursorline
set modelines=5
:au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set formatoptions=tcqln
set rtp+=$GOROOT/misc/vim
filetype plugin indent on
filetype plugin on
syntax on

" check perl code with :make
autocmd FileType perl set makeprg=perl\ -cw\ %\ $*
autocmd FileType perl set errorformat=%m\ at\ %f\ line\ %l%.%#,%-G%.%#
autocmd FileTYpe perl set expandtab

" check Go code with :make
autocmd FileType go set makeprg=go\ build\ %:p:h\ $*
autocmd FileType go set errorformat=%f:%l:\ %m,%-G%.%#

" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
if exists("g:did_load_filetypes")
 filetype off
 filetype plugin indent off
endif
set runtimepath+=/usr/local/go/misc/vim
filetype plugin indent on
syntax on

" auto-format Go code
autocmd FileType go autocmd BufWritePre <buffer> Fmt

" set makeprg=perl\ -c\ %
" set errorformat=%m\ at\ %f\ line\ %l%.%#,%-G%.%#
:nmap ; :CtrlPBuffer<CR>

" use [s and ]s, and zg,z=,zw to navigate.
" :set spell
:set spelllang=en_us

" add "golint"
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
