local map_tele = function(key, f)
  local map_key = vim.api.nvim_replace_termcodes(key .. f, true, true, true)

  local mode = "n"
  local rhs = string.format("<cmd>lua require('elliot.telescope')['%s']{}<CR>", f, map_key)

  local map_options = {
    noremap = true,
    silent = true,
  }

  vim.api.nvim_set_keymap(mode, key, rhs, map_options)
end

map_tele('<leader>f', 'files')
map_tele('<leader>b', 'buffers')
map_tele('<leader>rg', 'live_grep')
map_tele('<leader>rp', 'grep_prompt')

map_tele('<leader>xx', 'quickfix')
map_tele('<leader>xd', 'lsp_document_diagnostics')
map_tele('<leader>xw', 'lsp_workspace_diagnostics')
map_tele("<leader>ca", "lsp_code_actions")

map_tele('<leader>gc', 'git_commits')
map_tele('<leader>gg', 'git_status')

map_tele('<leader>T', 'builtin')

return map_tele
