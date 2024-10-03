-- Colorscheme
return {
	{

		'sainnhe/gruvbox-material',
		dependencies = { "nvim-tree/nvim-web-devicons" },
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_foreground = "mix"
			vim.g.gruvbox_material_background = "medium"
			vim.g.gruvbox_material_better_performance = 1
			vim.g.gruvbox_material_transparent_background = 1
		end
	},
}
