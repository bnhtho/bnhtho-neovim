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




-- Format on save Format
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})
