filetype plugin indent on
syntax on

autocmd BufWritePost .Xresources !xrdb %
autocmd BufWritePost ~/suckless/* !sudo make install
autocmd BufWritePost packer.lua source <afile> | PackerCompile
autocmd BufNewFile,BufRead  ~/repos/rust-clippy/*.fixed setfiletype rust

" Disable autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:tex_flavor = "latex"

autocmd BufEnter ~/exercism/*.md setlocal wrap
autocmd BufEnter *.c nnoremap <silent> <leader><leader>h :exe "e " .. expand('%:r') .. ".h"<CR>
autocmd BufEnter *.h nnoremap <silent> <leader><leader>c :exe "e " .. expand('%:r') .. ".c"<CR>
