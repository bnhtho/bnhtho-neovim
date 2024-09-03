--author :thohnb
-- LSP server
local lspconfig = require('lspconfig')
--
local capabilities = require('cmp_nvim_lsp').default_capabilities()
--
local on_attach = function(client, bufnr)
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local opts = { noremap = true, silent = true }
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
    buf_set_keymap('n', '<leader>.', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
    buf_set_keymap('n', '<leader>/', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<cr>', opts)
  end
--
-- Python
lspconfig.pyright.setup{
    on_attach = on_attach,
    capabilities = capabilities
}
-- C++
lspconfig.clangd.setup{
    on_attach = on_attach,
    capabilities = capabilities
}
