-- Set showtabline based on buffer state
vim.api.nvim_create_autocmd({"BufAdd", "BufDelete"}, {
    callback = function()
      if #vim.fn.getbufinfo({buflisted = 1}) > 0 then
        vim.o.showtabline = 2 -- Show tabline if there are buffers
      else
        vim.o.showtabline = 0 -- Hide tabline if no buffers
      end
    end,
  })
  
  -- Define highlight groups
  -- Tabline Backgroun
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
  
  -- Custom tabline function with active buffer underline and coloring
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
  
  -- Keybinding to switch buffers using <Tab>
  vim.keymap.set("n", "<Tab>", ":bnext<CR>", { silent = true })
  vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { silent = true })
  