-- author: thohnb
-- Tree sitter and all dependencies
return {
	{
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		{"windwp/nvim-ts-autotag",opts={}}
	},
	build = ":TSUpdate",
	config = function()
		local ts_configs = require("nvim-treesitter.configs")
		ts_configs.setup({
			ensure_installed = { "sql", "c", "cpp", "lua", "vim", "vimdoc", "query", "javascript", "html", "css", "python", "json", "markdown" },
			sync_install = true,
			highlight = {
				enable = true,

			},
			indent = { enable = false },

		})
	end
	},
		-- Surround
	{
			"kylechui/nvim-surround",
			version = "*", -- Use for stability; omit to use `main` branch for the latest features
			event = "VeryLazy",
			config = function()
				require("nvim-surround").setup({
					-- Configuration here, or leave empty to use defaults
					
				})
			end
	}
	
}
