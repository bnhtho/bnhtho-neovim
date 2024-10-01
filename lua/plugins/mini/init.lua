return {
	-- ╔═══════════════════════╗
	-- ║    Hipattern          ║
	-- ╚═══════════════════════╝
	{
		"echasnovski/mini.hipatterns",
		event = "VeryLazy",
		opts = function()
			local hi = require("mini.hipatterns")
			return {
				highlighters = {
					hex_color = hi.gen_highlighter.hex_color({ priority = 2000 }),
					shorthand = {
						pattern = "()#%x%x%x()%f[^%x%w]",
						group = function(_, _, data)
							---@type string
							local match = data.full_match
							local r, g, b = match:sub(2, 2), match:sub(3, 3), match:sub(4, 4)
							local hex_color = "#" .. r .. r .. g .. g .. b .. b

							return hi.compute_hex_color_group(hex_color, "bg")
						end,
						extmark_opts = { priority = 2000 },
					},
				},
			}
		end,
	},

	-- ╔═══════════════════════╗
	-- ║    Mini Move          ║
	-- ╚═══════════════════════╝
	{
		'echasnovski/mini.move',
		version = false,
		opts = {
			mappings = {
				-- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
				left = '<M-h>',
				right = '<M-l>',
				down = '<M-j>',
				up = '<M-k>',

				-- Move current line in Normal mode
				line_left = '<M-h>',
				line_right = '<M-l>',
				line_down = '<M-j>',
				line_up = '<M-k>',
			},
		}

	},
	-- ╔═══════════════════════╗
	-- ║    Mini Pairs         ║
	-- ╚═══════════════════════╝
	{
		'echasnovski/mini.pairs',
		version = false,
		opts = {
			modes = { insert = true, command = false, terminal = false },
			
		},
	},
	-- ╔═══════════════════════╗
	-- ║    Mini Tab Line      ║
	-- ╚═══════════════════════╝
	{
		'echasnovski/mini.tabline',
		version = false,
		opts = {}
	},
	-- ╔═══════════════════════╗
	-- ║    Mini Brackedted    ║
	-- ╚═══════════════════════╝
	{
		'echasnovski/mini.bracketed',
		version = false,
		config = function()
			local bracketed = require("mini.bracketed")
			local ignore_suffix = {"buffer","conflict", "file", "indent", "jump", "location", "oldfile", "quickfix", "treesitter", "undo", "window", "yank" }
			
			local config = {}
			-- Loop through each suffix and disable it in the config
			for _, disable_suffix in ipairs(ignore_suffix) do
				config[disable_suffix] = { suffix = '' }  -- Disable the mapping by setting an empty suffix
			end
			bracketed.setup(config)
		end,
	}
}
