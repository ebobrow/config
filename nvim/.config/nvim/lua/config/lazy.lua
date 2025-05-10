-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath
  })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" }, { out, "WarningMsg" },
      { "\nPress any key to exit..." }
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

local opt = vim.opt

opt.guicursor = "a:block"
opt.mouse = ""

opt.number = true
opt.relativenumber = true

opt.encoding = "UTF-8"
opt.fileencoding = "UTF-8"
opt.fileencodings = "UTF-8"
opt.belloff = "all"
opt.swapfile = false
opt.backup = false
opt.undodir = "/home/elliotbobrow/.local/share/nvim/undodir"
opt.undofile = true
opt.splitbelow = true
opt.splitright = true
opt.ignorecase = true
opt.smartcase = true
opt.scl = "yes"
opt.inccommand = "split"
opt.title = true
opt.autowriteall = true
opt.showmode = true
opt.list = true
opt.listchars = { tab = "» ", trail = "·" }
opt.updatetime = 100

opt.statusline = " %f %m%r" .. "%=" .. "%l:%c [%p%%]%y"

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
-- opt.smartindent = true
opt.wrap = false
opt.cursorline = true

opt.formatoptions:append("cqnj")
opt.formatoptions:remove("ator2")

-- Setup lazy.nvim
require("lazy").setup({
  spec = { { import = "plugins" } },
  -- automatically check for plugin updates
  checker = { enabled = false }
})
