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
    config = { "\27LJ\2\nW\0\4\n\1\4\0\14\14\0\3\0X\4\1€4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\0À\bset\vkeymap\bvim\vbuffer7\0\4\n\1\1\0\t-\4\0\0\18\6\0\0'\a\0\0\18\b\1\0&\a\b\a\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\2À\14<leader>g#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14next_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2€'\0\3\0002\0\a€6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0€L\0\2\0L\0\2\0\1À\r<Ignore>\0\rschedule\a]c\tdiff\awo\bvim#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14prev_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2€'\0\3\0002\0\a€6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0€L\0\2\0L\0\2\0\1À\r<Ignore>\0\rschedule\a[c\tdiff\awo\bvim1\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1À\1\0\1\tfull\2\15blame_lineö\2\1\1\n\0\27\00016\1\0\0009\1\1\0019\1\2\0013\2\3\0003\3\4\0\18\4\2\0'\6\5\0'\a\6\0003\b\a\0005\t\b\0B\4\5\1\18\4\2\0'\6\5\0'\a\t\0003\b\n\0005\t\v\0B\4\5\1\18\4\3\0005\6\f\0'\a\r\0009\b\14\1B\4\4\1\18\4\3\0005\6\15\0'\a\16\0009\b\17\1B\4\4\1\18\4\3\0'\6\5\0'\a\18\0009\b\19\1B\4\4\1\18\4\3\0'\6\5\0'\a\20\0009\b\21\1B\4\4\1\18\4\3\0'\6\5\0'\a\22\0003\b\23\0B\4\4\1\18\4\2\0005\6\24\0'\a\25\0'\b\26\0B\4\4\0012\0\0€K\0\1\0#:<C-U>Gitsigns select_hunk<CR>\aih\1\3\0\0\6o\6x\0\6b\17preview_hunk\6p\17reset_buffer\6R\15reset_hunk\6r\1\3\0\0\6n\6v\15stage_hunk\6s\1\3\0\0\6n\6v\1\0\1\texpr\2\0\a[c\1\0\1\texpr\2\0\a]c\6n\0\0\rgitsigns\vloaded\fpackageP\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  harpoon = {
    config = { "\27LJ\2\nE\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\1\0B\0\2\1K\0\1\0\17gotoTerminal\17harpoon.term\frequireç\3\1\0\f\0\23\00076\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1)\0\1\0)\1\t\0)\2\1\0M\0\15€6\4\3\0009\4\4\0049\4\5\4'\6\6\0'\a\a\0\18\b\3\0&\a\b\a6\b\b\0009\b\t\b'\n\n\0\18\v\3\0B\b\3\0025\t\v\0B\4\5\1O\0ñ6\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\f\0006\4\0\0'\6\r\0B\4\2\0029\4\14\0045\5\15\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0003\4\17\0005\5\18\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\19\0006\4\0\0'\6\20\0B\4\2\0029\4\21\0045\5\22\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\22toggle_quick_menu\15harpoon.ui\14<leader>Q\1\0\2\vsilent\2\fnoremap\2\0\14<leader>t\1\0\1\fnoremap\2\radd_file\17harpoon.mark\14<leader>m\1\0\2\vsilent\2\fnoremap\0020:lua require('harpoon.ui').nav_file(%s)<CR>\vformat\vstring\r<leader>\6n\bset\vkeymap\bvim\nsetup\fharpoon\frequire\0" },
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
    config = { "\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimþ\6\1\0\n\0009\0X6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0005\1\5\0=\1\4\0006\0\2\0009\0\3\0009\0\6\0\18\2\0\0009\0\a\0'\3\b\0B\0\3\0016\0\0\0'\2\t\0B\0\2\0026\1\0\0'\3\n\0B\1\2\0029\2\v\1B\2\1\0019\2\f\0005\4\16\0005\5\14\0003\6\r\0=\6\15\5=\5\17\0045\5\20\0009\6\18\0009\6\19\6B\6\1\2=\6\21\0059\6\18\0009\6\22\0065\b\23\0B\6\2\2=\6\24\0059\6\18\0009\6\25\0065\b\28\0009\t\26\0009\t\27\t=\t\29\bB\6\2\2=\6\30\0059\6\18\0009\6\31\0065\b \0009\t\26\0009\t\27\t=\t\29\bB\6\2\2=\6!\0059\6\18\0009\6\"\6B\6\1\2=\6#\5=\5\18\0045\5%\0005\6$\0=\6&\5=\5'\0044\5\3\0005\6(\0>\6\1\0055\6)\0>\6\2\5=\5*\0045\5+\0=\5,\0045\0051\0009\6-\0015\b.\0005\t/\0=\t0\bB\6\2\2=\0062\5=\0053\4B\2\2\0019\2\f\0009\0024\0025\0045\0005\0057\0005\0066\0=\0068\5B\2\3\1K\0\1\0\15completion\1\0\0\1\0\1\17autocomplete\1\1\3\0\0\fhaskell\blua\rfiletype\15formatting\vformat\1\0\0\tmenu\1\0\2\rnvim_lsp\n[LSP]\tpath\v[path]\1\0\1\14with_text\2\15cmp_format\17experimental\1\0\2\15ghost_text\2\16native_menu\1\fsources\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\vwindow\18documentation\1\0\0\1\0\1\vborder\vsingle\n<C-c>\nabort\n<C-k>\1\0\0\21select_prev_item\n<C-j>\rbehavior\1\0\0\vSelect\19SelectBehavior\21select_next_item\t<CR>\1\0\1\vselect\2\fconfirm\14<C-Space>\1\0\0\rcomplete\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\tinit\flspkind\bcmp\6c\vappend\14shortmess\1\4\0\0\tmenu\fmenuone\rnoinsert\16completeopt\bopt\bvim\15elliot.lsp\frequire\0" },
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
    config = { "\27LJ\2\n©\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\a\0\0\trust\ttoml\blua\fhaskell\nlatex\vpython\nsetup\28nvim-treesitter.configs\frequire\0" },
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
    config = { "\27LJ\2\nÇ\1\0\0\5\0\v\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\n\0B\0\1\1K\0\1\0\tload\15highlights\15MatchParen\1\0\0\1\0\2\bfmt\14underline\abg\tnone\16diagnostics\1\0\1\15background\1\1\0\1\nstyle\vdarker\nsetup\fonedark\frequire\0" },
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
  ["vim-repeat"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-vsnip"] = {
    config = { "\27LJ\2\nÂ\2\0\0\6\0\r\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0'\3\4\0'\4\5\0005\5\b\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0'\3\t\0'\4\n\0005\5\f\0B\0\5\1K\0\1\0\1\0\1\texpr\2\1\0\1\texpr\2>vsnip#jumpable(1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'\f<S-Tab>\1\0\1\texpr\2\6s\1\0\1\texpr\2<vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'\n<Tab>\6i\bset\vkeymap\bvim\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/vim-vsnip",
    url = "https://github.com/hrsh7th/vim-vsnip"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\2\nE\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0)\2\1\0B\0\2\1K\0\1\0\17gotoTerminal\17harpoon.term\frequireç\3\1\0\f\0\23\00076\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1)\0\1\0)\1\t\0)\2\1\0M\0\15€6\4\3\0009\4\4\0049\4\5\4'\6\6\0'\a\a\0\18\b\3\0&\a\b\a6\b\b\0009\b\t\b'\n\n\0\18\v\3\0B\b\3\0025\t\v\0B\4\5\1O\0ñ6\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\f\0006\4\0\0'\6\r\0B\4\2\0029\4\14\0045\5\15\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0003\4\17\0005\5\18\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\19\0006\4\0\0'\6\20\0B\4\2\0029\4\21\0045\5\22\0B\0\5\1K\0\1\0\1\0\2\vsilent\2\fnoremap\2\22toggle_quick_menu\15harpoon.ui\14<leader>Q\1\0\2\vsilent\2\fnoremap\2\0\14<leader>t\1\0\1\fnoremap\2\radd_file\17harpoon.mark\14<leader>m\1\0\2\vsilent\2\fnoremap\0020:lua require('harpoon.ui').nav_file(%s)<CR>\vformat\vstring\r<leader>\6n\bset\vkeymap\bvim\nsetup\fharpoon\frequire\0", "config", "harpoon")
