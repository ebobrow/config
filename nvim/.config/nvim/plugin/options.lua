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
opt.scl = "yes"
opt.inccommand = "split"
opt.title = true
opt.autowriteall = true
opt.showmode = false
opt.list = true
opt.listchars = {
  tab = "» ",
  trail = "·",
}

function GitStatus()
  local status = vim.fn.eval("get(b:, 'gitsigns_head')")
  if status == 0 then
      return ""
  end

  local git_icon = require("nvim-web-devicons").get_icon(".gitattributes")
  return git_icon .. " " .. status
end

function FileIcon()
  local bufname = vim.api.nvim_buf_get_name(0)
  local extension = vim.fn.fnamemodify(bufname, ":e")

  return require("nvim-web-devicons").get_icon(bufname.name, extension, { default = true })
end

opt.statusline = "%{luaeval('GitStatus()')}"
              .. "%="
              .. "%{luaeval('FileIcon()')} %f %m%r"
              .. "%="
              .. "%l:%c [%p%%]%y"

opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.cursorline = true
