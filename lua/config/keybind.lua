-- /lua/map.lua

local keymap = vim.keymap
local snap = require("snap")
keymap.set("n", "<leader>a", "gg<S-v>G")
keymap.set("n", "<leader>t", "<Cmd>:Neotree toggle show<CR>")

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
keymap.set("n", "<Tab>", ":bnext<CR>", {silent = true})
keymap.set("n","<leader>w",":Bdelete<CR>")
--
keymap.set("n", "D", "<Cmd>copy.<Cr>")
keymap.set("x", "<C-d>", ":copy.-1<Cr>gv")
-- J
if vim.o.wrap then
    keymap.set("n", "j", [[v:count ? 'j' : 'gj']], {expr = true})
    keymap.set("n", "k", [[v:count ? 'k' : 'gk']], {expr = true})
end

-- Function to toggle FZF find files using Snap
-- Function to toggle FZF find files using Snap with centered screen
function toggle_find_files()
    require "snap".run {
        prompt = '🔎',
        -- Set layout to center the Snap window
        layout = function()
            local lines = vim.api.nvim_get_option("lines")
            local columns = vim.api.nvim_get_option("columns")
            local height = math.floor(lines * 0.2) -- Set height to 50% of total lines
            local width = math.floor(columns * 0.4) -- Set width to 70% of total columns
            -- Calculate row and col to center the window
            local row = math.floor((lines - height) / 2) -- Center vertically
            local col = math.floor((columns - width) / 2) -- Center horizontally
            return {col = col, row = row, height = height, width = width}
        end,
        producer = require "snap".get "consumer.fzf"(require "snap".get "producer.ripgrep.file"),
        select = require "snap".get "select.file".select,
        multiselect = require "snap".get "select.file".multiselect
    }
end

-- Function to toggle live grep using Snap with centered screen
function toggle_live_grep()
    require "snap".run {
        -- Optional: Add layout configuration if you want to center this window too
        layout = function()
            local lines = vim.api.nvim_get_option("lines")
            local columns = vim.api.nvim_get_option("columns")
            local height = math.floor(lines * 0.5)
            local width = math.floor(columns * 0.8)
            local row = math.floor((lines - height) / 2)
            local col = math.floor((columns - width) / 2)
            return {col = col, row = row, height = height, width = width}
        end,
        producer = require "snap".get "producer.ripgrep.vimgrep",
        select = require "snap".get "select.vimgrep".select,
        multiselect = require "snap".get "select.vimgrep".multiselect,
        views = {require "snap".get "preview.vimgrep"}
    }
end

-- Keybindings
vim.api.nvim_set_keymap("n", "<leader>f", ":lua toggle_find_files()<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<leader>g", ":lua toggle_live_grep()<CR>", {noremap = true, silent = true})
