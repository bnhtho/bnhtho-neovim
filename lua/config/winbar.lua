
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
        bufname = "[No Name]"
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
    highlight! TabLineActive gui = underline
    
    " Thiết lập màu nền và màu chữ cho tab không hoạt động (tab không hiện tại)
    highlight! TabLineInactive ctermbg=NONE ctermfg=darkgray
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
  -- vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })