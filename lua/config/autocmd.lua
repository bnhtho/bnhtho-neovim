-- ╔═══════════════════════╗
-- ║    Autocmds           ║
-- ╚═══════════════════════╝
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local fn = vim.fn
local general = augroup("General", { clear = true })
local indentSettings = vim.api.nvim_create_augroup("IndentSettings", { clear = true })
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


-- Floating diagnostic
vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end
})

-- Filetype Python
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		local options = vim.opt
		options.expandtab = true
		options.autoindent = true
	end,
	group = indentSettings,
})


-- need bufdelete.nvim, neo-tree & alpha-dashboard
local alpha_on_empty = vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
vim.api.nvim_create_autocmd("User", {
	pattern = "BDeletePost*",
	group = alpha_on_empty,
	callback = function(event)
		local current_buf = vim.api.nvim_get_current_buf()
		local current_ft = vim.api.nvim_buf_get_option(current_buf, "filetype")

		-- If the current buffer is displaying the Alpha dashboard, do not delete it
		if current_ft == "alpha" then
			return
		end
		local fallback_name = vim.api.nvim_buf_get_name(event.buf)
		local fallback_ft = vim.api.nvim_buf_get_option(event.buf, "filetype")
		local fallback_on_empty = fallback_name == "" and fallback_ft == ""

		if fallback_on_empty then
			require("neo-tree").close_all()
			vim.cmd("Alpha")
			vim.cmd(event.buf .. "bwipeout")
		end
	end,
})

vim.opt.clipboard = "unnamedplus"

if vim.fn.has("wsl") == 1 then
	vim.api.nvim_create_autocmd(
		"TextYankPost",
		{
			group = vim.api.nvim_create_augroup("Yank", { clear = true }),
			callback = function()
				vim.fn.system("clip.exe", vim.fn.getreg('"'))
			end
		}
	)
end
