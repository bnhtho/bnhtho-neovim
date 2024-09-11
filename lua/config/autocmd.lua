-- author:thohnb
-- autocmd.lua
-- Yank

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
      vim.highlight.on_yank()
    end,
  })
 
 
  vim.api.nvim_create_autocmd({
    "WinResized", -- or WinResized on NVIM-v0.9 and higher
    "BufWinEnter",
    "CursorHold",
    "InsertLeave",
  
    -- include this if you have set `show_modified` to `true`
    "BufModifiedSet",
  }, {
    group = vim.api.nvim_create_augroup("barbecue.updater", {}),
    callback = function()
      require("barbecue.ui").update()
    end,
  })


  vim.api.nvim_create_augroup("alpha_on_empty", { clear = true })
vim.api.nvim_create_autocmd("User", {
	pattern = "BDeletePre *",
	group = "alpha_on_empty",
	callback = function()
		local bufnr = vim.api.nvim_get_current_buf()
		local name = vim.api.nvim_buf_get_name(bufnr)

		if name == "" then
      vim.cmd("Dashboard")
		end
	end,
})

-- Create an augroup named 'numbertoggle' and clear it if it already exists
vim.api.nvim_create_augroup('numbertoggle', { clear = true })

-- Autocmd to enable relative number when entering a buffer, focus is gained, leaving insert mode, or entering a window
vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' }, {
  group = 'numbertoggle',
  pattern = '*',
  callback = function()
    if vim.wo.number and vim.fn.mode() ~= 'i' then
      vim.wo.relativenumber = true
    end
  end,
})

-- Autocmd to disable relative number when leaving a buffer, focus is lost, entering insert mode, or leaving a window
vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave' }, {
  group = 'numbertoggle',
  pattern = '*',
  callback = function()
    if vim.wo.number then
      vim.wo.relativenumber = false
    end
  end,
})
