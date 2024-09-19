return {
	"Tyler-Barham/floating-help.nvim",
	config = function()
		require("floating-help").setup({
			-- Setup
			--
			-- Defaults
			width = 80,  -- Whole numbers are columns/rows
			height = 0.9, -- Decimals are a percentage of the editor
			position = 'E', -- NW,N,NW,W,C,E,SW,S,SE (C==center)
			border = 'rounded', -- rounded,double,single
			onload = function(query_type) end, -- optional callback to be executed after help contents has been loaded
		})
	end
}
