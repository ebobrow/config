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
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\2ß\6\0\0\4\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\b\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\2:\2\t\1>\0\2\1G\0\1\0\fkeymaps\1\0\0\tn [c\1\2\1\0J&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>zz'\texpr\2\tn ]c\1\0\n\17n <leader>gU8<cmd>lua require\"gitsigns\".reset_buffer_index()<CR>\17n <leader>gr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\17n <leader>gb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\to ig::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\tx ig::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\17n <leader>gp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17n <leader>gS2<cmd>lua require\"gitsigns\".stage_buffer()<CR>\17n <leader>gu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\17n <leader>gs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\17n <leader>gR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\1\2\1\0J&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>zz'\texpr\2\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\1\2ý\3\0\0\3\0\f\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0:\2\t\0013\2\n\0:\2\v\1>\0\2\1G\0\1\0\23rename_action_keys\1\0\2\tquit\n<C-c>\texec\t<CR>\21code_action_keys\1\0\2\tquit\6q\texec\t<CR>\23finder_action_keys\1\0\6\tquit\6q\16scroll_down\n<C-f>\vvsplit\6s\topen\6o\14scroll_up\n<C-b>\nsplit\6i\23code_action_prompt\1\0\4\18sign_priority\3\20\17virtual_text\1\tsign\2\venable\1\1\0\a\28definition_preview_icon\nï”¸  \17border_style\vsingle\25rename_prompt_prefix\6>\26finder_reference_icon\nïŒ‘  \29use_saga_diagnostic_sign\1\22max_preview_lines\3\n\27finder_definition_icon\nïŒ‘  \18init_lsp_saga\flspsaga\frequire\0" },
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
  ["nvim-treesitter"] = {
    config = { "\27LJ\1\2°\1\0\0\3\0\b\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\1>\0\2\1G\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\b\0\0\trust\ttoml\thtml\15typescript\btsx\blua\fhaskell\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["onedark.nvim"] = {
    config = { '\27LJ\1\2³\2\0\0\3\0\v\0\0294\0\0\0007\0\1\0%\1\2\0>\0\2\0014\0\0\0007\0\1\0%\1\3\0>\0\2\0014\0\0\0007\0\1\0%\1\4\0>\0\2\0014\0\0\0007\0\5\0007\0\6\0%\1\a\0%\2\b\0>\0\3\0014\0\0\0007\0\1\0%\1\t\0>\0\2\0014\0\0\0007\0\5\0007\0\6\0%\1\n\0)\2\2\0>\0\3\1G\0\1\0\18termguicolors highlight Normal guibg=none\tdark\15background\20nvim_set_option\bapi\24colorscheme onedark+let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"+let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"\bcmd\bvim\0' },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/onedark.nvim"
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
  ["rust-tools.nvim"] = {
    config = { "\27LJ\1\2<\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\15rust-tools\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/opt/rust-tools.nvim"
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
    config = { "\27LJ\1\2ý\a\0\0\a\0(\0j4\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0002\4\0\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\6\0%\3\a\0002\4\0\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\b\0%\3\t\0002\4\0\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\n\0%\3\v\0002\4\0\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\f\0%\3\r\0002\4\0\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\14\0%\3\15\0002\4\0\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\16\0%\3\17\0002\4\0\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\18\0%\3\19\0002\4\0\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\20\0%\3\21\0002\4\0\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\22\0%\3\23\0002\4\0\0>\0\5\0014\0\24\0%\1\25\0>\0\2\0024\1\24\0%\2\26\0>\1\2\0027\1\27\0013\2&\0003\3$\0003\4!\0003\5\29\0007\6\28\0:\6\30\0057\6\31\0:\6 \5:\5\"\0043\5#\0007\6\28\0:\6\30\0057\6\31\0:\6 \5:\5\3\4:\4%\3:\3'\2>\1\2\1G\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\1\0\0\6i\1\0\0\n<C-k>\28move_selection_previous\n<C-j>\1\0\0\24move_selection_next\nsetup\14telescope\22telescope.actions\frequire\31<cmd>Telescope builtin<CR>\14<leader>T\"<cmd>Telescope git_status<CR>\15<leader>gg#<cmd>Telescope git_commits<CR>\15<leader>gc1<cmd>Telescope lsp_workspace_diagnostics<CR>\15<leader>xw0<cmd>Telescope lsp_document_diagnostics<CR>\15<leader>xd <cmd>Telescope quickfix<cr>\15<leader>xx&<cmd>Telescope lsp_references<CR>\15<leader>gr!<cmd>Telescope live_grep<CR>\15<leader>rg\31<cmd>Telescope buffers<CR>\14<leader>b!<cmd>Telescope git_files<CR>\14<leader>f\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/elliotbobrow/.local/share/nvim/site/pack/packer/start/vim-fugitive"
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
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\1\2ý\a\0\0\a\0(\0j4\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\4\0%\3\5\0002\4\0\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\6\0%\3\a\0002\4\0\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\b\0%\3\t\0002\4\0\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\n\0%\3\v\0002\4\0\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\f\0%\3\r\0002\4\0\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\14\0%\3\15\0002\4\0\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\16\0%\3\17\0002\4\0\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\18\0%\3\19\0002\4\0\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\20\0%\3\21\0002\4\0\0>\0\5\0014\0\0\0007\0\1\0007\0\2\0%\1\3\0%\2\22\0%\3\23\0002\4\0\0>\0\5\0014\0\24\0%\1\25\0>\0\2\0024\1\24\0%\2\26\0>\1\2\0027\1\27\0013\2&\0003\3$\0003\4!\0003\5\29\0007\6\28\0:\6\30\0057\6\31\0:\6 \5:\5\"\0043\5#\0007\6\28\0:\6\30\0057\6\31\0:\6 \5:\5\3\4:\4%\3:\3'\2>\1\2\1G\0\1\0\rdefaults\1\0\0\rmappings\1\0\0\1\0\0\6i\1\0\0\n<C-k>\28move_selection_previous\n<C-j>\1\0\0\24move_selection_next\nsetup\14telescope\22telescope.actions\frequire\31<cmd>Telescope builtin<CR>\14<leader>T\"<cmd>Telescope git_status<CR>\15<leader>gg#<cmd>Telescope git_commits<CR>\15<leader>gc1<cmd>Telescope lsp_workspace_diagnostics<CR>\15<leader>xw0<cmd>Telescope lsp_document_diagnostics<CR>\15<leader>xd <cmd>Telescope quickfix<cr>\15<leader>xx&<cmd>Telescope lsp_references<CR>\15<leader>gr!<cmd>Telescope live_grep<CR>\15<leader>rg\31<cmd>Telescope buffers<CR>\14<leader>b!<cmd>Telescope git_files<CR>\14<leader>f\6n\20nvim_set_keymap\bapi\bvim\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: auto-session
time([[Config for auto-session]], true)
try_loadstring("\27LJ\1\2j\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\2\22auto_save_enabled\2\25auto_restore_enabled\2\nsetup\17auto-session\frequire\0", "config", "auto-session")
time([[Config for auto-session]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\1\2ý\3\0\0\3\0\f\0\0154\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\0013\2\6\0:\2\a\0013\2\b\0:\2\t\0013\2\n\0:\2\v\1>\0\2\1G\0\1\0\23rename_action_keys\1\0\2\tquit\n<C-c>\texec\t<CR>\21code_action_keys\1\0\2\tquit\6q\texec\t<CR>\23finder_action_keys\1\0\6\tquit\6q\16scroll_down\n<C-f>\vvsplit\6s\topen\6o\14scroll_up\n<C-b>\nsplit\6i\23code_action_prompt\1\0\4\18sign_priority\3\20\17virtual_text\1\tsign\2\venable\1\1\0\a\28definition_preview_icon\nï”¸  \17border_style\vsingle\25rename_prompt_prefix\6>\26finder_reference_icon\nïŒ‘  \29use_saga_diagnostic_sign\1\22max_preview_lines\3\n\27finder_definition_icon\nïŒ‘  \18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: onedark.nvim
time([[Config for onedark.nvim]], true)
try_loadstring('\27LJ\1\2³\2\0\0\3\0\v\0\0294\0\0\0007\0\1\0%\1\2\0>\0\2\0014\0\0\0007\0\1\0%\1\3\0>\0\2\0014\0\0\0007\0\1\0%\1\4\0>\0\2\0014\0\0\0007\0\5\0007\0\6\0%\1\a\0%\2\b\0>\0\3\0014\0\0\0007\0\1\0%\1\t\0>\0\2\0014\0\0\0007\0\5\0007\0\6\0%\1\n\0)\2\2\0>\0\3\1G\0\1\0\18termguicolors highlight Normal guibg=none\tdark\15background\20nvim_set_option\bapi\24colorscheme onedark+let &t_8b = "\\<Esc>[48;2;%lu;%lu;%lum"+let &t_8f = "\\<Esc>[38;2;%lu;%lu;%lum"\bcmd\bvim\0', "config", "onedark.nvim")
time([[Config for onedark.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\1\2°\1\0\0\3\0\b\0\v4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\0013\2\6\0:\2\a\1>\0\2\1G\0\1\0\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\b\0\0\trust\ttoml\thtml\15typescript\btsx\blua\fhaskell\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\1\2ß\6\0\0\4\0\n\0\r4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\b\0003\2\4\0003\3\3\0:\3\5\0023\3\6\0:\3\a\2:\2\t\1>\0\2\1G\0\1\0\fkeymaps\1\0\0\tn [c\1\2\1\0J&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>zz'\texpr\2\tn ]c\1\0\n\17n <leader>gU8<cmd>lua require\"gitsigns\".reset_buffer_index()<CR>\17n <leader>gr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\17n <leader>gb4<cmd>lua require\"gitsigns\".blame_line(true)<CR>\to ig::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\tx ig::<C-U>lua require\"gitsigns.actions\".select_hunk()<CR>\17n <leader>gp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\17n <leader>gS2<cmd>lua require\"gitsigns\".stage_buffer()<CR>\17n <leader>gu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\17n <leader>gs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\17n <leader>gR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\1\2\1\0J&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>zz'\texpr\2\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
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
