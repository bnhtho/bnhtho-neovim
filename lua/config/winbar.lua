-- Show only path file on smaller screen
  local winbar_filetype_exclude = {
    "help",
    "startify",
    "dashboard",
    "packer",
    "neogitstatus",
    "NvimTree",
    "Trouble",
    "alpha",
    "lir",
    "Outline",
    "spectre_panel",
    "toggleterm",
}

-- #4A3E4B
vim.api.nvim_set_hl(0, 'WinBarPath', { bg = '#4A3E4B', fg = '#C1ADC4' })
vim.api.nvim_set_hl(0, 'WinBarModified', { bg = '#dedede', fg = '#ff3838' })

function show_path()

    if vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
        return ""
    end

    local file_path = vim.api.nvim_eval_statusline('%F', {}).str
    -- local modified = vim.api.nvim_eval_statusline('%M', {}).str == '+' and '⊚' or ''
    local modified = vim.api.nvim_eval_statusline('%m', {}).str
    local buffer_number = vim.api.nvim_eval_statusline('%n', {}).str
    local last_change = vim.fn.strftime('%a, %b %d %Y - %H:%M', vim.fn.getftime(vim.fn.expand('%')))

    file_path = file_path:gsub('/', ' ➤ ')
    file_path = file_path:gsub('~', ' $HOME')

    return '%#WinBarPath#'
     .. ' [' .. buffer_number .. '] '
     .. file_path .. ' '
     .. '%*'
     -- .. '%#WinBarModified#'
     .. ' ' .. modified
     .. '%*'
     .. 'Modified: ' .. last_change
end
  
-- Show tabline on full screen
function custom_tabline()
    local buffers = vim.fn.getbufinfo({buflisted = 1})
    local current_buf = vim.fn.bufnr('%') -- Get the current buffer number
    local tabline = ""
  
    for _, buf in ipairs(buffers) do
      local bufname = vim.fn.fnamemodify(buf.name, ":t")
      if bufname == "" then
        bufname = "[No Name]"
      end
  
      -- Style the active buffer with underline
      if buf.bufnr == current_buf then
        tabline = tabline .. "%#TabLineActive# " .. bufname .. " %#TabLine#"
      else
        tabline = tabline .. "%#TabLineInactive# " .. bufname .. " %#TabLine#"
      end
    end
  
    return tabline
  end
  
  -- Set the custom tabline
  vim.o.tabline = "%!v:lua.custom_tabline()"
  -- Định nghĩa các nhóm highlight với màu sắc đã cập nhật
vim.cmd([[
    " Thiết lập màu nền và màu chữ cho TabLine tổng quát
    highlight! TabLine ctermbg=none ctermfg=none
    
    " Thiết lập màu nền cho không gian không có tab (nơi không có tab hiển thị)
    highlight! TabLineFill ctermbg=black ctermfg=none
    
    " Thiết lập màu nền và màu chữ cho tab đang được chọn (tab hiện tại)
    highlight! TabLineSel ctermbg=blue ctermfg=white
    
    " Thiết lập màu nền và màu chữ cho tab đang hoạt động (tab hiện tại)
    highlight! TabLineActive cterm=underline gui = underline
    
    " Thiết lập màu nền và màu chữ cho tab không hoạt động (tab không hiện tại)
    highlight! TabLineInactive ctermbg=NONE ctermfg=white
  ]])
---
vim.api.nvim_create_autocmd(
    {"BufAdd", "BufDelete","VimResized"},
    {
        group = wr_group,
        pattern = '*',
        callback = function()

          local width = vim.api.nvim_win_get_width(0)
           -- if screen is 51(smallest), set windows
          if width == 51  then 
            vim.o.showtabline = 0
          else
            -- When screen is big
            vim.o.showtabline = 3
            custom_tabline()
          end
        end
    }
)
--   -- Keybinding to switch buffers using <Tab>
  vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
  vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })