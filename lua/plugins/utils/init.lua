-- What to do: add some utils plugins (usually small- default config)

return
{
	-- mini.move
	{
		'echasnovski/mini.move',
		version = false,
		config = function()
			require('mini.move').setup({
				-- Rebind mapping
				mappings = {
					-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
					left = '<M-Left>',
					right = '<M-Right>',
					down = '<M-Down>',
					up = '<M-Up>',

					-- Move current line in Normal mode
					line_left = '<M-Left>',
					line_right = '<M-Right>',
					line_down = '<M-Down>',
					line_up = '<M-Up>',
				},
			}
			)
		end
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},
	{ 'echasnovski/mini.bufremove', version = '*',   opts = {} },
	{ 'echasnovski/mini.pairs',     version = false, opts = {} },
	
	{

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
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	},
	{ 'echasnovski/mini.hipatterns', version = '*', opts = {} },
	
	-- Ripgrep
	{
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
	-- lazy.nvim
	{
		'stevearc/dressing.nvim',
		opts = {},
	},	
	{
		'christopher-francisco/tmux-status.nvim',
		opts = {},
	},
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
					return { { " "..opts.match.label , opts.hl_group} }
				  end,
			}
		},
		-- stylua: ignore
		keys = {
		  { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
		  { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		  { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
		  { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		  { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
		},
	}
}	

