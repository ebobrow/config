augroup LuaHighlight
  au!
  au TextYankPost * lua vim.hl.on_yank { timeout = 40 }
augroup END
