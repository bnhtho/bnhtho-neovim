return {
    -- cmp
    -- Plugins
    {
        "yioneko/nvim-cmp",
        branch = "perf", -- The main completion plugin
        dependencies = {
            -- Sources
            "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
            "hrsh7th/cmp-buffer", -- Buffer source for nvim-cmp
            "hrsh7th/cmp-path", -- Path source for nvim-cmp
            "hrsh7th/cmp-cmdline", -- Cmdline source for nvim-cmp
            "L3MON4D3/LuaSnip", -- Snippet engine
            "saadparwaiz1/cmp_luasnip", -- LuaSnip source for nvim-cmp
            "rafamadriz/friendly-snippets", -- Useful snippets
            -- Customize Appearance
            "onsails/lspkind.nvim"
        },
        event = "VeryLazy",
        config = function()
            local lspkind = require('lspkind')
            local cmp = require('cmp')

            cmp.setup({
                performance = {
                    debounce = 0, -- default is 60ms
                    throttle = 0 -- default is 30ms
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body) -- For luasnip users
                    end
                },
                matching = {
                    disallow_fuzzy_matching = true,
                    disallow_fullfuzzy_matching = true,
                    disallow_partial_fuzzy_matching = true,
                    disallow_partial_matching = false,
                    disallow_prefix_unmatching = true
                },
                sources = {
                    { name = 'nvim_lsp', priority = 100, max_item_count = 15 },
                    { name = 'luasnip', priority = 100, max_item_count = 15 },
                    { name = 'buffer', priority = 50, keyword_length = 3, max_item_count = 15 }
                },
                completion = {
                    completeopt = 'menu,menuone,noinsert,noselect'
                },
                window = {
                    completion = {
                      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
                      col_offset = -3,
                      side_padding = 0,
                    },
                  },
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol',
                    })
                }
            })
        end
    }
}