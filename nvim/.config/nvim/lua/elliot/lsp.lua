local inoremap = vim.keymap.inoremap
local nnoremap = vim.keymap.nnoremap
local telescope_mapper = require "elliot.telescope.mappings"

local buf_nnoremap = function(opts)
  opts.buffer = 0
  nnoremap(opts)
end

local buf_inoremap = function(opts)
  opts.buffer = 0
  inoremap(opts)
end

local on_attach = function()
  buf_inoremap { "<c-s>", vim.lsp.buf.signature_help }

  buf_nnoremap { "gd", vim.lsp.buf.definition }
  buf_nnoremap { "gD", require'lspsaga.provider'.preview_definition }
  buf_nnoremap { "gr", vim.lsp.buf.references }

  buf_nnoremap { "<space>rr", "LspRestart" }

  buf_nnoremap { "K", require'lspsaga.hover'.render_hover_doc }
  buf_nnoremap {
    "<C-d>", function() require'lspsaga.action'.smart_scroll_with_saga(1) end
  }
  buf_nnoremap {
    "<C-u>", function() require'lspsaga.action'.smart_scroll_with_saga(-1) end
  }

  buf_nnoremap { "]d", require'lspsaga.diagnostic'.lsp_jump_diagnostic_next }
  buf_nnoremap { "[d", require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev }
  buf_nnoremap { "<leader>cd", require'lspsaga.diagnostic'.show_line_diagnostics }

  -- TODO: These don't work
  -- telescope_mapper("<leader>ca", "lsp_code_actions")
  -- telescope_mapper("<leader>gr", "lsp_references")
  -- telescope_mapper('<leader>xd', 'lsp_document_diagnostics')
  -- telescope_mapper('<leader>xw', 'lsp_workspace_diagnostics')

  buf_nnoremap { "<leader>F", vim.lsp.buf.formatting }

  vim.cmd [[nnoremap <silent> gR "+yiw:Lspsaga rename<CR><C-r>+]]

  vim.cmd [[
      augroup lsp_buf_format
          au! BufWritePre <buffer>
          autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()
      augroup END
  ]]
end

local nvim_lsp = require 'lspconfig'

nvim_lsp.tsserver.setup { on_attach = on_attach }
nvim_lsp.rust_analyzer.setup { on_attach = on_attach }
nvim_lsp.vimls.setup { on_attach = on_attach }
nvim_lsp.hls.setup {
  root_dir = nvim_lsp.util.root_pattern("*.cabal", "stack.yaml",
                                        "cabal.project", "package.yaml",
                                        "hie.yaml", ".git"),
  on_attach = on_attach
}
nvim_lsp.sumneko_lua.setup {
  cmd = {
    "/home/elliotbobrow/lua-language-server/bin/Linux/lua-language-server",
    "-E", "/home/elliotbobrow/lua-language-server/main.lua"
  },
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT', path = vim.split(package.path, ';') },
      diagnostics = { globals = { 'vim' } },
      workspace = {
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
        }
      },
      telemetry = { enable = false }
    }
  },
  on_attach = on_attach
}
require"lspconfig".efm.setup {
  init_options = { documentFormatting = true },
  cmd = { "/home/elliotbobrow/go/bin/efm-langserver" },
  filetypes = { "lua" },
  settings = {
    rootMarkers = { ".git/" },
    languages = {
      lua = {
        {
          formatCommand = "lua-format -i --spaces-inside-table-braces --indent-width=2",
          formatStdin = true
        }
      }
    }
  }
}

return on_attach
