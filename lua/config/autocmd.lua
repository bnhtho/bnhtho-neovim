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
