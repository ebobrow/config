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
local package_path_str = "/home/elliotbobrow/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/elliotbobrow/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/elliotbobrow/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/elliotbobrow/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/elliotbobrow/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
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
    config = { "\27LJ\2\nÑ\6\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\fkeymaps\1\0\0\tn [c\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]c\1\0\n\17n <leader>gb!<cmd>Gitsigns blame_line<CR>\17n <leader>gr1<cmd>lua require \"gitsigns\".reset_hunk()<CR>\17n <leader>gU9<cmd>lua require \"gitsigns\".reset_buffer_index()<CR>\tx ig;:<C-U>lua require \"gitsigns.actions\".select_hunk()<CR>\17n <leader>gu6<cmd>lua require \"gitsigns\".undo_stage_hunk()<CR>\17n <leader>gs1<cmd>lua require \"gitsigns\".stage_hunk()<CR>\17n <leader>gR3<cmd>lua require \"gitsigns\".reset_buffer()<CR>\17n <leader>gp3<cmd>lua require \"gitsigns\".preview_hunk()<CR>\to ig;:<C-U>lua require \"gitsigns.actions\".select_hunk()<CR>\17n <leader>gS3<cmd>lua require \"gitsigns\".stage_buffer()<CR>\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  harpoon = {
    config = { "\27LJ\2\nE\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\1\0B\0\2\1K\0\1\0\17gotoTerminal\17harpoon.term\frequireû\3\1\0\f\0\25\00076\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1)\0\1\0)\1\t\0)\2\1\0M\0\15€6\4\3\0009\4\4\0049\4\5\4'\6\6\0'\a\a\0\18\b\3\0&\a\b\a6\b\b\0009\b\t\b'\n\n\0\18\v\3\0B\b\3\0025\t\v\0B\4\5\1O\0ñ6\0\3\0009\0\f\0009\0\r\0'\2\6\0'\3\14\0006\4\0\0'\6\15\0B\4\2\0029\4\16\0045\5\17\0B\0\5\0016\0\3\0009\0\f\0009\0\r\0'\2\6\0'\3\18\0003\4\19\0005\5\20\0B\0\5\0016\0\3\0009\0\f\0009\0\r\0'\2\6\0'\3\21\0006\4\0\0'\6\22\0B\4\2\0029\4\23\0045\5\24\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\22toggle_quick_menu\15harpoon.ui\14<leader>Q\1\0\2\fnoremap\2\vsilent\2\0\14<leader>t\1\0\1\fnoremap\2\radd_file\17harpoon.mark\14<leader>m\bset\vkeymap\1\0\2\fnoremap\2\vsilent\0020:lua require('harpoon.ui').nav_file(%s)<CR>\vformat\vstring\r<leader>\6n\20nvim_set_keymap\bapi\bvim\nsetup\fharpoon\frequire\0" },
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
    config = { "\27LJ\2\ný\3\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\23rename_action_keys\1\0\2\tquit\n<C-c>\texec\t<CR>\21code_action_keys\1\0\2\tquit\6q\texec\t<CR>\23finder_action_keys\1\0\6\vvsplit\6s\nsplit\6i\tquit\6q\topen\6o\14scroll_up\n<C-b>\16scroll_down\n<C-f>\23code_action_prompt\1\0\4\venable\1\17virtual_text\1\tsign\2\18sign_priority\3\20\1\0\a\28definition_preview_icon\nï”¸  \27finder_definition_icon\nïŒ‘  \25rename_prompt_prefix\6>\26finder_reference_icon\nïŒ‘  \22max_preview_lines\3\n\29use_saga_diagnostic_sign\1\17border_style\vsingle\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimà\a\1\0\n\0;\0]6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0009\0\4\0\18\2\0\0009\0\5\0'\3\6\0B\0\3\0016\0\0\0009\0\a\0'\2\b\0B\0\2\0016\0\0\0009\0\a\0'\2\t\0B\0\2\0016\0\n\0'\2\v\0B\0\2\0026\1\n\0'\3\f\0B\1\2\0029\2\r\1B\2\1\0019\2\14\0005\4\18\0005\5\16\0003\6\15\0=\6\17\5=\5\19\0045\5\22\0009\6\20\0009\6\21\6B\6\1\2=\6\23\0059\6\20\0009\6\24\0065\b\25\0B\6\2\2=\6\26\0059\6\20\0009\6\27\0065\b\30\0009\t\28\0009\t\29\t=\t\31\bB\6\2\2=\6 \0059\6\20\0009\6!\0065\b\"\0009\t\28\0009\t\29\t=\t\31\bB\6\2\2=\6#\0059\6\20\0009\6$\6B\6\1\2=\6%\5=\5\20\0045\5'\0005\6&\0=\6(\5=\5)\0044\5\3\0005\6*\0>\6\1\0055\6+\0>\6\2\5=\5,\0045\5-\0=\5.\0045\0053\0009\6/\0015\b0\0005\t1\0=\t2\bB\6\2\2=\0064\5=\0055\4B\2\2\0019\2\14\0009\0026\0025\0047\0005\0059\0005\0068\0=\6:\5B\2\3\1K\0\1\0\15completion\1\0\0\1\0\1\17autocomplete\1\1\3\0\0\fhaskell\blua\rfiletype\15formatting\vformat\1\0\0\tmenu\1\0\2\rnvim_lsp\n[LSP]\tpath\v[path]\1\0\1\14with_text\2\15cmp_format\17experimental\1\0\2\15ghost_text\2\16native_menu\1\fsources\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\vwindow\18documentation\1\0\0\1\0\1\vborder\vsingle\n<C-h>\nabort\n<C-k>\1\0\0\21select_prev_item\n<C-j>\rbehavior\1\0\0\vSelect\19SelectBehavior\21select_next_item\n<C-l>\1\0\1\vselect\2\fconfirm\14<C-Space>\1\0\0\rcomplete\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\tinit\flspkind\bcmp\frequire1highlight link CmpDocumentationBorder Normal+highlight link CmpDocumentation Normal\bcmd\6c\vappend\14shortmess\1\4\0\0\tmenu\fmenuone\rnoinsert\16completeopt\bopt\bvim\0" },
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
    config = { "\27LJ\2\nœ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\5\0\0\trust\ttoml\blua\fhaskell\nsetup\28nvim-treesitter.configs\frequire\0" },
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
    config = { "\27LJ\2\n£\3\0\0\3\0\r\0$6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0005\2\4\0B\0\2\0016\0\5\0009\0\6\0'\2\a\0B\0\2\0016\0\5\0009\0\6\0'\2\b\0B\0\2\0016\0\5\0009\0\6\0'\2\t\0B\0\2\0016\0\5\0009\0\6\0'\2\n\0B\0\2\0016\0\5\0009\0\6\0'\2\v\0B\0\2\0016\0\5\0009\0\6\0'\2\f\0B\0\2\1K\0\1\0+hi MatchParen gui=underline guibg=none-hi DiagnosticVirtualTextError guibg=none,hi DiagnosticVirtualTextWarn guibg=none,hi DiagnosticVirtualTextInfo guibg=none,hi DiagnosticVirtualTextHint guibg=none\21unmap <leader>ts\bcmd\bvim\1\0\1\16transparent\2\nsetup\tload\fonedark\frequire\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/onedark.nvim",
    url = "https://github.com/navarasu/onedark.nvim"
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
    config = { "\27LJ\2\nã\1\0\0\6\0\14\0\0196\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\t\0005\4\5\0005\5\4\0=\5\6\0045\5\a\0=\5\b\4=\4\n\0035\4\v\0=\0\f\4=\4\r\3B\1\2\1K\0\1\0\vserver\14on_attach\1\0\0\ntools\1\0\0\16inlay_hints\1\0\1\14highlight\fComment\18hover_actions\1\0\1\17autoSetHints\1\1\0\1\vborder\tnone\nsetup\15rust-tools\15elliot.lsp\frequire\0" },
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
  ["telescope-ui-select.nvim"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nV\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\1K\0\1\0\30elliot.telescope.mappings\21elliot.telescope\frequire\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
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
    config = { "\27LJ\2\nÌ\2\0\0\6\0\r\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0'\3\4\0'\4\5\0005\5\b\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0'\3\t\0'\4\n\0005\5\f\0B\0\5\1K\0\1\0\1\0\1\texpr\2\1\0\1\texpr\2?vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'\f<S-Tab>\1\0\1\texpr\2\6s\1\0\1\texpr\2<vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'\n<Tab>\6i\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nV\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\1K\0\1\0\30elliot.telescope.mappings\21elliot.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: vim-vsnip
time([[Config for vim-vsnip]], true)
try_loadstring("\27LJ\2\nÌ\2\0\0\6\0\r\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0'\3\4\0'\4\5\0005\5\b\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0'\3\t\0'\4\n\0005\5\f\0B\0\5\1K\0\1\0\1\0\1\texpr\2\1\0\1\texpr\2?vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'\f<S-Tab>\1\0\1\texpr\2\6s\1\0\1\texpr\2<vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'\n<Tab>\6i\20nvim_set_keymap\bapi\bvim\0", "config", "vim-vsnip")
time([[Config for vim-vsnip]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\2\nE\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\1\0B\0\2\1K\0\1\0\17gotoTerminal\17harpoon.term\frequireû\3\1\0\f\0\25\00076\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1)\0\1\0)\1\t\0)\2\1\0M\0\15€6\4\3\0009\4\4\0049\4\5\4'\6\6\0'\a\a\0\18\b\3\0&\a\b\a6\b\b\0009\b\t\b'\n\n\0\18\v\3\0B\b\3\0025\t\v\0B\4\5\1O\0ñ6\0\3\0009\0\f\0009\0\r\0'\2\6\0'\3\14\0006\4\0\0'\6\15\0B\4\2\0029\4\16\0045\5\17\0B\0\5\0016\0\3\0009\0\f\0009\0\r\0'\2\6\0'\3\18\0003\4\19\0005\5\20\0B\0\5\0016\0\3\0009\0\f\0009\0\r\0'\2\6\0'\3\21\0006\4\0\0'\6\22\0B\4\2\0029\4\23\0045\5\24\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\22toggle_quick_menu\15harpoon.ui\14<leader>Q\1\0\2\fnoremap\2\vsilent\2\0\14<leader>t\1\0\1\fnoremap\2\radd_file\17harpoon.mark\14<leader>m\bset\vkeymap\1\0\2\fnoremap\2\vsilent\0020:lua require('harpoon.ui').nav_file(%s)<CR>\vformat\vstring\r<leader>\6n\20nvim_set_keymap\bapi\bvim\nsetup\fharpoon\frequire\0", "config", "harpoon")
time([[Config for harpoon]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
try_loadstring("\27LJ\2\n£\3\0\0\3\0\r\0$6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0005\2\4\0B\0\2\0016\0\5\0009\0\6\0'\2\a\0B\0\2\0016\0\5\0009\0\6\0'\2\b\0B\0\2\0016\0\5\0009\0\6\0'\2\t\0B\0\2\0016\0\5\0009\0\6\0'\2\n\0B\0\2\0016\0\5\0009\0\6\0'\2\v\0B\0\2\0016\0\5\0009\0\6\0'\2\f\0B\0\2\1K\0\1\0+hi MatchParen gui=underline guibg=none-hi DiagnosticVirtualTextError guibg=none,hi DiagnosticVirtualTextWarn guibg=none,hi DiagnosticVirtualTextInfo guibg=none,hi DiagnosticVirtualTextHint guibg=none\21unmap <leader>ts\bcmd\bvim\1\0\1\16transparent\2\nsetup\tload\fonedark\frequire\0", "config", "onedark.nvim")
time([[Config for onedark.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nœ\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\5\0\0\trust\ttoml\blua\fhaskell\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimà\a\1\0\n\0;\0]6\0\0\0009\0\1\0005\1\3\0=\1\2\0006\0\0\0009\0\1\0009\0\4\0\18\2\0\0009\0\5\0'\3\6\0B\0\3\0016\0\0\0009\0\a\0'\2\b\0B\0\2\0016\0\0\0009\0\a\0'\2\t\0B\0\2\0016\0\n\0'\2\v\0B\0\2\0026\1\n\0'\3\f\0B\1\2\0029\2\r\1B\2\1\0019\2\14\0005\4\18\0005\5\16\0003\6\15\0=\6\17\5=\5\19\0045\5\22\0009\6\20\0009\6\21\6B\6\1\2=\6\23\0059\6\20\0009\6\24\0065\b\25\0B\6\2\2=\6\26\0059\6\20\0009\6\27\0065\b\30\0009\t\28\0009\t\29\t=\t\31\bB\6\2\2=\6 \0059\6\20\0009\6!\0065\b\"\0009\t\28\0009\t\29\t=\t\31\bB\6\2\2=\6#\0059\6\20\0009\6$\6B\6\1\2=\6%\5=\5\20\0045\5'\0005\6&\0=\6(\5=\5)\0044\5\3\0005\6*\0>\6\1\0055\6+\0>\6\2\5=\5,\0045\5-\0=\5.\0045\0053\0009\6/\0015\b0\0005\t1\0=\t2\bB\6\2\2=\0064\5=\0055\4B\2\2\0019\2\14\0009\0026\0025\0047\0005\0059\0005\0068\0=\6:\5B\2\3\1K\0\1\0\15completion\1\0\0\1\0\1\17autocomplete\1\1\3\0\0\fhaskell\blua\rfiletype\15formatting\vformat\1\0\0\tmenu\1\0\2\rnvim_lsp\n[LSP]\tpath\v[path]\1\0\1\14with_text\2\15cmp_format\17experimental\1\0\2\15ghost_text\2\16native_menu\1\fsources\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\vwindow\18documentation\1\0\0\1\0\1\vborder\vsingle\n<C-h>\nabort\n<C-k>\1\0\0\21select_prev_item\n<C-j>\rbehavior\1\0\0\vSelect\19SelectBehavior\21select_next_item\n<C-l>\1\0\1\vselect\2\fconfirm\14<C-Space>\1\0\0\rcomplete\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\tinit\flspkind\bcmp\frequire1highlight link CmpDocumentationBorder Normal+highlight link CmpDocumentation Normal\bcmd\6c\vappend\14shortmess\1\4\0\0\tmenu\fmenuone\rnoinsert\16completeopt\bopt\bvim\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nÑ\6\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\fkeymaps\1\0\0\tn [c\1\2\1\0H&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'\texpr\2\tn ]c\1\0\n\17n <leader>gb!<cmd>Gitsigns blame_line<CR>\17n <leader>gr1<cmd>lua require \"gitsigns\".reset_hunk()<CR>\17n <leader>gU9<cmd>lua require \"gitsigns\".reset_buffer_index()<CR>\tx ig;:<C-U>lua require \"gitsigns.actions\".select_hunk()<CR>\17n <leader>gu6<cmd>lua require \"gitsigns\".undo_stage_hunk()<CR>\17n <leader>gs1<cmd>lua require \"gitsigns\".stage_hunk()<CR>\17n <leader>gR3<cmd>lua require \"gitsigns\".reset_buffer()<CR>\17n <leader>gp3<cmd>lua require \"gitsigns\".preview_hunk()<CR>\to ig;:<C-U>lua require \"gitsigns.actions\".select_hunk()<CR>\17n <leader>gS3<cmd>lua require \"gitsigns\".stage_buffer()<CR>\1\2\1\0H&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'\texpr\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\ný\3\0\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\2B\0\2\1K\0\1\0\23rename_action_keys\1\0\2\tquit\n<C-c>\texec\t<CR>\21code_action_keys\1\0\2\tquit\6q\texec\t<CR>\23finder_action_keys\1\0\6\vvsplit\6s\nsplit\6i\tquit\6q\topen\6o\14scroll_up\n<C-b>\16scroll_down\n<C-f>\23code_action_prompt\1\0\4\venable\1\17virtual_text\1\tsign\2\18sign_priority\3\20\1\0\a\28definition_preview_icon\nï”¸  \27finder_definition_icon\nïŒ‘  \25rename_prompt_prefix\6>\26finder_reference_icon\nïŒ‘  \22max_preview_lines\3\n\29use_saga_diagnostic_sign\1\17border_style\vsingle\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
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
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
