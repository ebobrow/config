return {
  -- { "tpope/vim-fugitive", cmd = "G" },
  { "tpope/vim-commentary" }, { "tpope/vim-surround" }, { "tpope/vim-repeat" },
  {
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
}, {
  "kdheepak/lazygit.nvim",
  lazy = true,
  cmd = {
    "LazyGit", "LazyGitConfig", "LazyGitCurrentFile", "LazyGitFilter",
    "LazyGitFilterCurrentFile"
  },
  -- optional for floating window border decoration
  dependencies = { "nvim-lua/plenary.nvim" },
  -- setting the keybinding for LazyGit with 'keys' is recommended in
  -- order to load the plugin when the command is run for the first time
  keys = { { "<leader>gl", "<cmd>LazyGit<cr>", desc = "LazyGit" } }
},   -- { "chrisbra/unicode.vim" }
  { "joom/latex-unicoder.vim" }
}
