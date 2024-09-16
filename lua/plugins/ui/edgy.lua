
return{
    "folke/edgy.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>ue",
        function()
          require("edgy").toggle()
        end,
        desc = "Edgy Toggle",
      },
      -- stylua: ignore
      { "<leader>uE", function() require("edgy").select() end, desc = "Edgy Select Window" },
    },
    opts = function()
      local opts = {
        wo = {
            -- Setting to `true`, will add an edgy winbar.
            -- Setting to `false`, won't set any winbar.
            -- Setting to a string, will set the winbar to that string.
            winbar = true,
            winfixwidth = true,
            winfixheight = false,
            winhighlight = "WinBar:EdgyWinBar,Normal:EdgyNormal",
            spell = false,
            signcolumn = "no",
          },
        animate = {
            enabled = false,
            cps = 120, -- cells per second
            on_begin = function()
              vim.g.minianimate_disable = true
            end,
            on_end = function()
              vim.g.minianimate_disable = false
            end,
            -- Spinner for pinned views that are loading.
            -- if you have noice.nvim installed, you can use any spinner from it, like:
            -- spinner = require("noice.util.spinners").spinners.circleFull,
            spinner = {
              frames = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
              interval = 80,
            },
          },
        bottom = {
          {
            ft = "toggleterm",
            collapsed = false,
            title = "Terminal",
            size = { height = 0.4 },
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
          {
            ft = "noice",
            size = { height = 0.4 },
            filter = function(buf, win)
              return vim.api.nvim_win_get_config(win).relative == ""
            end,
          },
          {
            ft = "lazyterm",
            title = "LazyTerm",
            size = { height = 0.4 },
            filter = function(buf)
              return not vim.b[buf].lazyterm_cmd
            end,
          },
          "Trouble",
          { ft = "qf", title = "QuickFix" },
          {
            ft = "help",
            size = { height = 20 },
            -- don't open help files in edgy that we're editing
            filter = function(buf)
              return vim.bo[buf].buftype == "help"
            end,
          },
          { title = "Spectre", ft = "spectre_panel", size = { height = 0.4 } },
          { title = "Neotest Output", ft = "neotest-output-panel", size = { height = 15 } },
        },
        left = {
          { title = "Neotest Summary", ft = "neotest-summary" },
          {
            title = "File Explorer",
            ft = "neo-tree",
            filter = function(buf)
              return vim.b[buf].neo_tree_source == "filesystem"
            end,
            size = { height = 0.5 },
          },
          -- "neo-tree",
        },
        right = {
          { title = "Search", ft = "grug-far", size = { width = 0.4 } },
          { title = "Outline", ft = "Outline", size = { width = 0.2 } },
        },
        keys = {
          -- increase width
          ["<c-Right>"] = function(win)
            win:resize("width", 2)
          end,
          -- decrease width
          ["<c-Left>"] = function(win)
            win:resize("width", -2)
          end,
          -- increase height
          ["<c-Up>"] = function(win)
            win:resize("height", 2)
          end,
          -- decrease height
          ["<c-Down>"] = function(win)
            win:resize("height", -2)
          end,
        },
      }
  
      
  
      for _, pos in ipairs({ "top", "bottom", "left", "right" }) do
        opts[pos] = opts[pos] or {}
        table.insert(opts[pos], {
          ft = "trouble",
          filter = function(_buf, win)
            return vim.w[win].trouble
              and vim.w[win].trouble.position == pos
              and vim.w[win].trouble.type == "split"
              and vim.w[win].trouble.relative == "editor"
              and not vim.w[win].trouble_preview
          end,
        })
      end
      return opts
    end,
  }