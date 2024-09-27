--author: thohnb
-- What to do? Add lsp to neovim and all lspconfig
return {
    {
        -- Mason
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "mfussenegger/nvim-jdtls",
            {
                "WhoIsSethDaniel/mason-tool-installer.nvim",
                dependencies = {
                    {"williamboman/mason.nvim",opts ={} }
                },
                config = function()
                    require("mason-tool-installer").setup(
                        {
                            ensure_installed = {
                                -- -- Formatter
                                "black",
                                "prettier",
                                "prettier",
                                "prettierd"
                            }
                        }
                    )
                end
            }
        },
        event = {"BufReadPost", "BufNewFile"},
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
                        "jdtls", -- Java Language

                        -- Markdown
                        "marksman",
                        "sqlls"
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
            -- Setup Border
            vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
            vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]

    
            -- LSP settings (for overriding per client)
            local handlers = {
                ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {border = "rounded"}),
                ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {border = "rounded"}),
            }
            
            -- End of setup border
            local on_attach = function(client, bufnr)
                -- Keyboard
                local keymap = vim.keymap
                keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)
                keymap.set("n", "K", vim.lsp.buf.hover)
                -- Diagnostic: Show list lock
                keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
                
            end

            lspconfig.pylsp.setup {
                capabilities = capabilities,
                plugins = {
                    rope_import = {
                        enabled = true
                    }
                },
                on_attach = on_attach,
                handlers=handlers
            }
            -- C++
            lspconfig.clangd.setup {
                -- on_attach = on_attach,
                capabilities = capabilities,
                on_attach = on_attach,
                handlers=handlers
            }
            -- Markdown
            lspconfig.marksman.setup {
                -- on_attach = on_attach,
                capabilities = capabilities,
                on_attach = on_attach,
                handlers=handlers
            }
            lspconfig.lua_ls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
                handlers=handlers
            }
            lspconfig.sqlls.setup {
                capabilities = capabilities,
                root_dir = function(_)
                    return vim.loop.cwd()
                end,
                on_attach = on_attach,
                handlers=handlers
            }
            -- Java
            lspconfig.jdtls.setup {
                capabilities = capabilities,
                on_attach = on_attach,
                handlers=handlers
            }
        end
    }
}
