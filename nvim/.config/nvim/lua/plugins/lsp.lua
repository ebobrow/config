return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.diagnostic.config({ virtual_text = true, virtual_lines = false })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client)
        local map = function(m, k, v)
          vim.keymap.set(m, k, v, { silent = true })
        end

        map("n", "gd", vim.lsp.buf.definition)
        map("n", "gr", vim.lsp.buf.references)
        map("n", "gR", vim.lsp.buf.rename)

        map("n", "K", vim.lsp.buf.hover)

        map("n", "]d",
          function() vim.diagnostic.jump({ count = 1, float = false }) end)
        map("n", "[d",
          function() vim.diagnostic.jump({ count = -1, float = false }) end)
        map("n", "<leader>cd", vim.diagnostic.open_float)

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

      vim.lsp
          .config('*', { on_attach = on_attach, capabilities = capabilities })
      vim.g.rustaceanvim = {
        server = { on_attach = on_attach },
        tools = {
          test_executor = "background",
          float_win_config = { open_split = "vertical" }
        }
      }
      vim.lsp.enable('lua_ls')
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' },
            diagnostics = { globals = { 'vim' } },
            workspace = { library = vim.api.nvim_get_runtime_file("", true) },
            telemetry = { enable = false }
          }
        }
      })
      vim.lsp.enable('efm')
      vim.lsp.config('efm', {
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
      })
      vim.lsp.enable('gopls')
      vim.lsp.enable('texlab')
      vim.lsp.config('texlab', {
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
      })
    end
  }, { "ray-x/lsp_signature.nvim", opts = { hint_enable = false } }, {
  "hedyhli/outline.nvim",
  opts = { symbols = { icon_source = "lspkind" } },
  keys = { { "<leader>o", "<cmd>Outline<CR>" } }
}, { "mrcjkb/rustaceanvim" }
}
