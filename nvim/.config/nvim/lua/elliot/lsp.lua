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

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local on_attach = function(client)
  local map = function(m, k, v) vim.keymap.set(m, k, v, { silent = true }) end

  map("n", "gd", vim.lsp.buf.definition)
  map("n", "gr", vim.lsp.buf.references)
  map("n", "gR", vim.lsp.buf.rename)

  map("n", "K", vim.lsp.buf.hover)

  map("n", "]d", vim.diagnostic.goto_next)
  map("n", "[d", vim.diagnostic.goto_prev)
  map("n", "<leader>cd", vim.diagnostic.open_float)

  local map_tele = require("elliot.telescope.mappings")
  map_tele("ca", "lsp_code_actions")
  map_tele("r", "lsp_references")

  map("n", "<leader>F", vim.lsp.buf.format)

  vim.cmd [[
      augroup lsp_buf_format
          au! BufWritePre <buffer>
          autocmd BufWritePre <buffer> :lua vim.lsp.buf.format()
      augroup END
  ]]

  if client.server_capabilities.documentHighlightProvider then
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

nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "/usr/lib/rustup/bin/rust-analyzer" },
  settings = { ['rust-analyzer'] = { rustc = { source = "discover" } } }
}
nvim_lsp.hls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = { haskell = { formattingProvider = "fourmolu" } }
}
nvim_lsp.pylsp.setup { on_attach = on_attach, capabilities = capabilities }
nvim_lsp.lua_ls.setup {
  settings = {
    Lua = {
      runtime = { version = 'LuaJIT' },
      diagnostics = { globals = { 'vim' } },
      workspace = { library = vim.api.nvim_get_runtime_file("", true) },
      telemetry = { enable = false }
    }
  }
}
nvim_lsp.efm.setup {
  init_options = { documentFormatting = true },
  filetypes = { "lua" },
  on_attach = on_attach,
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
nvim_lsp.elixirls.setup {
  cmd = { "/usr/bin/elixir-ls" },
  on_attach = on_attach,
  capabilities = capabilities
}
nvim_lsp.racket_langserver.setup {
  on_attach = on_attach,
  capabilities = capabilities
}
nvim_lsp.texlab.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    texlab = {
      build = { onSave = true },
      chktex = { onEdit = false, onOpenAndSave = false },
      forwardSearch = {
        executable = "zathura",
        args = { "--synctex-forward", "%l:1:%f", "%p" }
      },
      latexformatter = "texlab",
      latexindent = {
        ['local'] = "/home/elliotbobrow/.config/nvim/indentconfig.yaml"
      }
    }
  }
}
-- nvim_lsp.asm_lsp.setup { on_attach = on_attach, capabilities = capabilities }
