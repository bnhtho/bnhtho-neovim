-- author :thohnb
-- Ref:
-- https://github.com/serenevoid/nvim/blob/master/lua/void/statusline.lua
-- Custom Statusline
-- Statusline: Bottom
------------------------//SECTION: Global StatusLine --------------------------

local tmux_status = require('tmux-status')  -- Make sure tmux-status is properly required
local diff = require('gitsigns')
local function gen_section(items)
  local out = ""
  local bracket_left = " "
  local bracket_right = " "
  for _, item in pairs(items) do
    if item ~= "" and item ~= nil then
      item = tostring(item)  -- Ensure item is a string
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

-- Sensibly group the vim modes
local function get_mode_group(m)
  local mode_groups = {
    n = "Normal",
    no = "Nop",
    nov = "Nop",
    noV = "Nop",
    ["noCTRL-V"] = "Nop",
    niI = "Normal",
    niR = "Normal",
    niV = "Normal",
    v = "Visual",
    V = "Visual",
    ["CTRL-V"] = "Visual",
    s = "Select",
    S = "Select",
    ["CTRL-S"] = "Select",
    i = "Insert",
    ic = "Insert",
    ix = "Insert",
    R = "Replace",
    Rc = "Replace",
    Rv = "Replace",
    Rx = "Replace",
    c = "Command",
    cv = "Command",
    ce = "Command",
    r = "Prompt",
    rm = "Prompt",
    ["r?"] = "Prompt",
    ["!"] = "Shell",
    t = "Terminal",
    ["null"] = "None",
  }
  return mode_groups[m] or "None"
end

-- Get the display name for the group
local function get_mode_group_display_name(mg)
  return mg:upper()
end

-- Whether the file has been modified
local function is_modified()
  if vim.bo.modified then
    if vim.bo.readonly then
      return "-"
    end
    return "+"
  end
  return ""
end

-- Get Git diff information
local function get_diff()
  local git_info = vim.b.gitsigns_status_dict
  if not git_info or git_info.head == "" then
    return ""
  end
  local added = git_info.added and ("%#GitSignsAdd#+" .. git_info.added .. " ") or ""
  local changed = git_info.changed and ("%#GitSignsChange#~" .. git_info.changed .. " ") or ""
  local removed = git_info.removed and ("%#GitSignsDelete#-" .. git_info.removed .. " ") or ""
  if git_info.added == 0 then
    added = ""
  end
  if git_info.changed == 0 then
    changed = ""
  end
  if git_info.removed == 0 then
    removed = ""
  end
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

-- Whether the file is read-only
local function is_readonly()
  if vim.bo.readonly then
    return "RO"
  end
  return ""
end

local function get_file_icon()
  return require("nvim-web-devicons").get_icon_by_filetype(vim.bo.filetype, { default = true })
end

local function process_diagnostics(prefix, n)
  local out = prefix .. n
  return out
end

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

local function setup_tmux()
  local tmux_status_output = tmux_status.show() or ""
  return tostring(tmux_status_output)  -- Ensure tmux status is a string
end

function Status_line()
  local mode = vim.fn.mode()
  local mg = get_mode_group(mode)

  return table.concat({
    gen_section({ get_mode_group_display_name(mg) }),
    " ",
    -- Git diff
    gen_section({ get_diff() or "" }),
    "%=",
    gen_section({ setup_diagnostics() }),
    " ",
    -- tmux section
    gen_section({ setup_tmux() }),
    -- " ",
   
    gen_section({ "Ln %l, Col %c" }),
  })
end

vim.o.statusline = "%!luaeval('Status_line()')"
-----------------------------------------------------------------

----------------------- //SECTION: Winbar -------------------
-- Show tabline on full screen
function custom_tabline()
  local buffers = vim.fn.getbufinfo({buflisted = 1})
  local current_buf = vim.fn.bufnr('%') -- Get the current buffer number
  local tabline = ""

  for _, buf in ipairs(buffers) do
    local bufname = vim.fn.fnamemodify(buf.name, ":t")
    -- i stuck here. Want to get icon before file
    local icon, icon_color = require("nvim-web-devicons").get_icon(bufname, vim.bo[buf.bufnr].filetype, { default = true })
      icon = icon or ''
      local function icons()
          return icon .. " "
      end
    if bufname == "" then
      return ""
    end

    -- Style the active buffer with underline
    if buf.bufnr == current_buf then
      tabline = tabline .. "%#TabLineActive# " ..icons() ..bufname.. " %#TabLine#"
    else
      tabline = tabline .. "%#TabLineInActive# " ..icons() ..bufname.. " %#TabLine#"
    end
  end

  return tabline
end

vim.o.tabline = "%!v:lua.custom_tabline()"
