-- /lua/map.lua
-- ╔═══════════════════════╗
-- ║    Local Variables    ║
-- ╚═══════════════════════╝
local keymap = vim.keymap
local custom_key = require('config.utils')
local builtin = require('telescope.builtin')
-- ╔═══════════════════════╗
-- ║    Neovim Keybind     ║
-- ╚═══════════════════════╝

-- Moving around windows using s + h,j,k,l
keymap.set("n", "<leader>h", "<C-w>h", { desc = "Focus Left Window" })
keymap.set("n", "<leader>j", "<C-w>j", { desc = "Focus Lower Window" })
keymap.set("n", "<leader>k", "<C-w>k", { desc = "Focus Upper Window" })
keymap.set("n", "<leader>l", "<C-w>l", { desc = "Focus Right Window" })

-- Select All Text
keymap.set("n", "<leader>a", "gg<S-v>G", { desc = "Select All" })
-- keymap.set("n", "<C-s>", "silent ! wa'!<cr>", { desc = "Save File" })
keymap.set('n', '<C-s>', function()
	custom_key.custom_save()
end, { noremap = true, desc = "Save file" })

-- Split windows
keymap.set('n', 'sj', ':split<cr><C-w>w', { desc = "Split Down" })
keymap.set('n', 'sl', ':vsplit<cr><C-w>w', { desc = "Split Right" })

-- Buffers
keymap.set('n', 'H', '<cmd>:bprev<cr>', { noremap = false, silent = true }, { desc = "Switch To Last Buffer" })
keymap.set('n', 'L', '<cmd>:bnext<cr>', { noremap = false, silent = true }, { desc = "Switch To Next Buffer" })
vim.keymap.set("n", "W", function()
		-- Get the current buffer filetype
		local filetype = vim.api.nvim_buf_get_option(0, "filetype")

		-- If the current buffer is the Alpha dashboard, prevent deletion
		if filetype == "alpha" then
			return
		end

		-- Otherwise, delete the buffer
		require('bufdelete').bufdelete(0, true)
	end,
	{ noremap = true, silent = true, desc = "Delete Current Buffer" })

keymap.set("v", ">", ">gv")
keymap.set("v", "<", "<gv")

keymap.set("n", "D", "<Cmd>copy.<Cr>", { noremap = false, silent = true }, { desc = "Duplicate Lines in Normal Mode" })
keymap.set("x", "D", ":copy.-1<Cr>gv", { noremap = false, silent = true }, { desc = "Duplicate Lines in Visual Mode" })
if vim.o.wrap then
	keymap.set("n", "j", [[v:count ? 'j' : 'gj']], { expr = true })
	keymap.set("n", "k", [[v:count ? 'k' : 'gk']], { expr = true })
end
-- Disable q:
keymap.set('n', 'q:', function() end)

-- ╔═══════════════════════╗
-- ║    Telescope          ║
-- ╚═══════════════════════╝

keymap.set('n', '<leader><leader>', "<cmd>Telescope file_browser<cr>", { desc = 'Find Files in current buffer' })
keymap.set('n', '<leader>g', builtin.grep_string, { desc = 'Enable Grep String' })
keymap.set("n", "<leader>h", "<cmd>TodoTelescope<cr>", { desc = "Show Todo in Telescope" })
keymap.set('n', '<leader>o', '<cmd>:Telescope aerial<CR>', { desc = "Toggle Telescope Aerial" })
keymap.set('n', ':', ':Telescope cmdline<CR>', { noremap = true, desc = "Show Command Line", silent = true })
-- ╔═══════════════════════╗
-- ║    Tmux               ║
-- ╚═══════════════════════╝

keymap.set({ "n", "t" }, "<C-h>", "<CMD>NavigatorLeft<CR>")
keymap.set({ "n", "t" }, "<C-l>", "<CMD>NavigatorRight<CR>")
keymap.set({ "n", "t" }, "<C-k>", "<CMD>NavigatorUp<CR>")
keymap.set({ "n", "t" }, "<C-j>", "<CMD>NavigatorDown<CR>")

-- ╔═══════════════════════╗
-- ║    Other              ║
-- ╚═══════════════════════╝

-- Toggle Neotree/sidebar
keymap.set('n', '<leader>t', "<CMD>Neotree toggle <CR>")
-- Select highlight from drop box
keymap.set('n', '<leader>/', function()
	custom_key.pick_todo()
end, { noremap = true, desc = "Select Highlight From Box" })

keymap.set('n', '<leader>sn',
	function()
		require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' }
	end,
	{ noremap = true, desc = 'Search Neovim Config File' })
