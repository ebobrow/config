return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-path", "hrsh7th/cmp-nvim-lsp", "onsails/lspkind-nvim",
      "saadparwaiz1/cmp_luasnip"
    },
    config = function()
      -- require "elliot.lsp"
      vim.opt.completeopt = "menu,menuone,preview"
      vim.opt.shortmess:append "c"

      local cmp = require("cmp")
      local lspkind = require "lspkind"
      lspkind.init()

      cmp.setup {
        snippet = {
          expand = function(args)
            -- vim.fn["vsnip#anonymous"](args.body)
            require('luasnip').lsp_expand(args.body)
          end
        },
        mapping = {
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping({
            i = function(fallback)
              if cmp.visible() and cmp.get_selected_entry() then
                cmp.confirm({
                  behavior = cmp.ConfirmBehavior.Replace,
                  select = false
                })
              else
                fallback()
              end
            end,
            s = cmp.mapping.confirm({ select = true }),
            c = cmp.mapping.abort()
          }),
          ["<C-j>"] = cmp.mapping.select_next_item {
            behavior = cmp.SelectBehavior.Select
          },
          ["<C-k>"] = cmp.mapping.select_prev_item {
            behavior = cmp.SelectBehavior.Select
          }
          -- ["<C-c>"] = cmp.mapping.abort()
        },
        window = { documentation = { border = "single" } },
        sources = {
          { name = "nvim_lsp" }, { name = "path" }, { name = "luasnip" }
        },
        experimental = { ghost_text = false, native_menu = false },
        formatting = {
          format = lspkind.cmp_format {
            with_text = true,
            menu = { nvim_lsp = "[LSP]", path = "[path]", luasnip = "[snip]" }
          }
        }
      }
      cmp.setup.filetype({ "haskell" },
                         { completion = { autocomplete = false } })
      cmp.setup.filetype("tex", {
        sources = cmp.config
            .sources({ { name = "path" }, { name = "luasnip" } })
      })
    end
  }
}
