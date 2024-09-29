return {
    -- ╔═══════════════════════╗
    -- ║    Mason              ║
    -- ╚═══════════════════════╝
    {
        "williamboman/mason.nvim",
        dependencies = {
            "neovim/nvim-lspconfig",
            "hrsh7th/cmp-nvim-lsp",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
        },
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗"
                }
            },
        },
    },
    -- ╔═══════════════════════╗
    -- ║    Mason LSP Config   ║
    -- ╚═══════════════════════╝
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "neovim/nvim-lspconfig" },
        opts = {
            ensure_installed = {
                "lua_ls",
                "rust_analyzer",
                "clangd",
                "pylsp",
                "marksman",
                "sqlls",
                "stimulus_ls"
            }
        }
    },
    -- ╔═══════════════════════╗
    -- ║    Formatter          ║
    -- ╚═══════════════════════╝
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                rust = { "rustfmt", lsp_format = "fallback" },
                javascript = { "prettierd", "prettier", stop_after_first = true },
            },
            --
            format_on_save = {
                timeout_ms = 500,
                lsp_format = "fallback",
            },
        },
    }
}
