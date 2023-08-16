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

au BufRead,BufNewFile *.agda call AgdaFiletype()
function! AgdaFiletype()
    nnoremap <buffer> <leader>cl :CornelisLoad<CR>
    nnoremap <buffer> <leader>cr :CornelisRefine<CR>
    nnoremap <buffer> <leader>cd :CornelisMakeCase<CR>
    nnoremap <buffer> <leader>, :CornelisTypeContext<CR>
    nnoremap <buffer> <leader>. :CornelisTypeContextInfer<CR>
    " nnoremap <buffer> <leader>cn :CornelisSolve<CR>
    " nnoremap <buffer> <leader>ca :CornelisAuto<CR>
    nnoremap <buffer> gd        :CornelisGoToDefinition<CR>
    nnoremap <buffer> <C-A>     :CornelisInc<CR>
    nnoremap <buffer> <C-X>     :CornelisDec<CR>
    nnoremap <buffer> <leader>cg :CornelisGive<CR>
    nnoremap <buffer> <leader>ct :CornelisTypeInfer<CR>
    nnoremap <buffer> <leader>cn :CornelisNormalize<CR>
endfunction
