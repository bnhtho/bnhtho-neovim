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
				theme = "dropdown",

				previewer = false,
			},
			buffers = {
				theme = "dropdown",
				previewer = false,
				sort_mru = true,
				ignore_current_buffer = true,
			},
		},
		-- Extensions
		extensions = {
			aerial = {
			  -- How to format the symbols
			  format_symbol = function(symbol_path, filetype)
				if filetype == "json" or filetype == "yaml" then
				  return table.concat(symbol_path, ".")
				else
				  return symbol_path[#symbol_path]
				end
			  end,
			  -- Available modes: symbols, lines, both
			  show_columns = "both",
			},
		  },
		  require("telescope").load_extension("aerial")
	}
}
