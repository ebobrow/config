function! ZathuraOpenPdf()
  execute "silent !zathura '" . expand("%:p:r") . ".pdf' &"
endfunction

nnoremap <A-p> :call ZathuraOpenPdf()<CR>
" nnoremap <A-p> :TexlabForward<CR>

set wrap

autocmd BufWritePost * silent! !latexmk -pdf %
" autocmd BufWritePost * :TexlabForward

set tw=80
