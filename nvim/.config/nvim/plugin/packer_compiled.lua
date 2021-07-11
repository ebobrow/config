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
  ["auto-session"] = {
    config = { "\27LJ\1\2j\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\2\22auto_save_enabled\2\25auto_restore_enabled\2\nsetup\17auto-session\frequire\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/auto-session"
  },
  ["galaxyline.nvim"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  gruvbox = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/gruvbox"
  },
  ["lsp_extensions.nvim"] = {
    config = { "\27LJ\1\2Ü\1\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0¼\1autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs lua require'lsp_extensions'.inlay_hints{ prefix = ' Â» ', enabled = {\"ChainingHint\", \"ParameterHint\", \"TypeHint\"} }\bcmd\bvim\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/lsp_extensions.nvim"
  },
  ["lspsaga.nvim"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-toggle-terminal"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/nvim-toggle-terminal"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["splitjoin.vim"] = {
    keys = { { "", "gJ" }, { "", "gS" } },
    loaded = false,
    needs_bufread = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/opt/splitjoin.vim"
  },
  ["tabline.vim"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/tabline.vim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-fugitive"] = {
    commands = { "G" },
    loaded = false,
    needs_bufread = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/opt/vim-fugitive"
  },
  ["vim-hexokinase"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/vim-hexokinase"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/opt/vim-startuptime"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\1\2j\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\2\22auto_save_enabled\2\25auto_restore_enabled\2\nsetup\17auto-session\frequire\0", "config", "auto-session")
time([[Config for auto-session]], false)
-- Config for: lsp_extensions.nvim
time([[Config for lsp_extensions.nvim]], true)
try_loadstring("\27LJ\1\2Ü\1\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0¼\1autocmd InsertLeave,BufEnter,BufWinEnter,TabEnter,BufWritePost *.rs lua require'lsp_extensions'.inlay_hints{ prefix = ' Â» ', enabled = {\"ChainingHint\", \"ParameterHint\", \"TypeHint\"} }\bcmd\bvim\0", "config", "lsp_extensions.nvim")
time([[Config for lsp_extensions.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
vim.cmd [[command! -nargs=* -range -bang -complete=file G lua require("packer.load")({'vim-fugitive'}, { cmd = "G", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
vim.cmd [[command! -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]]
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> gJ <cmd>lua require("packer.load")({'splitjoin.vim'}, { keys = "gJ", prefix = "" }, _G.packer_plugins)<cr>]]
vim.cmd [[noremap <silent> gS <cmd>lua require("packer.load")({'splitjoin.vim'}, { keys = "gS", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
