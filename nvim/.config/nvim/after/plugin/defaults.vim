filetype plugin indent on
syntax on

autocmd BufWritePost .Xresources !xrdb %
autocmd BufWritePost ~/st/* !sudo make install
autocmd BufWritePost ~/dmenu/* !sudo make install
autocmd BufWritePost packer.lua source <afile> | PackerCompile

" Disable autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
