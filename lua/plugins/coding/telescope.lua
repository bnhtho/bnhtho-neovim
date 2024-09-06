return {
    'nvim-telescope/telescope.nvim',
      dependencies = { 
        "MunifTanjim/nui.nvim",
        'nvim-lua/plenary.nvim',
        "nvim-telescope/telescope-ui-select.nvim"
    },
    config = function()
    --
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "TelescopeResults",
      callback = function(ctx)
        vim.api.nvim_buf_call(ctx.buf, function()
          vim.fn.matchadd("TelescopeParent", "\t\t.*$")
          vim.api.nvim_set_hl(0, "TelescopeParent", { link = "Comment" })
        end)
      end,
    })
    
    local function filenameFirst(_, path)
      local tail = vim.fs.basename(path)
      local parent = vim.fs.dirname(path)
      if parent == "." then return tail .. "👈" end
      return string.format("%s\t\t%s", tail, parent)
    end
    
    require("telescope").setup {
      
      pickers = {
        find_files = {
          previewer = false,
          layout_config = { horizontal = { width = 0.5, height = 0.5} },
          path_display = filenameFirst,
        }
      }
    }
    --Extensions
    -- require("telescope").load_extension("ui-select")
    vim.keymap.set("n", "<C-t>", ":Telescope find_files<CR>", { silent = true })

    end
}