local inoremap = vim.keymap.inoremap
local nnoremap = vim.keymap.nnoremap
-- local telescope_mapper = require "elliot.telescope.mappings"

local buf_nnoremap = function(opts)
  opts.buffer = 0
  nnoremap(opts)
end

local buf_inoremap = function(opts)
  opts.buffer = 0
  inoremap(opts)
end

local references = vim.lsp.handlers["textDocument/references"]
vim.lsp.handlers["textDocument/references"] =
    function(err, result, ctx, config)
      if #result <= 2 then
        -- Result[1] is the only reference
        -- Result[2] is definition
        vim.lsp.util.jump_to_location(result[1])
      else
        references(err, result, ctx, config)
      end
    end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local on_attach = function(client)
  buf_inoremap { "<c-s>", vim.lsp.buf.signature_help }

  buf_nnoremap { "gd", vim.lsp.buf.definition }
  buf_nnoremap { "gD", require'lspsaga.provider'.preview_definition }
  buf_nnoremap { "gr", vim.lsp.buf.references }
  buf_nnoremap { "gR", function() vim.cmd [[ Lspsaga rename ]] end }
  -- buf_nnoremap { "gR", vim.lsp.buf.rename }

  buf_nnoremap { "<space>rr", "LspRestart" }

  -- buf_nnoremap { "K", require'lspsaga.hover'.render_hover_doc }
  buf_nnoremap { "K", vim.lsp.buf.hover }
  buf_nnoremap {
    "<C-d>", function() require'lspsaga.action'.smart_scroll_with_saga(1) end
  }
  buf_nnoremap {
    "<C-u>", function() require'lspsaga.action'.smart_scroll_with_saga(-1) end
  }

  buf_nnoremap { "]d", function() vim.cmd [[ Lspsaga diagnostic_jump_next ]] end }
  buf_nnoremap { "[d", function() vim.cmd [[ Lspsaga diagnostic_jump_prev ]] end }
  buf_nnoremap {
    "<leader>cd", function() vim.cmd [[ Lspsaga show_line_diagnostics ]] end
  }

  -- TODO: These don't work
  -- telescope_mapper("<leader>ca", "lsp_code_actions")
  -- telescope_mapper("<leader>gr", "lsp_references")
  -- telescope_mapper('<leader>xd', 'lsp_document_diagnostics')
  -- telescope_mapper('<leader>xw', 'lsp_workspace_diagnostics')

  buf_nnoremap { "<leader>F", vim.lsp.buf.formatting }

  vim.cmd [[
      augroup lsp_buf_format
          au! BufWritePre <buffer>
          autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()
      augroup END
  ]]

  if client.resolved_capabilities.document_highlight then
    vim.cmd [[ hi LspReferenceText guibg=#3b3f47 ]] -- This is just some random color
    vim.cmd [[ highlight link LspReferenceRead LspReferenceText ]]
    vim.cmd [[ highlight link LspReferenceWrite LspReferenceText ]]
    vim.cmd [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]
  end
end

local nvim_lsp = require 'lspconfig'

nvim_lsp.tsserver.setup { on_attach = on_attach, capabilities = capabilities }
nvim_lsp.rust_analyzer
    .setup { on_attach = on_attach, capabilities = capabilities }
nvim_lsp.vimls.setup { on_attach = on_attach, capabilities = capabilities }
nvim_lsp.hls.setup {
  root_dir = nvim_lsp.util.root_pattern("*.cabal", "stack.yaml",
                                        "cabal.project", "package.yaml",
                                        "hie.yaml", ".git"),
  on_attach = on_attach,
  capabilities = capabilities
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
  on_attach = on_attach,
  capabilities = capabilities
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

-- return { on_attach, capabilities }
return on_attach
