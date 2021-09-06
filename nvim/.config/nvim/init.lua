vim.g.mapleader = " "

-- Force loading of astronauta first.
vim.cmd [[runtime plugin/astronauta.vim]]

require "elliot.lsp"
