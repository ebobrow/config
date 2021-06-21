" fzf
nnoremap <silent> <leader>f :GFiles<CR>
nnoremap <silent> <leader>b :Buffers<CR>
nnoremap <silent> <leader>. :Files<CR>
let g:fzf_commits_log_options = '--graph --color=always
  \ --format="%C(yellow)%h%C(red)%d%C(reset)
  \ - %C(bold green)(%ar)%C(reset) %s %C(blue)<%an>%C(reset)"'

nnoremap <silent> <leader>gh  :Commits<CR>
nnoremap <silent> <leader>gbh :BCommits<CR>
nnoremap <silent> <leader>rg :Rg<CR>
let g:fzf_colors = {'bg+': ['Normal']}
