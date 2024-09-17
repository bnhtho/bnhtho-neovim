return {
    -- cmp
    -- Plugins
    {
        "yioneko/nvim-cmp",
        branch = "perf",
        event = { "BufReadPre", "BufNewFile" }, -- The main completion plugin
        dependencies = {
            -- Sources
            "hrsh7th/cmp-nvim-lsp", -- LSP source for nvim-cmp
            "kdheepak/cmp-latex-symbols",
            "hrsh7th/cmp-buffer", -- Buffer source for nvim-cmp
            "hrsh7th/cmp-path", -- Path source for nvim-cmp
	    "ray-x/cmp-sql", -- SQL,

            "hrsh7th/cmp-cmdline", -- Cmdline source for nvim-cmp
            {
                "L3MON4D3/LuaSnip",
                dependencies = { "rafamadriz/friendly-snippets" },
            }, -- Snippet engine
            "saadparwaiz1/cmp_luasnip", -- LuaSnip source for nvim-cmp
            "rafamadriz/friendly-snippets", -- Useful snippets
            "hrsh7th/cmp-nvim-lsp-signature-help", -- signature help
            -- Customize Appearance
            "onsails/lspkind.nvim"
        },
        config = function()
            -- Pre-setup
            local kind_icons = {
                Text = "󰉿",
                Method = "󰆧",
                Function = "󰊕",
                Constructor = "",
                Field = "󰜢",
                Variable = "󰀫",
                Class = "󰠱",
                Interface = "",
                Module = "",
                Property = "󰜢",
                Unit = "󰑭",
                Value = "󰎠",
                Enum = "",
                Keyword = "󰌋",
                Snippet = "",
                Color = "󰏘",
                File = "󰈙",
                Reference = "󰈇",
                Folder = "󰉋",
                EnumMember = "",
                Constant = "󰏿",
                Struct = "󰙅",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "",
            }
            --
            local lspkind = require('lspkind')
            local cmp = require('cmp')
            local cmplsp = require("cmp_nvim_lsp")
            local luasnip = require("luasnip")
            -- Setup cmplsp
            require("luasnip.loaders.from_vscode").lazy_load()
            cmplsp.setup()
            cmp.setup({
                preselect = false,
                completion = {
                    completeopt = "menu,menuone,preview,noselect",
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
                -- Source
                sources = {
                    { name = "luasnip"},
                    {name = "lazydev",group_index = 0},
                    { name = "nvim_lsp"},
                    { name = "nvim_lua"},
                    { name = "buffer"},
                    { name = "nvim_lsp_signature_help"},
                    { name = "sql"},
                    {
                        name = "spell",
                        max_item_count = 5,
                        keyword_length = 3,
                        option = {
                            keep_all_entries = false,
                            enable_in_context = function()
                                return true
                            end,
                        },
                    },
                    {
                        name = "latex_symbols",
			max_item_count = "15",
			keyword_length = "1",

                        option = {
                          strategy = 0, -- mixed
                        },
                      },
                },
                --
                formatting = {
                    fields = { "abbr", "kind", "menu" },
                    format = function(entry, vim_item)
                        local kind = vim_item.kind
                        vim_item.kind = " " .. (kind_icons[kind] or "?") .. ""
                        local source = entry.source.name
    
                        return vim_item
                    end,
                },
                -- Performance
                performance = {
                    max_view_entries = 20,
                },
                -- Mapping
                mapping = cmp.mapping.preset.insert({
                    ["<C-b>"] = cmp.mapping.scroll_docs(-4),
                    ["<C-f>"] = cmp.mapping.scroll_docs(4),
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = false }), -- no not select first item
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item()
                        elseif luasnip.expand_or_jumpable() then
                            luasnip.expand_or_jump()
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item()
                        elseif luasnip.jumpable(-1) then
                            luasnip.jump(-1)
                        else
                            fallback()
                        end
                    end, { "i", "s" }),
                }),
            })
        end
    }
}
