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

