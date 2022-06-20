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

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.cursorline = true
-- opt.clipboard = "unnamedplus"

-- TODO: Why doesn't this work?
-- opt.formatoptions = opt.formatoptions - "a" -- Auto formatting is BAD.
-- - "t" -- Don't auto format my code. I got linters for that.
-- + "c" -- In general, I like it when comments respect textwidth
-- + "q" -- Allow formatting comments w/ gq
-- - "o" -- O and o, don't continue comments
-- - "r" -- But do continue when pressing enter.
-- + "n" -- Indent past the formatlistpat, not underneath it.
-- + "j" -- Auto-remove comments if possible.
-- - "2" -- I'm not in gradeschool anymore
opt.formatoptions:append("cqnj")
opt.formatoptions:remove("ator2")
