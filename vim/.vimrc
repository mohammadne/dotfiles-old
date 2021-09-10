" Turn on syntax highlighting
syntax on

set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgray

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'

call plug#end()

colorscheme gruvbox
set background=dark


