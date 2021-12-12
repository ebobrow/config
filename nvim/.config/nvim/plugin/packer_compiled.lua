-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/elliotbobrow/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/elliotbobrow/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/elliotbobrow/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/elliotbobrow/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/elliotbobrow/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/astronauta.nvim",
    url = "https://github.com/tjdevries/astronauta.nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2å\6\0\0\4\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\b\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\2:\2\t\1>\0\2\1G\0\1\0\fkeymaps\1\0\0\tn [c\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]c\1\0\n\17n <leader>gU9<cmd>lua require \"gitsigns\".reset_buffer_index()<CR>\17n <leader>gr1<cmd>lua require \"gitsigns\".reset_hunk()<CR>\17n <leader>gb5<cmd>lua require \"gitsigns\".blame_line(true)<CR>\to ig;:<C-U>lua require \"gitsigns.actions\".select_hunk()<CR>\tx ig;:<C-U>lua require \"gitsigns.actions\".select_hunk()<CR>\17n <leader>gp3<cmd>lua require \"gitsigns\".preview_hunk()<CR>\17n <leader>gS3<cmd>lua require \"gitsigns\".stage_buffer()<CR>\17n <leader>gu6<cmd>lua require \"gitsigns\".undo_stage_hunk()<CR>\17n <leader>gs1<cmd>lua require \"gitsigns\".stage_hunk()<CR>\17n <leader>gR3<cmd>lua require \"gitsigns\".reset_buffer()<CR>\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  harpoon = {
    config = { "\27LJ\1\2…\6\0\0\5\0\28\0>4\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\a\0%\3\b\0003\4\t\0>\0\5\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\n\0%\3\v\0003\4\f\0>\0\5\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\r\0%\3\14\0003\4\15\0>\0\5\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\16\0%\3\17\0003\4\18\0>\0\5\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\19\0%\3\20\0003\4\21\0>\0\5\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\22\0%\3\23\0003\4\24\0>\0\5\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\25\0%\3\26\0003\4\27\0>\0\5\1G\0\1\0\1\0\1\fnoremap\0027:lua require('harpoon.ui').toggle_quick_menu()<CR>\14<leader>Q\1\0\1\fnoremap\0025:lua require('harpoon.term').gotoTerminal(1)<CR>\14<leader>t\1\0\1\fnoremap\0020:lua require('harpoon.mark').add_file()<CR>\14<leader>m\1\0\1\fnoremap\2/:lua require('harpoon.ui').nav_file(4)<CR>\14<leader>4\1\0\1\fnoremap\2/:lua require('harpoon.ui').nav_file(3)<CR>\14<leader>3\1\0\1\fnoremap\2/:lua require('harpoon.ui').nav_file(2)<CR>\14<leader>2\1\0\1\fnoremap\2/:lua require('harpoon.ui').nav_file(1)<CR>\14<leader>1\6n\20nvim_set_keymap\bapi\bvim\nsetup\fharpoon\frequire\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\1\2ý\3\0\0\3\0\f\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0:\2\t\0013\2\n\0:\2\v\1>\0\2\1G\0\1\0\23rename_action_keys\1\0\2\tquit\n<C-c>\texec\t<CR>\21code_action_keys\1\0\2\tquit\6q\texec\t<CR>\23finder_action_keys\1\0\6\tquit\6q\16scroll_down\n<C-f>\vvsplit\6s\topen\6o\14scroll_up\n<C-b>\nsplit\6i\23code_action_prompt\1\0\4\18sign_priority\3\20\17virtual_text\1\tsign\2\venable\1\1\0\a\28definition_preview_icon\nï”¸  \17border_style\vsingle\25rename_prompt_prefix\6>\26finder_reference_icon\nïŒ‘  \29use_saga_diagnostic_sign\1\22max_preview_lines\3\n\27finder_definition_icon\nïŒ‘  \18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/glepnir/lspsaga.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\1\2;\0\1\3\0\4\0\0064\1\0\0007\1\1\0017\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\20vsnip#anonymous\afn\bvimú\6\1\0\b\0004\0T4\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\0\0007\0\1\0007\0\4\0\16\1\0\0007\0\5\0%\2\6\0>\0\3\0014\0\0\0007\0\a\0%\1\b\0>\0\2\0014\0\0\0007\0\a\0%\1\t\0>\0\2\0014\0\n\0%\1\v\0>\0\2\0024\1\n\0%\2\f\0>\1\2\0027\2\r\1>\2\1\0017\2\14\0003\3\18\0003\4\16\0001\5\15\0:\5\17\4:\4\19\0033\4\22\0007\5\20\0007\5\21\5>\5\1\2:\5\23\0047\5\20\0007\5\24\0053\6\25\0>\5\2\2:\5\26\0047\5\20\0007\5\27\0053\6\30\0007\a\28\0007\a\29\a:\a\31\6>\5\2\2:\5 \0047\5\20\0007\5!\0053\6\"\0007\a\28\0007\a\29\a:\a\31\6>\5\2\2:\5#\0047\5\20\0007\5$\5>\5\1\2:\5%\4:\4\20\0033\4&\0:\4'\0032\4\3\0003\5(\0;\5\1\0043\5)\0;\5\2\4:\4*\0033\4+\0:\4,\0033\0041\0007\5-\0013\6.\0003\a/\0:\a0\6>\5\2\2:\0052\4:\0043\3>\2\2\1G\0\1\0\15formatting\vformat\1\0\0\tmenu\1\0\2\rnvim_lsp\n[LSP]\tpath\v[path]\1\0\1\14with_text\2\15cmp_format\17experimental\1\0\2\15ghost_text\2\16native_menu\1\fsources\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\18documentation\1\0\1\vborder\vsingle\n<C-h>\nabort\n<C-k>\1\0\0\21select_prev_item\n<C-j>\rbehavior\1\0\0\vSelect\19SelectBehavior\21select_next_item\n<C-l>\1\0\1\vselect\2\fconfirm\14<C-Space>\1\0\0\rcomplete\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\tinit\flspkind\bcmp\frequire1highlight link CmpDocumentationBorder Normal+highlight link CmpDocumentation Normal\bcmd\6c\vappend\14shortmess\1\4\0\0\tmenu\fmenuone\rnoinsert\16completeopt\bopt\bvim\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2°\1\0\0\3\0\b\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\1>\0\2\1G\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\b\0\0\trust\ttoml\thtml\15typescript\btsx\blua\fhaskell\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    config = { '\27LJ\1\2Ú\3\0\0\3\0\f\0#4\0\0\0007\0\1\0%\1\2\0>\0\2\0014\0\0\0007\0\1\0%\1\3\0>\0\2\0014\0\0\0007\0\1\0%\1\4\0>\0\2\0014\0\0\0007\0\5\0007\0\6\0%\1\a\0)\2\2\0>\0\3\0014\0\0\0007\0\1\0%\1\b\0>\0\2\0014\0\0\0007\0\1\0%\1\t\0>\0\2\0014\0\0\0007\0\1\0%\1\n\0>\0\2\0014\0\0\0007\0\1\0%\1\v\0>\0\2\1G\0\1\0000hi LspDiagnosticsVirtualTextHint guibg=none7hi LspDiagnosticsVirtualTextInformation guibg=none3hi LspDiagnosticsVirtualTextWarning guibg=none1hi LspDiagnosticsVirtualTextError guibg=none\18termguicolors\20nvim_set_option\bapi\24colorscheme onedark+let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"+let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"\bcmd\bvim\0' },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/ii14/onedark.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["rust-tools.nvim"] = {
    config = { "\27LJ\1\2Õ\1\0\0\5\0\14\0\0194\0\0\0%\1\1\0>\0\2\0024\1\0\0%\2\2\0>\1\2\0027\1\3\0013\2\t\0003\3\5\0003\4\4\0:\4\6\0033\4\a\0:\4\b\3:\3\n\0023\3\v\0:\0\f\3:\3\r\2>\1\2\1G\0\1\0\vserver\14on_attach\1\0\0\ntools\1\0\0\16inlay_hints\1\0\1\14highlight\fComment\18hover_actions\1\0\0\1\0\1\vborder\tnone\nsetup\15rust-tools\15elliot.lsp\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/opt/rust-tools.nvim",
    url = "https://github.com/simrat39/rust-tools.nvim"
  },
  ["splitjoin.vim"] = {
    keys = { { "", "gJ" }, { "", "gS" } },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/opt/splitjoin.vim",
    url = "https://github.com/AndrewRadev/splitjoin.vim"
  },
  ["tabline.vim"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/tabline.vim",
    url = "https://github.com/mkitt/tabline.vim"
  },
  ["telescope-fzy-native.nvim"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/telescope-fzy-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzy-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\1\2V\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0014\0\0\0%\1\2\0>\0\2\1G\0\1\0\30elliot.telescope.mappings\21elliot.telescope\frequire\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\1\2p\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\14highlight\1\0\2\nafter\5\fkeyword\afg\1\0\1\nsigns\1\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-hexokinase"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/vim-hexokinase",
    url = "https://github.com/rrethy/vim-hexokinase"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/opt/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\1\2Ì\2\0\0\5\0\r\0!4\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0003\4\6\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\a\0%\2\4\0%\3\5\0003\4\b\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\t\0%\3\n\0003\4\v\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\a\0%\2\t\0%\3\n\0003\4\f\0>\0\5\1G\0\1\0\1\0\1\texpr\2\1\0\1\texpr\2?vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'\f<S-Tab>\1\0\1\texpr\2\6s\1\0\1\texpr\2<vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'\n<Tab>\6i\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\1\2V\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0014\0\0\0%\1\2\0>\0\2\1G\0\1\0\30elliot.telescope.mappings\21elliot.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\1\2;\0\1\3\0\4\0\0064\1\0\0007\1\1\0017\1\2\0017\2\3\0>\1\2\1G\0\1\0\tbody\20vsnip#anonymous\afn\bvimú\6\1\0\b\0004\0T4\0\0\0007\0\1\0003\1\3\0:\1\2\0004\0\0\0007\0\1\0007\0\4\0\16\1\0\0007\0\5\0%\2\6\0>\0\3\0014\0\0\0007\0\a\0%\1\b\0>\0\2\0014\0\0\0007\0\a\0%\1\t\0>\0\2\0014\0\n\0%\1\v\0>\0\2\0024\1\n\0%\2\f\0>\1\2\0027\2\r\1>\2\1\0017\2\14\0003\3\18\0003\4\16\0001\5\15\0:\5\17\4:\4\19\0033\4\22\0007\5\20\0007\5\21\5>\5\1\2:\5\23\0047\5\20\0007\5\24\0053\6\25\0>\5\2\2:\5\26\0047\5\20\0007\5\27\0053\6\30\0007\a\28\0007\a\29\a:\a\31\6>\5\2\2:\5 \0047\5\20\0007\5!\0053\6\"\0007\a\28\0007\a\29\a:\a\31\6>\5\2\2:\5#\0047\5\20\0007\5$\5>\5\1\2:\5%\4:\4\20\0033\4&\0:\4'\0032\4\3\0003\5(\0;\5\1\0043\5)\0;\5\2\4:\4*\0033\4+\0:\4,\0033\0041\0007\5-\0013\6.\0003\a/\0:\a0\6>\5\2\2:\0052\4:\0043\3>\2\2\1G\0\1\0\15formatting\vformat\1\0\0\tmenu\1\0\2\rnvim_lsp\n[LSP]\tpath\v[path]\1\0\1\14with_text\2\15cmp_format\17experimental\1\0\2\15ghost_text\2\16native_menu\1\fsources\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\18documentation\1\0\1\vborder\vsingle\n<C-h>\nabort\n<C-k>\1\0\0\21select_prev_item\n<C-j>\rbehavior\1\0\0\vSelect\19SelectBehavior\21select_next_item\n<C-l>\1\0\1\vselect\2\fconfirm\14<C-Space>\1\0\0\rcomplete\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\tinit\flspkind\bcmp\frequire1highlight link CmpDocumentationBorder Normal+highlight link CmpDocumentation Normal\bcmd\6c\vappend\14shortmess\1\4\0\0\tmenu\fmenuone\rnoinsert\16completeopt\bopt\bvim\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: vim-vsnip
time([[Config for vim-vsnip]], true)
try_loadstring("\27LJ\1\2Ì\2\0\0\5\0\r\0!4\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0003\4\6\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\a\0%\2\4\0%\3\5\0003\4\b\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\t\0%\3\n\0003\4\v\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\a\0%\2\t\0%\3\n\0003\4\f\0>\0\5\1G\0\1\0\1\0\1\texpr\2\1\0\1\texpr\2?vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'\f<S-Tab>\1\0\1\texpr\2\6s\1\0\1\texpr\2<vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'\n<Tab>\6i\20nvim_set_keymap\bapi\bvim\0", "config", "vim-vsnip")
time([[Config for vim-vsnip]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\1\2…\6\0\0\5\0\28\0>4\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\a\0%\3\b\0003\4\t\0>\0\5\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\n\0%\3\v\0003\4\f\0>\0\5\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\r\0%\3\14\0003\4\15\0>\0\5\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\16\0%\3\17\0003\4\18\0>\0\5\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\19\0%\3\20\0003\4\21\0>\0\5\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\22\0%\3\23\0003\4\24\0>\0\5\0014\0\3\0007\0\4\0007\0\5\0%\1\6\0%\2\25\0%\3\26\0003\4\27\0>\0\5\1G\0\1\0\1\0\1\fnoremap\0027:lua require('harpoon.ui').toggle_quick_menu()<CR>\14<leader>Q\1\0\1\fnoremap\0025:lua require('harpoon.term').gotoTerminal(1)<CR>\14<leader>t\1\0\1\fnoremap\0020:lua require('harpoon.mark').add_file()<CR>\14<leader>m\1\0\1\fnoremap\2/:lua require('harpoon.ui').nav_file(4)<CR>\14<leader>4\1\0\1\fnoremap\2/:lua require('harpoon.ui').nav_file(3)<CR>\14<leader>3\1\0\1\fnoremap\2/:lua require('harpoon.ui').nav_file(2)<CR>\14<leader>2\1\0\1\fnoremap\2/:lua require('harpoon.ui').nav_file(1)<CR>\14<leader>1\6n\20nvim_set_keymap\bapi\bvim\nsetup\fharpoon\frequire\0", "config", "harpoon")
time([[Config for harpoon]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\2å\6\0\0\4\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\b\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\2:\2\t\1>\0\2\1G\0\1\0\fkeymaps\1\0\0\tn [c\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]c\1\0\n\17n <leader>gU9<cmd>lua require \"gitsigns\".reset_buffer_index()<CR>\17n <leader>gr1<cmd>lua require \"gitsigns\".reset_hunk()<CR>\17n <leader>gb5<cmd>lua require \"gitsigns\".blame_line(true)<CR>\to ig;:<C-U>lua require \"gitsigns.actions\".select_hunk()<CR>\tx ig;:<C-U>lua require \"gitsigns.actions\".select_hunk()<CR>\17n <leader>gp3<cmd>lua require \"gitsigns\".preview_hunk()<CR>\17n <leader>gS3<cmd>lua require \"gitsigns\".stage_buffer()<CR>\17n <leader>gu6<cmd>lua require \"gitsigns\".undo_stage_hunk()<CR>\17n <leader>gs1<cmd>lua require \"gitsigns\".stage_hunk()<CR>\17n <leader>gR3<cmd>lua require \"gitsigns\".reset_buffer()<CR>\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\1\2p\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\14highlight\1\0\2\nafter\5\fkeyword\afg\1\0\1\nsigns\1\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
try_loadstring('\27LJ\1\2Ú\3\0\0\3\0\f\0#4\0\0\0007\0\1\0%\1\2\0>\0\2\0014\0\0\0007\0\1\0%\1\3\0>\0\2\0014\0\0\0007\0\1\0%\1\4\0>\0\2\0014\0\0\0007\0\5\0007\0\6\0%\1\a\0)\2\2\0>\0\3\0014\0\0\0007\0\1\0%\1\b\0>\0\2\0014\0\0\0007\0\1\0%\1\t\0>\0\2\0014\0\0\0007\0\1\0%\1\n\0>\0\2\0014\0\0\0007\0\1\0%\1\v\0>\0\2\1G\0\1\0000hi LspDiagnosticsVirtualTextHint guibg=none7hi LspDiagnosticsVirtualTextInformation guibg=none3hi LspDiagnosticsVirtualTextWarning guibg=none1hi LspDiagnosticsVirtualTextError guibg=none\18termguicolors\20nvim_set_option\bapi\24colorscheme onedark+let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"+let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"\bcmd\bvim\0', "config", "onedark.nvim")
time([[Config for onedark.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2°\1\0\0\3\0\b\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\1>\0\2\1G\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\b\0\0\trust\ttoml\thtml\15typescript\btsx\blua\fhaskell\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\1\2ý\3\0\0\3\0\f\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0:\2\t\0013\2\n\0:\2\v\1>\0\2\1G\0\1\0\23rename_action_keys\1\0\2\tquit\n<C-c>\texec\t<CR>\21code_action_keys\1\0\2\tquit\6q\texec\t<CR>\23finder_action_keys\1\0\6\tquit\6q\16scroll_down\n<C-f>\vvsplit\6s\topen\6o\14scroll_up\n<C-b>\nsplit\6i\23code_action_prompt\1\0\4\18sign_priority\3\20\17virtual_text\1\tsign\2\venable\1\1\0\a\28definition_preview_icon\nï”¸  \17border_style\vsingle\25rename_prompt_prefix\6>\26finder_reference_icon\nïŒ‘  \29use_saga_diagnostic_sign\1\22max_preview_lines\3\n\27finder_definition_icon\nïŒ‘  \18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> gS <cmd>lua require("packer.load")({'splitjoin.vim'}, { keys = "gS", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gJ <cmd>lua require("packer.load")({'splitjoin.vim'}, { keys = "gJ", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType rust ++once lua require("packer.load")({'rust-tools.nvim'}, { ft = "rust" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
