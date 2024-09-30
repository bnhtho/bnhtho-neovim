return
{

	{
		-- ╔═══════════════════════╗
		-- ║    Blank Line         ║
		-- ╚═══════════════════════╝
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	{
		-- ╔═══════════════════════╗
		-- ║    Todo comment       ║
		-- ╚═══════════════════════╝
		'folke/todo-comments.nvim',
		event = 'VimEnter',
		dependencies = { 'nvim-lua/plenary.nvim' },
		cmd = { "TodoTelescope" },
		opts = {
			gui_style = {
				bg = "NONE", -- The gui style to use for the bg highlight group.
				fg = "NONE", -- The gui style to use for the bg highlight group.
			},
			signs = true,
			highlight = {
				keyword = 'fg',
				pattern = [[.*<(KEYWORDS)\s*]],
			},
			search = {
				keyword = 'fg',
				pattern = [[\b(KEYWORDS)\b]],
			},
		}
	},

	{
		-- ╔═══════════════════════╗
		-- ║  nvim-rip-substitute  ║
		-- ╚═══════════════════════╝
		"chrisgrieser/nvim-rip-substitute",
		cmd = "RipSubstitute",
		keys = {
			{
				"<leader>fs",
				function() require("rip-substitute").sub() end,
				mode = { "n", "x" },
				desc = " rip substitute",
			},
		},
	},
	-- ╔═══════════════════════╗
	-- ║ 		Flash      ║
	-- ╚═══════════════════════╝
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {
			-- FT
			modes = {
				char = {
					jump_labels = true
				}
			},
			--
			label = {
				format = function(opts)
					return { { " " .. opts.match.label, opts.hl_group } }
				end,
			}
		},
		-- stylua: ignore
		keys = {
			{ "/",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
			{ "?",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
			{ "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
			{ "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
			{ "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
		},
	},


}
