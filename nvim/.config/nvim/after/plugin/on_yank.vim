augroup LuaHighlight
  au!
  au TextYankPost * lua vim.highlight.on_yank { timeout = 200 }
augroup END
