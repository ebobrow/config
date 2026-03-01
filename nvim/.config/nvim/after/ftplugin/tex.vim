function! ZathuraOpenPdf()
  execute "silent !zathura '" . expand("%:p:r") . ".pdf' &"
endfunction

nnoremap <A-p> :call ZathuraOpenPdf()<CR>
" nnoremap <A-p> :TexlabForward<CR>

set wrap
set linebreak

augroup LatexMk
    au!
    autocmd BufWritePost ~/hmc/* silent! !latexmk -pdf %
    " autocmd BufWritePost * :TexlabForward
    " au! * ~/repos/EPFL/ga-work/*
augroup END

set tw=80
