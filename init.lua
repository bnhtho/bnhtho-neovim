-- ╔═══════════════════════╗
-- ║    Init               ║
-- ╚═══════════════════════╝
-- Disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1
-- Show winbar nvim full path

require("config.lazy")
require("config.options")
require("config.autocmd")
require("config.keybind")
require("config.highlight")
require("config.lspconfig")

