return {
    -- cmp
    -- Plugins
    {
        "hrsh7th/nvim-cmp", -- The main completion plugin
        
        dependencies = {
            "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
            "hrsh7th/cmp-buffer", -- Buffer source for nvim-cmp
            "hrsh7th/cmp-path", -- Path source for nvim-cmp
            "hrsh7th/cmp-cmdline", -- Cmdline source for nvim-cmp
            -- "neovim/nvim-lspconfig", -- LSP configurations
            "L3MON4D3/LuaSnip", -- Snippet engine
            "saadparwaiz1/cmp_luasnip", -- LuaSnip source for nvim-cmp
            "rafamadriz/friendly-snippets", -- useful snippets
        },
        event = "VeryLazy",
        config = function()
            local cmp = require("cmp")
            cmp.setup(
                {
                    
                    snippet = {
                        expand = function(args)
                            require("luasnip").lsp_expand(args.body) -- For luasnip users.
                        end
                    },
                    sources = {
                        { name = "luasnip", priority = 95 },
                        { name = "nvim_lsp", priority = 100 },
                        { name = "buffer", priority = 50, keyword_length = 3 },
                    },
                    completion = {
                        completeopt = "menu,menuone,noinsert,noselect",
                    },
                }
            )

            
        end
    }
}
