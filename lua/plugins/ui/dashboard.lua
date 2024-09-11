---author:thohnb
-- What to do: dashboard
---
local api = vim.api

local function generate_empty_lines(size)
    local fill = {}
    for _ = 1, size do
        table.insert(fill, "")
    end
    return fill
end

local function center_header(header)
    local size = math.floor(vim.o.lines / 2)
        - math.ceil(#header / 2)
        - 2
    local fill = generate_empty_lines(size)
    return vim.list_extend(fill, header)
end

local header_content = {
  [[                                                    ]],
	[[ ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ]],
	[[ ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ]],
	[[ ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ]],
	[[ ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ]],
	[[ ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ]],
	[[ ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ]],
	[[                     -Neovim btw-                   ]],
	[[                                                    ]],
}

return
{
    'nvimdev/dashboard-nvim',
    event = 'VimEnter',
    config = function()
      require('dashboard').setup {
        theme = 'doom',
  config = {
    header = center_header(header_content),
    -- Body
    center = {{desc=""}},
    footer = {}  --your footer
  }
      }    
    end,
    dependencies = { {'nvim-tree/nvim-web-devicons'},{"famiu/bufdelete.nvim"}}
}
