com! W w
nnoremap <leader>n :nohl<CR>
inoremap jk <Esc>
noremap <C-c> <Esc>
nnoremap <leader><CR> :so ~/.config/nvim/init.vim<CR>

nnoremap <silent><leader>j :wincmd j<CR>
nnoremap <silent><leader>k :wincmd k<CR>
nnoremap <silent><leader>l :wincmd l<CR>
nnoremap <silent><leader>h :wincmd h<CR>
nnoremap <silent><leader>J :wincmd J<CR>
nnoremap <silent><leader>K :wincmd K<CR>
nnoremap <silent><leader>L :wincmd L<CR>
nnoremap <silent><leader>H :wincmd H<CR>

nnoremap <C-j> <cmd>:cnext<CR>
nnoremap <C-k> <cmd>:cprev<CR>
nnoremap <C-l> <cmd>:cafter<CR>
nnoremap <C-h> <cmd>:cbefore<CR>
nnoremap <C-q> :call ToggleQFList()<CR>
let g:qf_open = 0

fun! ToggleQFList()
    if g:qf_open == 1
        let g:qf_open = 0
        cclose
    else
        let g:qf_open = 1
        copen
    end
endfun

nnoremap ]b :bn<CR>
nnoremap [b :bp<CR>

nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+gp
vnoremap <leader>p "+gp
nnoremap <leader>Y gg"+yG<C-o>
vnoremap <leader>P "_dP

nnoremap <leader>d "_d
vnoremap <leader>d "_d

nnoremap <silent><C-z> :ToggleTerminal<CR>
tnoremap <silent> <C-z> <C-\><C-n>:ToggleTerminal<Enter>
tnoremap <C-^> <C-\><C-n><C-^>

nnoremap S :%s//g<Left><Left>
vnoremap S :s//g<Left><Left>

nnoremap Y y$

nnoremap ]t :Ggrep TODO<CR>
