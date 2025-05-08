return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup { underline = false, transparent_mode = true }
      vim.cmd.colorscheme "gruvbox"
      vim.cmd [[set background=dark]]

      vim.cmd [[hi clear LspReferenceText]]
      vim.cmd [[hi link LspReferenceText LspReferenceTarget]]
      vim.cmd [[hi clear LspReferenceRead]]
      vim.cmd [[hi link LspReferenceRead LspReferenceTarget]]
      vim.cmd [[hi clear LspReferenceWrite]]
      vim.cmd [[hi link LspReferenceWrite LspReferenceTarget]]

      vim.cmd [[hi NormalFloat guifg=#ebdbb2 guibg=#3c3836]]
    end
  }
}
