-- ╔═══════════════════════╗
-- ║    Autocmds           ║
-- ╚═══════════════════════╝
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local fn = vim.fn
local general = augroup("General", { clear = true })
-- Hight when yanking
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- Disable noname buffer
local unlist_unnamed = function(data)
	local buf = data.buf
	if not (vim.api.nvim_buf_get_name(buf) == '' and vim.bo[buf].buflisted) then return end
	vim.bo[buf].buflisted = false
end

local unlist_unnamed_all = function()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		unlist_unnamed({ buf = buf })
	end
end

vim.api.nvim_create_autocmd({ 'BufAdd', 'BufFilePost' }, { callback = unlist_unnamed })
vim.api.nvim_create_autocmd({ 'VimEnter' }, { callback = unlist_unnamed_all })



-- Disable comment newline
autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove { "c", "r", "o" }
	end,
	group = general,
	desc = "Disable New Line Comment",
})
-- Return cursor last buffer location
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
	desc = 'return cursor to where it was last time closing the file',
	pattern = '*',
	command = 'silent! normal! g`"zv',
})
