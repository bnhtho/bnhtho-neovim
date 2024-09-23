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
            {
                "WhoIsSethDaniel/mason-tool-installer.nvim",
                requires = {
                    "williamboman/mason.nvim"
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
            vim.lsp.handlers["textDocument/publishDiagnostics"] =
                vim.lsp.with(
                vim.lsp.diagnostic.on_publish_diagnostics,
                {
                    update_in_insert = true
                }
            )
            -- Keymap on_attach
            local on_attach = function(client, bufnr)
                -- Keyboard 
                local keymap = vim.keymap
            end

            lspconfig.pylsp.setup {
                capabilities = capabilities,
                plugins = {
                    rope_import = {
                        enabled = true
                    }
                },
                on_attach = on_attach
            }
            -- C++
            lspconfig.clangd.setup {
                -- on_attach = on_attach,
                capabilities = capabilities,
                on_attach = on_attach
            }
            -- Markdown
            lspconfig.marksman.setup {
                -- on_attach = on_attach,
                capabilities = capabilities,
                on_attach = on_attach
            }
            lspconfig.lua_ls.setup {
                capabilities = capabilities,
                on_attach = on_attach
            }
            lspconfig.sqlls.setup {
                capabilities = capabilities,
                root_dir = function(_)
                    return vim.loop.cwd()
                end,
                on_attach = on_attach
            }
        end
    }
}
