function! ZathuraOpenPdf()
  execute "silent !zathura '" . expand("%:p:r") . ".pdf' &"
endfunction

nnoremap <A-p> :call ZathuraOpenPdf()<CR>

set wrap

" autocmd BufWritePost * silent! !latexmk -pdf %

set tw=80
