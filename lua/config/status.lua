-- author :thohnb
-- Ref:
-- https://github.com/serenevoid/nvim/blob/master/lua/void/statusline.lua
-- Custom Statusline
-- Statusline: Bottom
------------------------//SECTION: Color Definitions --------------------------

-- Gruvbox color palette
local colors = {
  fg1    = '#282828',  -- Dark background
  color2 = '#504945',  -- Light grey
  fg2    = '#ddc7a1',  -- Light foreground
  color3 = '#32302f',  -- Medium dark background
  color4 = '#a89984',  -- Beige
  color5 = '#7daea3',  -- Aqua green
  color6 = '#a9b665',  -- Green
  color7 = '#d8a657',  -- Yellow
  color8 = '#d3869b',  -- Pink
  color9 = '#ea6962',  -- Red
}

local mode_colors = {
  Normal = colors.color4,
  Insert = colors.color6,
  Visual = colors.color9,
  Replace = colors.color7,
  Command = colors.color5,
  Terminal = colors.color8,
}

------------------------//SECTION: Statusline Functions --------------------------

local tmux_status = require('tmux-status')
local diff = require('gitsigns')

-- Generates a section of the statusline
local function gen_section(items)
  local out = ""
  local bracket_left = " "
  local bracket_right = " "
  for _, item in pairs(items) do
    if item ~= "" and item ~= nil then
      item = tostring(item)
      if out == "" then
        out = item
      else
        out = out .. " " .. item
      end
    else
      bracket_left = ""
      bracket_right = ""
    end
  end
  return bracket_left .. out .. bracket_right
end

-- Maps vim modes to user-friendly names
local function get_mode_group(m)
  local mode_groups = {
    n = "Normal",
    v = "Visual",
    V = "Visual",
    ["CTRL-V"] = "Visual",
    i = "Insert",
    R = "Replace",
    c = "Command",
    t = "Terminal",
  }
  return mode_groups[m] or "None"
end

-- Display name for the mode group, formatted
local function get_mode_group_display_name(mg)
  return mg:upper()
end

-- Checks if the file has been modified
local function is_modified()
  if vim.bo.modified then
    if vim.bo.readonly then
      return "-"
    end
    return "+"
  end
  return ""
end

-- Retrieves git diff information
local function get_diff()
  local git_info = vim.b.gitsigns_status_dict
  if not git_info or git_info.head == "" then
    return ""
  end
  local added = git_info.added and ("%#GitSignsAdd#+" .. git_info.added .. " ") or ""
  local changed = git_info.changed and ("%#GitSignsChange#~" .. git_info.changed .. " ") or ""
  local removed = git_info.removed and ("%#GitSignsDelete#-" .. git_info.removed .. " ") or ""
  return table.concat {
    " ",
    added,
    changed,
    removed,
    " ",
    "%#GitSignsAdd# ",
    git_info.head,
    " %#Normal#",
  }
end

-- Checks if the file is read-only
local function is_readonly()
  if vim.bo.readonly then
    return "RO"
  end
  return ""
end

-- Retrieves the file icon
local function get_file_icon()
  return require("nvim-web-devicons").get_icon_by_filetype(vim.bo.filetype, { default = true })
end

-- Formats diagnostics with prefix
local function process_diagnostics(prefix, n)
  return prefix .. n
end

-- Retrieves LSP diagnostics
local function get_lsp_diagnostics(bufnr)
  local result = {}
  local levels = {
    errors = vim.diagnostic.severity.ERROR,
    warnings = vim.diagnostic.severity.WARN,
    info = vim.diagnostic.severity.INFO,
    hints = vim.diagnostic.severity.HINT,
  }
  for k, level in pairs(levels) do
    result[k] = #vim.diagnostic.get(bufnr, { severity = level })
  end
  return result
end

-- Sets up diagnostics section
local function setup_diagnostics()
  local diagnostics = get_lsp_diagnostics(0)
  local errors = diagnostics.errors
  local warnings = diagnostics.warnings
  if errors == 0 and warnings == 0 then
    return ""
  else
    return table.concat{
      process_diagnostics(" ", errors),
      process_diagnostics("  ", warnings),
    }
  end
end

-- Sets up Tmux status
local function setup_tmux()
  local tmux_status_output = tmux_status.show() or ""
  return tostring(tmux_status_output)
end

-- Main function to generate the statusline
function Status_line()
  local mode = vim.fn.mode()
  local mode_group = get_mode_group(mode)
  local mode_color = mode_colors[mode_group] or colors.color4

  -- Highlight the mode group
  vim.api.nvim_command('hi StatusLineMode guifg=' .. mode_color .. ' guibg=NONE')

  return table.concat({
    "%#StatusLineMode#",  -- Set mode-specific color
    gen_section({ get_mode_group_display_name(mode_group) }),
    " ",
    gen_section({ get_diff() or "" }),
    "%=",
    gen_section({ setup_diagnostics() }),
    " ",
    gen_section({ setup_tmux() }),
    gen_section({ "Ln %l, Col %c" }),
  })
end

vim.o.statusline = "%!luaeval('Status_line()')"

-----------------------------------------------------------------

----------------------- //SECTION: Winbar -------------------
-- Show tabline on full screen
function custom_tabline()
  -- Get the list of listed buffers
  local buffers = vim.fn.getbufinfo({buflisted = 1})
  -- Get the current buffer number
  local current_buf = vim.fn.bufnr('%')
  local tabline = ""
  -- print(#buffers)
  -- Check if there are no buffers; if so, switch to MiniStarter

  for _, buf in ipairs(buffers) do
    local bufname = vim.fn.fnamemodify(buf.name, ":t")
    -- Get icon before file name
    local icon, icon_color = require("nvim-web-devicons").get_icon(bufname, vim.bo[buf.bufnr].filetype, { default = true })
    icon = icon or ''
    local function icons()
      return icon .. " "
    end
    
  
    -- Style the active buffer with underline
    if bufname == "" then
      return ""
    end
    if buf.bufnr == current_buf then
      tabline = tabline .. "%#TabLineActive# " .. icons() .. bufname .. " %#TabLine#"
    else
      tabline = tabline .. "%#TabLineInActive# " .. icons() .. bufname .. " %#TabLine#"
    end
  end

  return tabline
end

-- Set the tabline to use the custom function
vim.o.tabline = "%!v:lua.custom_tabline()"
