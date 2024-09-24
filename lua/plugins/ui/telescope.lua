return {
	-- // NOTE: Will do tmr
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
		opts = {
			pickers = {
				live_grep = {
				  theme = "ivy",
				  previewer = true,
				}
			  },
		}
	}
