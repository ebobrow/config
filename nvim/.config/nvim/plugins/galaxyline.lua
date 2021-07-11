local gl = require('galaxyline')
local gls = gl.section
local condition = require('galaxyline.condition')
local colors = {
    bg = '#504945',
    yellow = '#fabd2f',
    cyan = '#8ec07c',
    darkblue = '#83a598',
    green = '#b8bb26',
    orange = '#fe8019',
    purple = '#d3869b',
    blue = '#83a598',
    red = '#fb4934',
    grey = '#282828'
}
gl.short_line_list = {'packer', 'term', 'netrw'}

local fileName = function()
    local file = vim.fn['fnamemodify'](vim.fn.expand("%"), ":~:.")
    if vim.fn.empty(file) == 1 then return '' end
    if vim.bo.readonly then
        return file .. " [-] "
    end
    if vim.bo.modifiable then
        if vim.bo.modified then
            return file .. ' [+]  '
        end
    end
    return file .. ' '
end

gls.left[1] = {
  FirstElement = {
    provider = function() return ' ' end,
    highlight = {colors.grey,colors.grey},
  },
}
gls.left[2] = {
    ViMode = {
        provider = function()
            local alias = {
                n = 'NORMAL ',
                i = 'INSERT ',
                c = 'COMMAND',
                v = 'VISUAL ',
                V = 'V·LINE ',
                [''] = 'V·BLOCK',
                R ='REPLACE',
                t ='TERMINAL'
            }
            local mode_color = {
                n = colors.red,
                i = colors.green,
                v=colors.blue,
                [''] = colors.blue,
                V=colors.blue,
                c = colors.purple,
                no = colors.red,
                s = colors.orange,
                S=colors.orange,
                [''] = colors.orange,
                ic = colors.yellow,
                R = colors.orange,
                Rv = colors.orange,
                cv = colors.red,
                ce=colors.red,
                r = colors.cyan,
                rm = colors.cyan,
                ['r?'] = colors.cyan,
                ['!']  = colors.red,
                t = colors.red
            }
            vim.api.nvim_command('hi GalaxyViMode guibg=#282828 gui=bold guifg='..mode_color[vim.fn.mode()])
            return alias[vim.fn.mode()].." "
        end,
    },
}

gls.mid[1] ={
    FileIcon = {
        provider = 'FileIcon',
        condition = condition.buffer_not_empty,
        -- highlight = {require('galaxyline.provider_fileinfo').get_file_icon_color,colors.bg},
        highlight = 'StatusLine'
    },
}

gls.mid[2] = {
    FileName = {
        provider = fileName,
        condition = condition.buffer_not_empty,
        highlight = 'StatusLine'
    }
}

gls.right[1] = {
    DiagnosticError = {
        provider = 'DiagnosticError',
        icon = '  ',
        -- highlight = {colors.red,colors.bg}
        highlight = 'StatusLine'
    }
}

gls.right[2] = {
  Sep = {
    provider = function() return '|' end,
    highlight = {colors.fg,colors.bg},
    -- condition = function()
    --     return diagnostic.get_diagnostic_error() == nil
    -- end
  },
}

gls.right[3] = {
    LineInfo = {
        provider = 'LineColumn',
        separator = '',
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.fg,colors.bg},
    },
}

gls.right[4] = {
    PerCent = {
        provider = function()
            local current_line = vim.fn.line('.')
            local total_line = vim.fn.line('$')
            -- if current_line == 1 then
            --     return ' Top '
            -- elseif current_line == vim.fn.line('$') then
            --     return ' Bot '
            -- end
            local result,_ = math.modf((current_line/total_line)*100)
            return string.format("%3d%% ", result)
        end,
        separator = '|',
        separator_highlight = {'NONE',colors.bg},
        highlight = {colors.fg,colors.bg,'bold'},
    }
}

gls.short_line_left[1] = {
    BufferType = {
        provider = fileName,
        highlight = 'StatusLineNC'
    }
}
