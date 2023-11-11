function! ZathuraOpenPdf()
  execute "silent !zathura '" . expand("%:p:r") . ".pdf' &"
endfunction

nnoremap <A-p> :call ZathuraOpenPdf()<CR>

" autocmd BufWritePost * silent! !latexmk -pdf %
