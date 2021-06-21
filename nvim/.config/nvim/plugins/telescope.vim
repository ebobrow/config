nnoremap <leader>. <cmd>Telescope find_files<CR>
nnoremap <leader>f <cmd>Telescope git_files<CR>
nnoremap <leader>b <cmd>Telescope buffers<CR>
nnoremap <leader>rg <cmd>Telescope live_grep<CR>

" nnoremap <leader>ca <cmd>Telescope lsp_code_actions<CR>
nnoremap <leader>gr <cmd>Telescope lsp_references<CR>
" nnoremap <leader>gs <cmd>Telescope lsp_document_symbols<CR>
nnoremap <leader>xx <cmd>Telescope quickfix<cr>
nnoremap <leader>xd <cmd>Telescope lsp_document_diagnostics<CR>
nnoremap <leader>xw <cmd>Telescope lsp_workspace_diagnostics<CR>

nnoremap <leader>gc <cmd>Telescope git_commits<CR>
nnoremap <leader>gg <cmd>Telescope git_status<CR>

nnoremap <leader>T <cmd>Telescope builtin<CR>

cnoremap <C-r><C-r> :Telescope commands<CR> 
cnoremap <C-r><C-h> :Telescope command_history<CR> 

lua << EOF
local actions = require("telescope.actions")

require('telescope').setup{
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
            n = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
            },
        },
    }
}
EOF
