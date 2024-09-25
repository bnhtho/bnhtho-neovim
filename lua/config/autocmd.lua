-- author:thohnb
-- autocmd.lua
-- Yank
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- General Settings
local general = augroup("General", { clear = true })
---- Setup
vim.api.nvim_create_autocmd('TextYankPost', {
	desc = 'Highlight when yanking (copying) text',
	group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})


-- https://github.com/echasnovski/mini.nvim/discussions/33
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

vim.diagnostic.config({
	virtual_text = false
})

local ns = vim.api.nvim_create_namespace('CurlineDiag')
vim.opt.updatetime = 100
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(args)
		vim.api.nvim_create_autocmd('CursorHold', {
			buffer = args.buf,
			callback = function()
				pcall(vim.api.nvim_buf_clear_namespace, args.buf, ns, 0, -1)
				local hi = { 'Error', 'Warn', 'Info', 'Hint' }
				local curline = vim.api.nvim_win_get_cursor(0)[1]
				local diagnostics = vim.diagnostic.get(args.buf, { lnum = curline - 1 })
				local virt_texts = { { (' '):rep(4) } }
				for _, diag in ipairs(diagnostics) do
					virt_texts[#virt_texts + 1] = { diag.message, 'Diagnostic' .. hi[diag.severity] }
				end
				vim.api.nvim_buf_set_extmark(args.buf, ns, curline - 1, 0, {
					virt_text = virt_texts,
					hl_mode = 'combine'
				})
			end
		})
	end
})

-- Disable comment newline
autocmd("BufEnter", {
	callback = function()
		vim.opt.formatoptions:remove { "c", "r", "o" }
	end,
	group = general,
	desc = "Disable New Line Comment",
})
