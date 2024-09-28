return {
	'nvim-telescope/telescope.nvim',
	dependencies = {
	  'nvim-lua/plenary.nvim',
	  'jonarrien/telescope-cmdline.nvim',
	  "LinArcX/telescope-command-palette.nvim"
	},
	opts = function()
	  local actions = require('telescope.actions')
	  return {
		defaults = {
		  mappings = {
			i = {
			  ["<C-u>"] = false,
			  ["<Tab>"] = false,
			  ["<C-j>"] = actions.select_horizontal,
			  ["<C-l>"] = actions.select_vertical,
			},
			n = {
			  ["sj"] = actions.select_horizontal,
			  ["sl"] = actions.select_vertical,
			},
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
		-- Extension 
		extensions = {
		  aerial = {
			format_symbol = function(symbol_path, filetype)
			  if filetype == "json" or filetype == "yaml" then
				return table.concat(symbol_path, ".")
			  else
				return symbol_path[#symbol_path]
			  end
			end,
			show_columns = "both",
		  },
		  cmdline = {
			mappings    = {
			  complete      = '<Tab>',
			  run_selection = '<CR>',
			  run_input     = '<CR>',
			},
		  },
		  --
		  
		},
	  }
	end,
	config = function(_, opts)
	  require('telescope').setup(opts)
	  require('telescope').load_extension('cmdline')
	  require('telescope').load_extension('aerial')
	end
  }
  