--author:Thohnb
-- What to do: Git system
return {
	-- Git signs
	{ "lewis6991/gitsigns.nvim", version = "*", opts = {} },
	-- Git difview
	{ "sindrets/diffview.nvim",  version = "*", cmd = "DiffviewOpen", opts = {} },
	-- Git Lazy
	{
		"kdheepak/lazygit.nvim",
		cmd = {
			"LazyGit"
		},
		-- optional for floating window border decoration
		dependencies = {
			"nvim-lua/plenary.nvim"
		}
	}
}