time([[Config for harpoon]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nW\0\4\n\1\4\0\14\14\0\3\0X\4\1€4\3\0\0-\4\0\0=\4\0\0036\4\1\0009\4\2\0049\4\3\4\18\6\0\0\18\a\1\0\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\0À\bset\vkeymap\bvim\vbuffer7\0\4\n\1\1\0\t-\4\0\0\18\6\0\0'\a\0\0\18\b\1\0&\a\b\a\18\b\2\0\18\t\3\0B\4\5\1K\0\1\0\2À\14<leader>g#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14next_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2€'\0\3\0002\0\a€6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0€L\0\2\0L\0\2\0\1À\r<Ignore>\0\rschedule\a]c\tdiff\awo\bvim#\0\0\2\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0\0\14prev_hunkg\1\0\3\1\a\0\0156\0\0\0009\0\1\0009\0\2\0\15\0\0\0X\1\2€'\0\3\0002\0\a€6\0\0\0009\0\4\0003\2\5\0B\0\2\1'\0\6\0002\0\0€L\0\2\0L\0\2\0\1À\r<Ignore>\0\rschedule\a[c\tdiff\awo\bvim1\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\1À\1\0\1\tfull\2\15blame_lineö\2\1\1\n\0\27\00016\1\0\0009\1\1\0019\1\2\0013\2\3\0003\3\4\0\18\4\2\0'\6\5\0'\a\6\0003\b\a\0005\t\b\0B\4\5\1\18\4\2\0'\6\5\0'\a\t\0003\b\n\0005\t\v\0B\4\5\1\18\4\3\0005\6\f\0'\a\r\0009\b\14\1B\4\4\1\18\4\3\0005\6\15\0'\a\16\0009\b\17\1B\4\4\1\18\4\3\0'\6\5\0'\a\18\0009\b\19\1B\4\4\1\18\4\3\0'\6\5\0'\a\20\0009\b\21\1B\4\4\1\18\4\3\0'\6\5\0'\a\22\0003\b\23\0B\4\4\1\18\4\2\0005\6\24\0'\a\25\0'\b\26\0B\4\4\0012\0\0€K\0\1\0#:<C-U>Gitsigns select_hunk<CR>\aih\1\3\0\0\6o\6x\0\6b\17preview_hunk\6p\17reset_buffer\6R\15reset_hunk\6r\1\3\0\0\6n\6v\15stage_hunk\6s\1\3\0\0\6n\6v\1\0\1\texpr\2\0\a[c\1\0\1\texpr\2\0\a]c\6n\0\0\rgitsigns\vloaded\fpackageP\1\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\2B\0\2\1K\0\1\0\14on_attach\1\0\0\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-cmp
time([[Config for nvim-cmp]], true)
try_loadstring("\27LJ\2\n;\0\1\4\0\4\0\0066\1\0\0009\1\1\0019\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\20vsnip#anonymous\afn\bvimþ\6\1\0\n\0009\0X6\0\0\0'\2\1\0B\0\2\0016\0\2\0009\0\3\0005\1\5\0=\1\4\0006\0\2\0009\0\3\0009\0\6\0\18\2\0\0009\0\a\0'\3\b\0B\0\3\0016\0\0\0'\2\t\0B\0\2\0026\1\0\0'\3\n\0B\1\2\0029\2\v\1B\2\1\0019\2\f\0005\4\16\0005\5\14\0003\6\r\0=\6\15\5=\5\17\0045\5\20\0009\6\18\0009\6\19\6B\6\1\2=\6\21\0059\6\18\0009\6\22\0065\b\23\0B\6\2\2=\6\24\0059\6\18\0009\6\25\0065\b\28\0009\t\26\0009\t\27\t=\t\29\bB\6\2\2=\6\30\0059\6\18\0009\6\31\0065\b \0009\t\26\0009\t\27\t=\t\29\bB\6\2\2=\6!\0059\6\18\0009\6\"\6B\6\1\2=\6#\5=\5\18\0045\5%\0005\6$\0=\6&\5=\5'\0044\5\3\0005\6(\0>\6\1\0055\6)\0>\6\2\5=\5*\0045\5+\0=\5,\0045\0051\0009\6-\0015\b.\0005\t/\0=\t0\bB\6\2\2=\0062\5=\0053\4B\2\2\0019\2\f\0009\0024\0025\0045\0005\0057\0005\0066\0=\0068\5B\2\3\1K\0\1\0\15completion\1\0\0\1\0\1\17autocomplete\1\1\3\0\0\fhaskell\blua\rfiletype\15formatting\vformat\1\0\0\tmenu\1\0\2\rnvim_lsp\n[LSP]\tpath\v[path]\1\0\1\14with_text\2\15cmp_format\17experimental\1\0\2\15ghost_text\2\16native_menu\1\fsources\1\0\1\tname\tpath\1\0\1\tname\rnvim_lsp\vwindow\18documentation\1\0\0\1\0\1\vborder\vsingle\n<C-c>\nabort\n<C-k>\1\0\0\21select_prev_item\n<C-j>\rbehavior\1\0\0\vSelect\19SelectBehavior\21select_next_item\t<CR>\1\0\1\vselect\2\fconfirm\14<C-Space>\1\0\0\rcomplete\fmapping\fsnippet\1\0\0\vexpand\1\0\0\0\nsetup\tinit\flspkind\bcmp\6c\vappend\14shortmess\1\4\0\0\tmenu\fmenuone\rnoinsert\16completeopt\bopt\bvim\15elliot.lsp\frequire\0", "config", "nvim-cmp")
time([[Config for nvim-cmp]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n©\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\a\0\0\trust\ttoml\blua\fhaskell\nlatex\vpython\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nV\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0016\0\0\0'\2\2\0B\0\2\1K\0\1\0\30elliot.telescope.mappings\21elliot.telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
try_loadstring("\27LJ\2\nÇ\1\0\0\5\0\v\0\0186\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\3=\3\t\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\n\0B\0\1\1K\0\1\0\tload\15highlights\15MatchParen\1\0\0\1\0\2\bfmt\14underline\abg\tnone\16diagnostics\1\0\1\15background\1\1\0\1\nstyle\vdarker\nsetup\fonedark\frequire\0", "config", "onedark.nvim")
time([[Config for onedark.nvim]], false)
-- Config for: vim-vsnip
time([[Config for vim-vsnip]], true)
try_loadstring("\27LJ\2\nÂ\2\0\0\6\0\r\0!6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0'\3\4\0'\4\5\0005\5\b\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\t\0'\4\n\0005\5\v\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\a\0'\3\t\0'\4\n\0005\5\f\0B\0\5\1K\0\1\0\1\0\1\texpr\2\1\0\1\texpr\2>vsnip#jumpable(1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>'\f<S-Tab>\1\0\1\texpr\2\6s\1\0\1\texpr\2<vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>'\n<Tab>\6i\bset\vkeymap\bvim\0", "config", "vim-vsnip")
time([[Config for vim-vsnip]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
