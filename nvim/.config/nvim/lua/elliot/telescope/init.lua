local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local action_mt = require "telescope.actions.mt"
local sorters = require "telescope.sorters"
local themes = require "telescope.themes"

require"telescope".setup {
  defaults = {
    color_devicons = false,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<Up>"] = actions.cycle_history_prev,
        ["<Down>"] = actions.cycle_history_next,
        ["<C-s>"] = actions.select_horizontal
      },
      n = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous
      }
    },
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new
  }
}

require("telescope").load_extension("fzy_native")

local M = {}

function M.lsp_code_actions()
  require("telescope.builtin").lsp_code_actions(themes.get_cursor {
    layout_config = { width = 0.25 }
  })
end

function M.files()
  if not pcall(require("telescope.builtin").git_files) then
    require("telescope.builtin").find_files { hidden = true }
  end
end

function M.builtin()
  require("telescope.builtin").builtin(themes.get_dropdown { previewer = false })
end

function M.live_grep() require("telescope.builtin").live_grep(themes.get_ivy {}) end

function M.grep_prompt()
  require("telescope.builtin").grep_string(themes.get_ivy {
    search = vim.fn.input "> "
  })
end

function M.buffers() require("telescope.builtin").buffers() end

return setmetatable({}, {
  __index = function(_, k)
    local has_custom, custom = pcall(require, string.format(
                                         "elliot.telescope.custom.%s", k))

    if M[k] then
      return M[k]
    elseif has_custom then
      return custom
    else
      return require("telescope.builtin")[k]
    end
  end
})
