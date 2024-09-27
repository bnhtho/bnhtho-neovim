return {
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"WhoIsSethDaniel/mason-tool-installer.nvim"
		},
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗"
				}
			},
		},
	},
	-- Mason LSPConfig
	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = { "neovim/nvim-lspconfig" },
		config = function()
			require("mason-lspconfig").setup {
				ensure_installed = {
					"lua_ls",
					"rust_analyzer",
					"clangd",
					"pylsp",
					"marksman",
					"sqlls"
				}
			}

			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local on_attach = function(_, bufnr)
				local opts = { buffer = bufnr }
				vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
				vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
			end

			local servers = { "pylsp", "clangd", "marksman", "lua_ls", "jdtls", "sqlls" }
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
		end
	}
}
