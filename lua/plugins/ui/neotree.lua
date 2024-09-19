-- lazy.nvim
return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      'saifulapm/neotree-file-nesting-config',
      "s1n7ax/nvim-window-picker",
    },
    
    opts = {
      
      -- Windows Mapping
      window = {
        mappings = {
          ["<Tab>"] = function (state)
            state.commands["open"](state)
            vim.cmd("Neotree reveal")
          end,
          -- Use window picker
          ["J"] = "open_split",
          ["L"] = "open_vsplit",
        },
      },
      -- recommanded config for better UI
      hide_root_node = false,
      retain_hidden_root_indent = true,
      filesystem = {
        filtered_items = {
          show_hidden_count = false,
          never_show = {
            ".",
            '.DS_Store',
          },
        },
	follow_current_file = {
            enabled = true, -- This will find and focus the file in the active buffer every time
            --               -- the current file is changed while the tree is open.
            leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
          },
      },
      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = '',
          expander_expanded = '',
        },
        -- Git symbols
        git_status = {
          symbols = {
            -- Change type
            added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
            modified  = "M", -- or "", but this is redundant info if you use git_status_colors on the name
            deleted   = "D",-- this can only be used in the git_status source
            renamed   = "R",-- this can only be used in the git_status source
            -- Status type
            untracked = "Ut",
            ignored   = "Ig",
            unstaged  = "Us",
            staged    = "S",
            conflict  = "C",
          }
        },
      },
      -- others config
      event_handlers = {
        {
          event = "file_open_requested",
          handler = function()
            -- auto close
            -- vim.cmd("Neotree close")
            -- OR
            require("neo-tree.command").execute({ action = "close" })
          end
        },

      }
    },
    config = function(_, opts)
      -- Adding rules from plugin
      opts.nesting_rules = require('neotree-file-nesting-config').nesting_rules
      require('neo-tree').setup(opts)
    end,
  }
