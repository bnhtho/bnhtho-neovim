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
          ["s"] = "split_with_window_picker",
          ["v"] = "vsplit_with_window_picker",
        },
      },
      -- recommanded config for better UI
      hide_root_node = true,
      retain_hidden_root_indent = true,
      filesystem = {
        filtered_items = {
          show_hidden_count = false,
          never_show = {
            '.DS_Store',
          },
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