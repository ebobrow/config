local references = vim.lsp.handlers["textDocument/references"]
vim.lsp.handlers["textDocument/references"] =
    function(err, result, ctx, config)
      if #result <= 2 then
        -- Result[1] is the only reference
        -- Result[2] is definition
        vim.lsp.util.jump_to_location(result[1], "utf-8")
      else
        references(err, result, ctx, config)
      end
    end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

local on_attach = function(client)
  vim.keymap.set("i", "<c-s>", vim.lsp.buf.signature_help)

  vim.keymap.set("n", "gd", vim.lsp.buf.definition)
  vim.keymap.set("n", "gD", require'lspsaga.provider'.preview_definition)
  vim.keymap.set("n", "gr", vim.lsp.buf.references)
  vim.keymap.set("n", "gR", function() vim.cmd [[ Lspsaga rename ]] end)
  -- buf_nnoremap { "gR", vim.lsp.buf.rename }

  vim.keymap.set("n", "<space>rr", "LspRestart")

  -- buf_nnoremap { "K", require'lspsaga.hover'.render_hover_doc }
  vim.keymap.set("n", "K", vim.lsp.buf.hover)
  vim.keymap.set("n", "<C-d>", function()
    require'lspsaga.action'.smart_scroll_with_saga(1)
  end)
  vim.keymap.set("n", "<C-u>", function()
    require'lspsaga.action'.smart_scroll_with_saga(-1)
  end)

  vim.keymap.set("n", "]d",
                 function() vim.cmd [[ Lspsaga diagnostic_jump_next ]] end)
  vim.keymap.set("n", "[d",
                 function() vim.cmd [[ Lspsaga diagnostic_jump_prev ]] end)
  vim.keymap.set("n", "<leader>cd",
                 function() vim.cmd [[ Lspsaga show_line_diagnostics ]] end)

  -- TODO: These don't work
  -- telescope_mapper("<leader>ca", "lsp_code_actions")
  -- telescope_mapper("<leader>gr", "lsp_references")
  -- telescope_mapper('<leader>xd', 'lsp_document_diagnostics')
  -- telescope_mapper('<leader>xw', 'lsp_workspace_diagnostics')

  vim.keymap.set("n", "<leader>F", vim.lsp.buf.formatting)

  vim.cmd [[
      augroup lsp_buf_format
          au! BufWritePre <buffer>
          autocmd BufWritePre <buffer> :lua vim.lsp.buf.formatting_seq_sync()
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

-- nvim_lsp.tsserver.setup { on_attach = on_attach, capabilities = capabilities }
nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    ["rust-analyzer"] = {
      rustcSource = "discover",
      updates = { channel = "nightly" }
    }
  }
}
-- nvim_lsp.vimls.setup { on_attach = on_attach, capabilities = capabilities }
nvim_lsp.hls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = { haskell = { formattingProvider = "fourmolu" } }
}
-- nvim_lsp.pylsp.setup { on_attach = on_attach, capabilities = capabilities }
nvim_lsp.sumneko_lua.setup {
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
nvim_lsp.efm.setup {
  init_options = { documentFormatting = true },
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
-- nvim_lsp.texlab.setup { on_attach = on_attach, capabilities = capabilities }

-- return { on_attach, capabilities }
return on_attach
