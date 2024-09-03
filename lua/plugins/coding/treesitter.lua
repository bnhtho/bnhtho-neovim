-- author: thohnb
-- Tree sitter and all dependencies
return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects",
    },
    build = ":TSUpdate",
    config = function()
        local ts_configs = require("nvim-treesitter.configs")
        ts_configs.setup({
            ensure_installed = { "c","cpp","lua", "vim", "vimdoc", "query", "javascript", "html", "css","python","json","markdown"},
          sync_install = true,
          highlight = { 
            enable = true,
           
        },
          indent = { enable = false },

        })
    end
}
