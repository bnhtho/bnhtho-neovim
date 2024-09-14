-- author:thohnb
-- What to do: add some utils plugins (usually small- default config)

-- Which Key
return 
{
  {
    "camspiers/snap",
  },
  -- mini.move
    { 'echasnovski/mini.move', version = false,
    config = function()
      require('mini.move').setup({
        -- Rebind mapping
        mappings = {
          -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
          left = '<M-Left>',
          right = '<M-Right>',
          down = '<M-Down>',
          up = '<M-Up>',
      
          -- Move current line in Normal mode
          line_left = '<M-Left>',
          line_right = '<M-Right>',
          line_down = '<M-Down>',
          line_up = '<M-Up>',
        },
      }
      )
    end
  },
  {
	  "altermo/ultimate-autopair.nvim",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {},
   },
   {
    "brenoprata10/nvim-highlight-colors",
    opts = {
    }
   },
   
   -- Outline nvim
   {
    "hedyhli/outline.nvim",
    cmd = {"Outline","OutlineOpen"},
    config = function()
      -- Example mapping to toggle outline
      vim.keymap.set("n", "<leader>o", "<cmd>Outline<CR>",
        { desc = "Toggle Outline" })
      require("outline").setup {
        -- Your setup opts here (leave empty to use defaults)
        outline_window = {
          hide_cursor = false,
          auto_jump = true,
          auto_close = true,
          focus_on_open = false,
        }
      }
    end,
  },
  {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  },
  -- { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
}
