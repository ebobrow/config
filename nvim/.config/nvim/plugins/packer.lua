return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-compe'
    use 'glepnir/lspsaga.nvim'
    use {
        '~/repos/lsp_extensions.nvim',
        config = function ()
            vim.cmd [[autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs lua require'lsp_extensions'.inlay_hints{ prefix = ' » ', enabled = {"ChainingHint", "ParameterHint", "TypeHint"} }]]
        end
    }

    use {
        'tpope/vim-fugitive',
        cmd = "G"
    }
    use {
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim' }
    }
    use {
        'glepnir/galaxyline.nvim',
        branch = 'main',
        requires = {'kyazdani42/nvim-web-devicons'}
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
        config = function ()
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
