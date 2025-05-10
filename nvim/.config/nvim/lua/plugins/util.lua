return {
  { "tpope/vim-fugitive" }, { "tpope/vim-commentary" },
  { "tpope/vim-surround" }, { "tpope/vim-repeat" }, {
  "whonore/Coqtail",
  ft = "coq",
  config = function()
    vim.cmd [[hi link coqProofDelim Identifier]]
    vim.g["coqtail_imap_prefix"] = "<C-c>"
  end
}, {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons', opt = true },
  opts = {
    sections = {
      lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } }
    },
    options = { theme = "gruvbox-material" }
  }
}
}
