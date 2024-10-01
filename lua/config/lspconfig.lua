-- ╔═══════════════════════╗
-- ║ LSP Configuration     ║
-- ╚═══════════════════════╝


local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr }
	-- ╔═══════════════════════╗
	-- ║ 	Keybind            ║
	-- ╚═══════════════════════╝
	local map = vim.keymap.set
	map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
	map("n", "K", vim.lsp.buf.hover, opts)
	map('n', '<space>q', vim.diagnostic.setloclist, opts)
	-- diagnostic
	map('n', 'dK', "<Cmd>lua MiniBracketed.diagnostic('first')<CR>")
	map('n', 'dk', "<Cmd>lua MiniBracketed.diagnostic('backward')<CR>")
	map('n', 'dj', "<Cmd>lua MiniBracketed.diagnostic('forward')<CR>")
	map('n', 'dJ', "<Cmd>lua MiniBracketed.diagnostic('last')<CR>")
end

local servers = { "pylsp", "clangd", "marksman", "lua_ls", "sqlls" }
for _, server in ipairs(servers) do
	lspconfig[server].setup {
		capabilities = capabilities,
		on_attach = on_attach,
		handlers = {
			["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" }),
			["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" }),
		}
	}
end
-- ╔═══════════════════════╗
-- ║ Other                 ║
-- ╚═══════════════════════╝
-- Disable virtual text
vim.diagnostic.config({
	virtual_text = false,
	float = { border = "rounded" },
})
local signs = { Error = "󰅚 ", Warn = "󰀪 ", Hint = "󰌶 ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
