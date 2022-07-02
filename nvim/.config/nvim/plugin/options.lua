local opt = vim.opt

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
opt.showmode = false
opt.list = true
opt.listchars = { tab = "» ", trail = "·" }
opt.updatetime = 100

opt.statusline = " %f %m%r" .. "%=" .. "%l:%c [%p%%]%y"

opt.grepprg = "grep -n -r"

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.cursorline = true
-- opt.clipboard = "unnamedplus"

opt.formatoptions:append("cqnj")
opt.formatoptions:remove("ator2")
