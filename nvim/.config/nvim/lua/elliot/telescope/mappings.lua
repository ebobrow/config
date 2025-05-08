local map_tele = function(key, f)
  key = "<leader>" .. key
  local map_key = vim.api.nvim_replace_termcodes(key .. f, true, true, true)

  local mode = "n"
  local rhs = string.format("<cmd>lua require('elliot.telescope')['%s']{}<CR>",
                            f, map_key)

  local map_options = { noremap = true, silent = true }

  vim.api.nvim_set_keymap(mode, key, rhs, map_options)
end

map_tele('f', 'files')
map_tele('b', 'buffers')
map_tele('rg', 'live_grep')

map_tele('xx', 'quickfix')
map_tele('xd', 'diagnostics')

map_tele('gc', 'git_commits')
map_tele('gg', 'git_status')

-- map_tele('r', 'lsp_references')

map_tele('T', 'builtin')

return map_tele
