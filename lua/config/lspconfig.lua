-- ╔═══════════════════════╗
-- ║ LSP Configuration     ║
-- ╚═══════════════════════╝

-- ╔═══════════════════════╗
-- ║ Server LSP            ║
-- ╚═══════════════════════╝
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
local on_attach = function(_, bufnr)
	local opts = { buffer = bufnr }
	-- Keybind when attached lsp
	vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
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
-- Floating diagnostic
vim.o.updatetime = 250
vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false })
	end
})
