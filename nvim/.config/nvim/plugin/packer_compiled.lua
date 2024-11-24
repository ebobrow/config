-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/elliotbobrow/.cache/nvim/packer_hererocks/2.1.1731601260/share/lua/5.1/?.lua;/home/elliotbobrow/.cache/nvim/packer_hererocks/2.1.1731601260/share/lua/5.1/?/init.lua;/home/elliotbobrow/.cache/nvim/packer_hererocks/2.1.1731601260/lib/luarocks/rocks-5.1/?.lua;/home/elliotbobrow/.cache/nvim/packer_hererocks/2.1.1731601260/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/elliotbobrow/.cache/nvim/packer_hererocks/2.1.1731601260/lib/lua/5.1/?.so"
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
  Coqtail = {
    config = { "\27LJ\2\nD\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0%hi link coqProofDelim Identifier\bcmd\bvim\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/opt/Coqtail",
    url = "https://github.com/whonore/Coqtail"
  },
  LuaSnip = {
    config = { "\27LJ\2\nÑ\1\0\0\5\0\n\0\0166\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\5\0005\4\4\0=\4\6\3B\1\2\0019\1\a\0009\1\b\0015\3\t\0B\1\2\1K\0\1\0\1\0\1\24enable_autosnippets\2\15set_config\vconfig\npaths\1\0\1\npaths\0\1\2\0\0\29~/.config/nvim/snippets/\14lazy_load\29luasnip.loaders.from_lua\fluasnip\frequire\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
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
  cmp_luasnip = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nW\0\4\n\1\4\0\14\14\0\3\0X\4\1€4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\0À\bset\vkeymap\bvim\vbuffer7\0\4\n\1\1\0\t-\4\0\0\18\6\0\0'\a\0\0\18\b\1\0&\a\b\a\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\2À\14<leader>g{\0\0\3\1\b\0\0166\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\6€6\0\0\0009\0\3\0009\0\4\0005\2\5\0B\0\2\1X\0\4€-\0\0\0009\0\6\0'\2\a\0B\0\2\1K\0\1\0\1À\tnext\rnav_hunk\1\2\1\0\a]c\tbang\2\vnormal\bcmd\tdiff\awo\bvim{\0\0\3\1\b\0\0166\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\6€6\0\0\0009\0\3\0009\0\4\0005\2\5\0B\0\2\1X\0\4€-\0\0\0009\0\6\0'\2\a\0B\0\2\1K\0\1\0\1À\tprev\rnav_hunk\1\2\1\0\a[c\tbang\2\vnormal\bcmd\tdiff\awo\bvim1\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1À\1\0\1\tfull\2\15blame_lineÕ\2\1\1\t\0\24\0/6\1\0\0'\3\1\0B\1\2\0023\2\2\0003\3\3\0\18\4\2\0'\6\4\0'\a\5\0003\b\6\0B\4\4\1\18\4\2\0'\6\4\0'\a\a\0003\b\b\0B\4\4\1\18\4\3\0005\6\t\0'\a\n\0009\b\v\1B\4\4\1\18\4\3\0005\6\f\0'\a\r\0009\b\14\1B\4\4\1\18\4\3\0'\6\4\0'\a\15\0009\b\16\1B\4\4\1\18\4\3\0'\6\4\0'\a\17\0009\b\18\1B\4\4\1\18\4\3\0'\6\4\0'\a\19\0003\b\20\0B\4\4\1\18\4\2\0005\6\21\0'\a\22\0'\b\23\0B\4\4\0012\0\0€K\0\1\0#:<C-U>Gitsigns select_hunk<CR>\aih\1\3\0\0\6o\6x\0\6b\17preview_hunk\6p\17reset_buffer\6R\15reset_hunk\6r\1\3\0\0\6n\6v\15stage_hunk\6s\1\3\0\0\6n\6v\0\a[c\0\a]c\6n\0\0\rgitsigns\frequire[\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\1\0\1\14on_attach\0\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["gruvbox.nvim"] = {
    config = { "\27LJ\2\n“\1\0\0\3\0\b\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\1\0B\0\2\0016\0\4\0009\0\5\0'\2\a\0B\0\2\1K\0\1\0\24set background=dark\16colorscheme\bcmd\bvim\1\0\1\14underline\1\nsetup\fgruvbox\frequire\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/gruvbox.nvim",
    url = "https://github.com/ellisonleao/gruvbox.nvim"
  },
  harpoon = {
    config = { "\27LJ\2\nE\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\1\0B\0\2\1K\0\1\0\17gotoTerminal\17harpoon.term\frequireç\3\1\0\f\0\23\00076\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1)\0\1\0)\1\t\0)\2\1\0M\0\15€6\4\3\0009\4\4\0049\4\5\4'\6\6\0'\a\a\0\18\b\3\0&\a\b\a6\b\b\0009\b\t\b'\n\n\0\18\v\3\0B\b\3\0025\t\v\0B\4\5\1O\0ñ\1276\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\f\0006\4\0\0'\6\r\0B\4\2\0029\4\14\0045\5\15\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0003\4\17\0005\5\18\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\19\0006\4\0\0'\6\20\0B\4\2\0029\4\21\0045\5\22\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\22toggle_quick_menu\15harpoon.ui\14<leader>Q\1\0\2\vsilent\2\fnoremap\2\0\14<leader>t\1\0\1\fnoremap\2\radd_file\17harpoon.mark\14<leader>m\1\0\2\vsilent\2\fnoremap\0020:lua require('harpoon.ui').nav_file(%s)<CR>\vformat\vstring\r<leader>\6n\bset\vkeymap\bvim\nsetup\fharpoon\frequire\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["lspkind-nvim"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["nvim-cmp"] = {
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireº\1\0\1\5\1\a\0\22-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\14€-\1\0\0009\1\1\1B\1\1\2\15\0\1\0X\2\t€-\1\0\0009\1\2\0015\3\5\0-\4\0\0009\4\3\0049\4\4\4=\4\6\3B\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\rbehavior\1\0\2\rbehavior\0\vselect\1\fReplace\20ConfirmBehavior\fconfirm\23get_selected_entry\fvisibleª\n\1\0\r\0F\0w6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0'\1\5\0=\1\4\0006\0\2\0009\0\3\0009\0\6\0\18\2\0\0009\0\a\0'\3\b\0B\0\3\0016\0\0\0'\2\t\0B\0\2\0026\1\0\0'\3\n\0B\1\2\0029\2\v\1B\2\1\0019\2\f\0005\4\16\0005\5\14\0003\6\r\0=\6\15\5=\5\17\0045\5\20\0009\6\18\0009\6\19\6B\6\1\2=\6\21\0059\6\18\0005\b\23\0003\t\22\0=\t\24\b9\t\18\0009\t\25\t5\v\26\0B\t\2\2=\t\27\b9\t\18\0009\t\25\t5\v\30\0009\f\28\0009\f\29\f=\f\31\vB\t\2\2=\t\b\bB\6\2\2=\6 \0059\6\18\0009\6!\0065\b$\0009\t\"\0009\t#\t=\t\31\bB\6\2\2=\6%\0059\6\18\0009\6&\0065\b'\0009\t\"\0009\t#\t=\t\31\bB\6\2\2=\6(\0059\6\18\0009\6)\6B\6\1\2=\6*\5=\5\18\0045\5,\0005\6+\0=\6-\5=\5.\0044\5\4\0005\6/\0>\6\1\0055\0060\0>\6\2\0055\0061\0>\6\3\5=\0052\0045\0053\0=\0054\0045\0059\0009\0065\0015\b6\0005\t7\0=\t8\bB\6\2\2=\6:\5=\5;\4B\2\2\0019\2\f\0009\2<\0025\4=\0005\5?\0005\6>\0=\6@\5B\2\3\0019\2\f\0009\2<\2'\4A\0005\5E\0009\6B\0009\0062\0064\b\3\0005\tC\0>\t\1\b5\tD\0>\t\2\bB\6\2\2=\0062\5B\2\3\0012\0\0€K\0\1\0\1\0\1\fsources\0\1\0\1\tname\fluasnip\1\0\1\tname\tpath\vconfig\btex\15completion\1\0\1\15completion\0\1\0\1\17autocomplete\1\1\2\0\0\fhaskell\rfiletype\15formatting\vformat\1\0\1\vformat\0\tmenu\1\0\3\fluasnip\v[snip]\rnvim_lsp\n[LSP]\tpath\v[path]\1\0\2\tmenu\0\14with_text\2\15cmp_format\17experimental\1\0\2\15ghost_text\1\16native_menu\1\fsources\1\0\1\tname\fluasnip\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\vwindow\18documentation\1\0\1\18documentation\0\1\0\1\vborder\vsingle\n<C-c>\nabort\n<C-k>\1\0\1\rbehavior\0\21select_prev_item\n<C-j>\1\0\1\rbehavior\0\vSelect\19SelectBehavior\21select_next_item\t<CR>\rbehavior\1\0\2\rbehavior\0\vselect\2\fReplace\20ConfirmBehavior\6s\1\0\1\vselect\2\fconfirm\6i\1\0\3\6c\0\6s\0\6i\0\0\14<C-Space>\1\0\5\n<C-c>\0\n<C-k>\0\n<C-j>\0\t<CR>\0\14<C-Space>\0\rcomplete\fmapping\fsnippet\1\0\6\vwindow\0\fsnippet\0\fsources\0\17experimental\0\fmapping\0\15formatting\0\vexpand\1\0\1\vexpand\0\0\nsetup\tinit\flspkind\bcmp\6c\vappend\14shortmess\25menu,menuone,preview\16completeopt\bopt\bvim\15elliot.lsp\frequire\0" },
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
    config = { "\27LJ\2\n&\0\1\2\0\1\0\6\a\0\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\vracketó\t\1\0\n\0,\00056\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\5\0005\4\4\0=\4\6\0034\4\0\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0005\5\r\0=\5\14\4=\4\15\0035\4\18\0005\5\16\0005\6\17\0=\6\14\5=\5\19\0045\5\20\0005\6\21\0=\6\22\0055\6\23\0=\6\24\5=\5\25\0045\5\26\0005\6\27\0=\6\28\0055\6\29\0=\6\30\0055\6\31\0=\6 \0055\6!\0=\6\"\5=\5#\4=\4$\0035\4%\0006\5&\0009\5'\0053\a(\0009\b)\0B\b\1\0A\5\1\2=\5*\4=\4+\3B\1\2\1K\0\1\0\frainbow\fdisable\22available_parsers\0\15tbl_filter\bvim\1\0\2\fdisable\0\venable\2\16textobjects\tmove\22goto_previous_end\1\0\1\a[M\20@function.outer\24goto_previous_start\1\0\1\a[m\20@function.outer\18goto_next_end\1\0\1\a]M\20@function.outer\20goto_next_start\1\0\1\a]m\20@function.outer\1\0\6\18goto_next_end\0\24goto_previous_start\0\venable\2\14set_jumps\2\22goto_previous_end\0\20goto_next_start\0\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\3\14swap_next\0\18swap_previous\0\venable\2\vselect\1\0\3\vselect\0\tmove\0\tswap\0\1\0\2\aif\20@function.inner\aaf\20@function.outer\1\0\4#include_surrounding_whitespace\2\14lookahead\2\fkeymaps\0\venable\2\26incremental_selection\fkeymaps\1\0\4\21node_decremental\n<C-p>\19init_selection\n<C-n>\21node_incremental\n<C-n>\22scope_incremental\n<C-s>\1\0\2\fkeymaps\0\venable\2\14highlight\1\0\1\venable\2\19ignore_install\1\2\0\0\ball\fmodules\21ensure_installed\1\0\t\26incremental_selection\0\14highlight\0\frainbow\0\16textobjects\0\17sync_install\2\17auto_install\1\21ensure_installed\0\fmodules\0\19ignore_install\0\1\b\0\0\trust\ttoml\blua\fhaskell\nlatex\vpython\velixir\nsetup\28nvim-treesitter.configs\28nvim-treesitter.parsers\frequire\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-rainbow"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
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
  undotree = {
    config = { "\27LJ\2\nV\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0\24:UndotreeToggle<CR>\14<leader>u\6n\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
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
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequireº\1\0\1\5\1\a\0\22-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\14€-\1\0\0009\1\1\1B\1\1\2\15\0\1\0X\2\t€-\1\0\0009\1\2\0015\3\5\0-\4\0\0009\4\3\0049\4\4\4=\4\6\3B\1\2\1X\1\2€\18\1\0\0B\1\1\1K\0\1\0\0À\rbehavior\1\0\2\rbehavior\0\vselect\1\fReplace\20ConfirmBehavior\fconfirm\23get_selected_entry\fvisibleª\n\1\0\r\0F\0w6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0'\1\5\0=\1\4\0006\0\2\0009\0\3\0009\0\6\0\18\2\0\0009\0\a\0'\3\b\0B\0\3\0016\0\0\0'\2\t\0B\0\2\0026\1\0\0'\3\n\0B\1\2\0029\2\v\1B\2\1\0019\2\f\0005\4\16\0005\5\14\0003\6\r\0=\6\15\5=\5\17\0045\5\20\0009\6\18\0009\6\19\6B\6\1\2=\6\21\0059\6\18\0005\b\23\0003\t\22\0=\t\24\b9\t\18\0009\t\25\t5\v\26\0B\t\2\2=\t\27\b9\t\18\0009\t\25\t5\v\30\0009\f\28\0009\f\29\f=\f\31\vB\t\2\2=\t\b\bB\6\2\2=\6 \0059\6\18\0009\6!\0065\b$\0009\t\"\0009\t#\t=\t\31\bB\6\2\2=\6%\0059\6\18\0009\6&\0065\b'\0009\t\"\0009\t#\t=\t\31\bB\6\2\2=\6(\0059\6\18\0009\6)\6B\6\1\2=\6*\5=\5\18\0045\5,\0005\6+\0=\6-\5=\5.\0044\5\4\0005\6/\0>\6\1\0055\0060\0>\6\2\0055\0061\0>\6\3\5=\0052\0045\0053\0=\0054\0045\0059\0009\0065\0015\b6\0005\t7\0=\t8\bB\6\2\2=\6:\5=\5;\4B\2\2\0019\2\f\0009\2<\0025\4=\0005\5?\0005\6>\0=\6@\5B\2\3\0019\2\f\0009\2<\2'\4A\0005\5E\0009\6B\0009\0062\0064\b\3\0005\tC\0>\t\1\b5\tD\0>\t\2\bB\6\2\2=\0062\5B\2\3\0012\0\0€K\0\1\0\1\0\1\fsources\0\1\0\1\tname\fluasnip\1\0\1\tname\tpath\vconfig\btex\15completion\1\0\1\15completion\0\1\0\1\17autocomplete\1\1\2\0\0\fhaskell\rfiletype\15formatting\vformat\1\0\1\vformat\0\tmenu\1\0\3\fluasnip\v[snip]\rnvim_lsp\n[LSP]\tpath\v[path]\1\0\2\tmenu\0\14with_text\2\15cmp_format\17experimental\1\0\2\15ghost_text\1\16native_menu\1\fsources\1\0\1\tname\fluasnip\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\vwindow\18documentation\1\0\1\18documentation\0\1\0\1\vborder\vsingle\n<C-c>\nabort\n<C-k>\1\0\1\rbehavior\0\21select_prev_item\n<C-j>\1\0\1\rbehavior\0\vSelect\19SelectBehavior\21select_next_item\t<CR>\rbehavior\1\0\2\rbehavior\0\vselect\2\fReplace\20ConfirmBehavior\6s\1\0\1\vselect\2\fconfirm\6i\1\0\3\6c\0\6s\0\6i\0\0\14<C-Space>\1\0\5\n<C-c>\0\n<C-k>\0\n<C-j>\0\t<CR>\0\14<C-Space>\0\rcomplete\fmapping\fsnippet\1\0\6\vwindow\0\fsnippet\0\fsources\0\17experimental\0\fmapping\0\15formatting\0\vexpand\1\0\1\vexpand\0\0\nsetup\tinit\flspkind\bcmp\6c\vappend\14shortmess\25menu,menuone,preview\16completeopt\bopt\bvim\15elliot.lsp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nW\0\4\n\1\4\0\14\14\0\3\0X\4\1€4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\0À\bset\vkeymap\bvim\vbuffer7\0\4\n\1\1\0\t-\4\0\0\18\6\0\0'\a\0\0\18\b\1\0&\a\b\a\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\2À\14<leader>g{\0\0\3\1\b\0\0166\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\6€6\0\0\0009\0\3\0009\0\4\0005\2\5\0B\0\2\1X\0\4€-\0\0\0009\0\6\0'\2\a\0B\0\2\1K\0\1\0\1À\tnext\rnav_hunk\1\2\1\0\a]c\tbang\2\vnormal\bcmd\tdiff\awo\bvim{\0\0\3\1\b\0\0166\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\6€6\0\0\0009\0\3\0009\0\4\0005\2\5\0B\0\2\1X\0\4€-\0\0\0009\0\6\0'\2\a\0B\0\2\1K\0\1\0\1À\tprev\rnav_hunk\1\2\1\0\a[c\tbang\2\vnormal\bcmd\tdiff\awo\bvim1\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1À\1\0\1\tfull\2\15blame_lineÕ\2\1\1\t\0\24\0/6\1\0\0'\3\1\0B\1\2\0023\2\2\0003\3\3\0\18\4\2\0'\6\4\0'\a\5\0003\b\6\0B\4\4\1\18\4\2\0'\6\4\0'\a\a\0003\b\b\0B\4\4\1\18\4\3\0005\6\t\0'\a\n\0009\b\v\1B\4\4\1\18\4\3\0005\6\f\0'\a\r\0009\b\14\1B\4\4\1\18\4\3\0'\6\4\0'\a\15\0009\b\16\1B\4\4\1\18\4\3\0'\6\4\0'\a\17\0009\b\18\1B\4\4\1\18\4\3\0'\6\4\0'\a\19\0003\b\20\0B\4\4\1\18\4\2\0005\6\21\0'\a\22\0'\b\23\0B\4\4\0012\0\0€K\0\1\0#:<C-U>Gitsigns select_hunk<CR>\aih\1\3\0\0\6o\6x\0\6b\17preview_hunk\6p\17reset_buffer\6R\15reset_hunk\6r\1\3\0\0\6n\6v\15stage_hunk\6s\1\3\0\0\6n\6v\0\a[c\0\a]c\6n\0\0\rgitsigns\frequire[\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\1\0\1\14on_attach\0\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: undotree
time([[Config for undotree]], true)
try_loadstring("\27LJ\2\nV\0\0\5\0\6\0\b6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0B\0\4\1K\0\1\0\24:UndotreeToggle<CR>\14<leader>u\6n\bset\vkeymap\bvim\0", "config", "undotree")
time([[Config for undotree]], false)
-- Config for: gruvbox.nvim
time([[Config for gruvbox.nvim]], true)
try_loadstring("\27LJ\2\n“\1\0\0\3\0\b\0\0166\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\1\0B\0\2\0016\0\4\0009\0\5\0'\2\a\0B\0\2\1K\0\1\0\24set background=dark\16colorscheme\bcmd\bvim\1\0\1\14underline\1\nsetup\fgruvbox\frequire\0", "config", "gruvbox.nvim")
time([[Config for gruvbox.nvim]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\nÑ\1\0\0\5\0\n\0\0166\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\5\0005\4\4\0=\4\6\3B\1\2\0019\1\a\0009\1\b\0015\3\t\0B\1\2\1K\0\1\0\1\0\1\24enable_autosnippets\2\15set_config\vconfig\npaths\1\0\1\npaths\0\1\2\0\0\29~/.config/nvim/snippets/\14lazy_load\29luasnip.loaders.from_lua\fluasnip\frequire\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\2\nE\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\1\0B\0\2\1K\0\1\0\17gotoTerminal\17harpoon.term\frequireç\3\1\0\f\0\23\00076\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1)\0\1\0)\1\t\0)\2\1\0M\0\15€6\4\3\0009\4\4\0049\4\5\4'\6\6\0'\a\a\0\18\b\3\0&\a\b\a6\b\b\0009\b\t\b'\n\n\0\18\v\3\0B\b\3\0025\t\v\0B\4\5\1O\0ñ\1276\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\f\0006\4\0\0'\6\r\0B\4\2\0029\4\14\0045\5\15\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0003\4\17\0005\5\18\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\19\0006\4\0\0'\6\20\0B\4\2\0029\4\21\0045\5\22\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\22toggle_quick_menu\15harpoon.ui\14<leader>Q\1\0\2\vsilent\2\fnoremap\2\0\14<leader>t\1\0\1\fnoremap\2\radd_file\17harpoon.mark\14<leader>m\1\0\2\vsilent\2\fnoremap\0020:lua require('harpoon.ui').nav_file(%s)<CR>\vformat\vstring\r<leader>\6n\bset\vkeymap\bvim\nsetup\fharpoon\frequire\0", "config", "harpoon")
time([[Config for harpoon]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nV\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\1K\0\1\0\30elliot.telescope.mappings\21elliot.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n&\0\1\2\0\1\0\6\a\0\0\0X\1\2€+\1\1\0X\2\1€+\1\2\0L\1\2\0\vracketó\t\1\0\n\0,\00056\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0029\1\3\0015\3\5\0005\4\4\0=\4\6\0034\4\0\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0005\5\r\0=\5\14\4=\4\15\0035\4\18\0005\5\16\0005\6\17\0=\6\14\5=\5\19\0045\5\20\0005\6\21\0=\6\22\0055\6\23\0=\6\24\5=\5\25\0045\5\26\0005\6\27\0=\6\28\0055\6\29\0=\6\30\0055\6\31\0=\6 \0055\6!\0=\6\"\5=\5#\4=\4$\0035\4%\0006\5&\0009\5'\0053\a(\0009\b)\0B\b\1\0A\5\1\2=\5*\4=\4+\3B\1\2\1K\0\1\0\frainbow\fdisable\22available_parsers\0\15tbl_filter\bvim\1\0\2\fdisable\0\venable\2\16textobjects\tmove\22goto_previous_end\1\0\1\a[M\20@function.outer\24goto_previous_start\1\0\1\a[m\20@function.outer\18goto_next_end\1\0\1\a]M\20@function.outer\20goto_next_start\1\0\1\a]m\20@function.outer\1\0\6\18goto_next_end\0\24goto_previous_start\0\venable\2\14set_jumps\2\22goto_previous_end\0\20goto_next_start\0\tswap\18swap_previous\1\0\1\14<leader>A\21@parameter.inner\14swap_next\1\0\1\14<leader>a\21@parameter.inner\1\0\3\14swap_next\0\18swap_previous\0\venable\2\vselect\1\0\3\vselect\0\tmove\0\tswap\0\1\0\2\aif\20@function.inner\aaf\20@function.outer\1\0\4#include_surrounding_whitespace\2\14lookahead\2\fkeymaps\0\venable\2\26incremental_selection\fkeymaps\1\0\4\21node_decremental\n<C-p>\19init_selection\n<C-n>\21node_incremental\n<C-n>\22scope_incremental\n<C-s>\1\0\2\fkeymaps\0\venable\2\14highlight\1\0\1\venable\2\19ignore_install\1\2\0\0\ball\fmodules\21ensure_installed\1\0\t\26incremental_selection\0\14highlight\0\frainbow\0\16textobjects\0\17sync_install\2\17auto_install\1\21ensure_installed\0\fmodules\0\19ignore_install\0\1\b\0\0\trust\ttoml\blua\fhaskell\nlatex\vpython\velixir\nsetup\28nvim-treesitter.configs\28nvim-treesitter.parsers\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType coq ++once lua require("packer.load")({'Coqtail'}, { ft = "coq" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/elliotbobrow/.local/share/nvim/site/pack/packer/opt/Coqtail/ftdetect/coq.vim]], true)
vim.cmd [[source /home/elliotbobrow/.local/share/nvim/site/pack/packer/opt/Coqtail/ftdetect/coq.vim]]
time([[Sourcing ftdetect script at: /home/elliotbobrow/.local/share/nvim/site/pack/packer/opt/Coqtail/ftdetect/coq.vim]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
