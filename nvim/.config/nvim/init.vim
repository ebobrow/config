let mapleader = " "

set number relativenumber
set encoding=UTF-8
set fileencoding=UTF-8
set fileencodings=UTF-8
set noerrorbells
set noswapfile
set nobackup
set undodir=~/.local/share/nvim/undodir
set undofile
set splitbelow splitright
set ignorecase
set scl=yes
set inccommand=split
set title
set autowriteall
set noshowmode
set list
set listchars+=trail:·
set shortmess+=c

set statusline=%y%=%f\ %m%r%=%l:%c\ [%p%%]

set path+=**

set wildignore+=**/node_modules/*
set wildignore+=**/.git/*
set wildignore+=**/target/*

let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nowrap
set cursorline

filetype plugin indent on
syntax on

autocmd BufWritePost ~/.Xresources !xrdb %
autocmd BufWritePost ~/st/* !sudo make install
autocmd BufWritePost ~/dmenu/* !sudo make install
autocmd BufWritePost packer.lua source <afile> | PackerCompile

" Disable autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank {on_visual=false, timeout=200}
augroup END

luafile $HOME/.config/nvim/plug-config/packer.lua
source $HOME/.config/nvim/plug-config/lsp.vim

source $HOME/.config/nvim/keybinds.vim
