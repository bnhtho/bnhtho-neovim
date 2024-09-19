--author: thohnb
-- What to do? Add lsp to neovim
return {
   
    {
        -- Mason
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp"
        },
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local mason = require("mason")
            local mason_lsp = require("mason-lspconfig")
            mason.setup(
                {
                    ui = {
                        icons = {
                            package_installed = "✓",
                            package_pending = "➜",
                            package_uninstalled = "✗"
                        }
                    }
                }
            )
            mason_lsp.setup(
                {
                    ensure_installed = {
                        "lua_ls",
                        "rust_analyzer",
                        "clangd",
                        "pylsp",
                        -- Markdown
                        "marksman",
                        "sqlls",
                        
                    }
                }
            )

            local lspconfig = require("lspconfig")
            local capabilities =
                vim.tbl_deep_extend(
                "force",
                vim.lsp.protocol.make_client_capabilities(),
                require("cmp_nvim_lsp").default_capabilities()
            )
            capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false
            vim.lsp.handlers["textDocument/publishDiagnostics"] =
                vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics,
                {
                    update_in_insert = true
                }
            )
            -- Keymap on_attach
            local on_attach = function(client, bufnr)
                -- Enable completion triggered by <c-x><c-o>
                vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
            
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local bufopts = { noremap = true, silent = true, buffer = bufnr }
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
                vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
                vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
                vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
                vim.keymap.set('n', '<space>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, bufopts)
                vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
                vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
                vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
                vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
                vim.keymap.set("n", "<space>f", function()
                    vim.lsp.buf.format({ async = true })
                end, bufopts)
            end
            
            --
            -- Setup LSP.
            -- You can add more LSP servers here
            -- Python
            lspconfig.pylsp.setup {
                -- on_attach = on_attach,
                capabilities = capabilities,
                plugins = {
                    rope_import = {
                        enabled = true
                    }
                },
                on_attach = on_attach,
            }
            -- C++
            lspconfig.clangd.setup {
                -- on_attach = on_attach,
                capabilities = capabilities,
                on_attach = on_attach,
            }
            -- Markdown
            lspconfig.marksman.setup {
                -- on_attach = on_attach,
                capabilities = capabilities,
                on_attach = on_attach,
            }
            lspconfig.lua_ls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
            }
            lspconfig.sqlls.setup {
                capabilities = capabilities,
                root_dir = function(_)
                    return vim.loop.cwd()
                end,
                on_attach = on_attach,
            }

            -- Setup nvim-cmp.
        end
    },
    -- Install tools
    {
        'WhoIsSethDaniel/mason-tool-installer.nvim',
        requires = {
            'williamboman/mason.nvim',
        },
        config = function()
            require('mason-tool-installer').setup({
                ensure_installed = {
                   -- -- Formatter
                        "black",
                        "prettier",
                        "prettier",
                        "prettierd"
                },
            })
        end,
    },
    -- Lazy Dev
    {
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
        event = { "BufReadPost", "BufNewFile" },
		opts = {
			library = {
				-- See the configuration section for more details
				-- Load luvit types when the `vim.uv` word is found
				{ path = "luvit-meta/library", words = { "vim%.uv" } },
			},
		},
	},
    { "Bilal2453/luvit-meta", lazy = true },
    ---------------------- LSP Saga
    {
        "hedyhli/outline.nvim",
        lazy = true,
        cmd = { "Outline", "OutlineOpen" },
        keys = { -- Example mapping to toggle outline
          { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
        },
        opts = {
          -- Your setup opts here
        },
      }
}
