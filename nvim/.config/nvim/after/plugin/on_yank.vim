augroup LuaHighlight
  au!
  au TextYankPost * lua vim.highlight.on_yank { timeout = 40 }
augroup END
