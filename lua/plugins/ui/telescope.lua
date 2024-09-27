return {
	-- // NOTE: Will do tmr
	'nvim-telescope/telescope.nvim',
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	opts = {
		defaults = {
			mappings = {
				i = {
					["<C-u>"] = false,
					["<Tab>"] = false,
					["<C-j>"] = "file_split",
					["<C-l>"] = "file_vsplit"
				},
				--Open in split
				n = {
					-- split normal
					["sj"] = "file_split",
					["sl"] = "file_vsplit"
				}
				--
			},
		},
		pickers = {
			live_grep = {
				theme = "ivy",
				previewer = true,
			},
			buffers = {
				theme = "dropdown",
				previewer = false,
				sort_mru = true,
				ignore_current_buffer = true,
			},
		},
	}
}
