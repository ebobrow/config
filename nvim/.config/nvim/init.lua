--[[
Hop to files:
~/dots/nvim/.config/nvim/plugin/options.lua
~/dots/nvim/.config/nvim/plugin/keybinds.vim
~/dots/nvim/.config/nvim/lua/elliot/packer.lua
~/dots/nvim/.config/nvim/lua/elliot/lsp.lua
~/dots/nvim/.config/nvim/lua/elliot/telescope/init.lua
--]] --
vim.g.mapleader = " "

-- Force loading of astronauta first.
vim.cmd [[runtime plugin/astronauta.vim]]

require "elliot.lsp"
