-- What to do: add some utils plugins (usually small- default config)

-- Which Key
return
{
	{
		"camspiers/snap",
	},
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
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		opts = {},
	},
	{
		'numToStr/Comment.nvim',
		config = function()
			require('Comment').setup()
		end
	},
	{
		'VonHeikemen/fine-cmdline.nvim',
		dependencies = {
			{ 'MunifTanjim/nui.nvim' }
		},
		opts = {},

	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
	},

	{ 'echasnovski/mini.bufremove', version = '*', opts = {} },
}
