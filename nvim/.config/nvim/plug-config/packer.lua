---@diagnostic disable: undefined-global
return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use {
        'glepnir/lspsaga.nvim',
        config = function()
            require'lspsaga'.init_lsp_saga {
                use_saga_diagnostic_sign = false,
                code_action_prompt = {
                    enable = true,
                    sign = true,
                    sign_priority = 20,
                    virtual_text = false,
                },
                finder_definition_icon = '  ',
                finder_reference_icon = '  ',
                max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
                finder_action_keys = {
                    open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
                },
                code_action_keys = {
                    quit = 'q',exec = '<CR>'
                },
                rename_action_keys = {
                    quit = '<C-c>',exec = '<CR>'  -- quit can be a table
                },
                definition_preview_icon = '  ',
                border_style = "single",
                rename_prompt_prefix = '>',
            }
        end
    }
    use {
        'simrat39/rust-tools.nvim',
        ft = "rust",
        config = function()
            require'rust-tools'.setup {}
        end
    }

    use {
        'tpope/vim-fugitive',
        cmd = { "G", "Ggrep" }
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim', 'kyazdani42/nvim-web-devicons' }
    }
    use 'mkitt/tabline.vim'
    use 'gruvbox-community/gruvbox'
    use 'tpope/vim-commentary'
    use { 'rrethy/vim-hexokinase', run = 'make hexokinase' }
    use {
        'lewis6991/gitsigns.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }
    use {
        "AndrewRadev/splitjoin.vim",
        keys = { "gJ", "gS" },
    }
    use 'caenrique/nvim-toggle-terminal'
    use {
        'rmagatti/auto-session',
        config = function()
            require'auto-session'.setup {
                auto_save_enabled = true,
                auto_restore_enabled = true
            }
        end
    }
    use {
        'dstein64/vim-startuptime',
        cmd = 'StartupTime',
    }
end)
