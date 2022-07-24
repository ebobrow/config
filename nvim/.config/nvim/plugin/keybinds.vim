com! W w
com! WW noa w
nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()
inoremap jk <Esc>
noremap <C-c> <Esc>

" Mouse is good for resizing splits, but nothing else
nnoremap <leader>M :call ToggleMouse()<CR>
fun! ToggleMouse()
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
endfunction

nnoremap <silent> <leader>j :wincmd j<CR>
nnoremap <silent> <leader>k :wincmd k<CR>
nnoremap <silent> <leader>l :wincmd l<CR>
nnoremap <silent> <leader>h :wincmd h<CR>
nnoremap <silent> <leader>J :wincmd J<CR>
nnoremap <silent> <leader>K :wincmd K<CR>
nnoremap <silent> <leader>L :wincmd L<CR>
nnoremap <silent> <leader>H :wincmd H<CR>

nnoremap <silent> <C-j> <cmd>:cnext<CR>
nnoremap <silent> <C-k> <cmd>:cprev<CR>
nnoremap <silent> <C-h> :tabp<CR>
nnoremap <silent> <C-l> :tabn<CR>
nnoremap <silent> <C-q> :call ToggleQuickfixList()<CR>

fun! GetBufferList()
    redir =>buflist
    silent! ls
    redir END
    return buflist
endfunction

fun! ToggleQuickfixList()
    for bufnum in map(filter(split(GetBufferList(), '\n'), 'v:val =~ "Quickfix List"'), 'str2nr(matchstr(v:val, "\\d\\+"))') 
        if bufwinnr(bufnum) != -1
            cclose
            return
        endif
    endfor
    let winnr = winnr()
    copen
    if winnr() != winnr
        wincmd p
    endif
endfunction

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+gp
vnoremap <leader>p "+gp
nnoremap <leader>Y gg"+yG<C-o>
vnoremap <leader>P "_dP

nnoremap <leader>d "_d
vnoremap <leader>d "_d

nnoremap Y y$

imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
