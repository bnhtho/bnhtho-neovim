-- Disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
-- init.lua
require("config.lazy")
require("config.options")
require("config.autocmd")

require("config.statusline")
require("config.lspserver")