--author: thohnb
-- What to do? Add lsp to neovim
return {
    {
        -- Mason
        "williamboman/mason.nvim",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "neovim/nvim-lspconfig",
                "hrsh7th/cmp-nvim-lsp",
        },
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
                        "pylsp"
                    }
                }
            )
            
            local lspconfig = require("lspconfig")
            local capabilities = vim.tbl_deep_extend("force",
            vim.lsp.protocol.make_client_capabilities(),
            require('cmp_nvim_lsp').default_capabilities()
          )
          capabilities.workspace.didChangeWatchedFiles.dynamicRegistration = false
            -- Setup LSP.
            -- You can add more LSP servers here
            -- Python
            lspconfig.pylsp.setup {
                -- on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    pylsp = {
                      plugins = {
                        pycodestyle = { maxLineLength = 100 },
                      },
                    },
                  },
                filetypes= {"python"}
            }
            -- C++
            lspconfig.clangd.setup {
                -- on_attach = on_attach,
                capabilities = capabilities
            }
            -- Setup nvim-cmp.
        end
    },
    
}
