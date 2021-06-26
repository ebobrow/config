call plug#begin('~/.vim/plugged')
    "" LSP
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'glepnir/lspsaga.nvim'
    Plug 'nvim-lua/lsp_extensions.nvim'

    "" Telescope
    Plug 'tpope/vim-fugitive'
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    "" statusline
    Plug 'glepnir/galaxyline.nvim' , { 'branch': 'main' }
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'mkitt/tabline.vim'

    "" Misc
    Plug 'gruvbox-community/gruvbox'
    Plug 'tpope/vim-commentary'
    Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
    Plug 'lewis6991/gitsigns.nvim'
    Plug 'AndrewRadev/splitjoin.vim'
    Plug 'caenrique/nvim-toggle-terminal'
call plug#end()

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
syntax enable

autocmd BufWritePost ~/.Xresources !xrdb %
autocmd BufWritePost ~/st/* !sudo make install
autocmd BufWritePost ~/dmenu/* !sudo make install

" Disable autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', enabled = {"ChainingHint", "ParameterHint", "TypeHint"} }

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
augroup END

luafile $HOME/.config/nvim/plugins/gitsigns.lua
luafile $HOME/.config/nvim/plugins/galaxyline.lua
source $HOME/.config/nvim/plugins/lsp.vim
source $HOME/.config/nvim/plugins/telescope.vim

source $HOME/.config/nvim/colors.vim
source $HOME/.config/nvim/keybinds.vim
