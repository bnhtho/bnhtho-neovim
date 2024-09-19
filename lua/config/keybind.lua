-- /lua/map.lua

local keymap = vim.keymap
local snap = require("snap")
keymap.set("n", "<leader>a", "gg<S-v>G")

-- Moving around windows using s + h,j,k,l
keymap.set("n", "<leader>h", "<C-w>h")
keymap.set("n", "<leader>j", "<C-w>j")
keymap.set("n", "<leader>k", "<C-w>k")
keymap.set("n", "<leader>l", "<C-w>l")

-- Split windows
keymap.set("n", "sj", ":split<cr><C-w>w")
keymap.set("n", "sl", ":vsplit<cr><C-w>w")

-- Save file
keymap.set("n", "<C-s>", ":w<cr>")

-- Move lines and group lines left, right
keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")

-- Keymap
keymap.set({"n", "t"}, "<C-h>", "<CMD>NavigatorLeft<CR>")
keymap.set({"n", "t"}, "<C-l>", "<CMD>NavigatorRight<CR>")
keymap.set({"n", "t"}, "<C-k>", "<CMD>NavigatorUp<CR>")
keymap.set({"n", "t"}, "<C-j>", "<CMD>NavigatorDown<CR>")
-- Tab

-- Buffer Switch to last edit
-- vim.keymap.set('n', '<S-Tab>', '<cmd>:buffer#<cr>', { noremap = true, silent = false })

keymap.set("n","<leader>w","<CMD>bdelete<cr>")

keymap.set("n", "D", "<Cmd>copy.<Cr>")
keymap.set("x", "<C-d>", ":copy.-1<Cr>gv")
-- J
if vim.o.wrap then
    keymap.set("n", "j", [[v:count ? 'j' : 'gj']], {expr = true})
    keymap.set("n", "k", [[v:count ? 'k' : 'gk']], {expr = true})
end


function toggle_live_grep()
    require'snap'.run {
      producer = require'snap'.get'producer.ripgrep.vimgrep',
      select = require'snap'.get'select.vimgrep'.select,
      multiselect = require'snap'.get'select.vimgrep'.multiselect,
      views = {require'snap'.get'preview.vimgrep'}
    }
  end

keymap.set('n', '<leader>g', ':lua toggle_live_grep()<CR>')

keymap.set('n', 'q:', function() end)
keymap.set('n', '<leader>t', "<CMD>Neotree toggle <CR>")
-- Delete floating windows
keymap.set('n', '<ESC>', "<C-w>o")

-- Toggle terminal
keymap.set('n','<leader>`',"<CMD>ToggleTerm<CR>")

keymap.set('c', '<Down>', '<C-n>', { noremap = true, silent = true })
keymap.set('c', '<Up>', '<C-p>', { noremap = true, silent = true })

-- Function to switch to an existing buffer or create a new one
function switch_or_create_buffer()
  vim.ui.input({
    prompt = "Buffer: ",
    completion = "buffer"  -- Enable command-line completion
  }, function(input)
    if not input or input == "" then return end

    local buffer_exists = false
    local buffer_name = vim.fn.expand(input) -- Expand to handle path characters
    local buffer_id = nil

    -- Check if the buffer exists
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf) == buffer_name then
        buffer_exists = true
        buffer_id = buf
        break
      end
    end

    -- If buffer exists, focus on it
    if buffer_exists then
      local buffer_in_split = false
      
      -- Check if buffer is already in a split window
      for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_buf(win) == buffer_id then
          -- Buffer is in a split; focus on this window
          vim.api.nvim_set_current_win(win)
          buffer_in_split = true
          break
        end
      end

      -- If the buffer is not in a split window, switch to it in a new split
      if not buffer_in_split then
        vim.cmd('b ' .. buffer_name)
      end
    else
      -- If buffer does not exist, create a new buffer
      local new_buf = vim.api.nvim_create_buf(false, true)
      vim.api.nvim_buf_set_name(new_buf, buffer_name)
      -- Open a new split window for the new buffer
      vim.cmd('new')
      vim.api.nvim_set_current_buf(new_buf)
    end
  end)
end

-- Map <Tab> to trigger buffer switching with autocomplete
vim.keymap.set('n', '<Tab>', [[:lua switch_or_create_buffer()<CR>]], { noremap = true, silent = false })
vim.opt.wildcharm = vim.fn.char2nr('\26')
