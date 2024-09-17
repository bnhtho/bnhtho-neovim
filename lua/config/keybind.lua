-- /lua/map.lua

local keymap = vim.keymap
local snap = require("snap")
local current_filetype = vim.api.nvim_buf_get_option(0, 'filetype')
keymap.set("n", "<leader>a", "gg<S-v>G")
-- keymap.set("n", "<leader>t", "<Cmd>:Neotree toggle<CR>")

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
-- do somthing else

-- Move lines and group lines left, right
keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")

-- Keymap
keymap.set({"n", "t"}, "<C-h>", "<CMD>NavigatorLeft<CR>")
keymap.set({"n", "t"}, "<C-l>", "<CMD>NavigatorRight<CR>")
keymap.set({"n", "t"}, "<C-k>", "<CMD>NavigatorUp<CR>")
keymap.set({"n", "t"}, "<C-j>", "<CMD>NavigatorDown<CR>")

-- Tab
-- keymap.set("n", "<Tab>", ":bnext<CR>", {silent = true})
keymap.set("n","<leader>w",":Bdelete<CR>")
--
keymap.set("n", "D", "<Cmd>copy.<Cr>")
keymap.set("x", "<C-d>", ":copy.-1<Cr>gv")
-- J
if vim.o.wrap then
    keymap.set("n", "j", [[v:count ? 'j' : 'gj']], {expr = true})
    keymap.set("n", "k", [[v:count ? 'k' : 'gk']], {expr = true})
end


-- 
-- Function to toggle live grep using Snap
function toggle_live_grep()
    print(current_filetype)
    require'snap'.run {
      producer = require'snap'.get'producer.ripgrep.vimgrep',
      select = require'snap'.get'select.vimgrep'.select,
      multiselect = require'snap'.get'select.vimgrep'.multiselect,
      views = {require'snap'.get'preview.vimgrep'}
    }
  end

  -- Set keybind to toggle FZF find files
-- vim.api.nvim_set_keymap('n', '<leader>f', ':lua toggle_find_files()<CR>', { noremap = true, silent = true })

-- Optional: Set keybind to toggle live grep
vim.api.nvim_set_keymap('n', '<leader>g', ':lua toggle_live_grep()<CR>', { noremap = true, silent = true })


vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})




local function toggle_neotree()
  -- @usage: Detect current dashboard _filetype
  local current_filetype = vim.api.nvim_buf_get_option(0, 'filetype')
  print(current_filetype)
  if current_filetype == 'dashboard' then
    -- Delete the buffer if it is a dashboard
    vim.cmd("bdelete")
    -- Reveal the neotree
    vim.cmd("Neotree reveal")
  else
    -- Toggle neotree normally
    vim.cmd("Neotree toggle")
  end
end


vim.keymap.set("n", "<leader>t", toggle_neotree, { noremap = true, silent = true })