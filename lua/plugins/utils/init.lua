-- author:thohnb
-- What to do: add some utils plugins (usually small- default config)

-- Which Key
return 
{
    -- //Section: Whichkey
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        },
        keys = {
          {
            "<leader>?",
            function()
              require("which-key").show({ global = false })
            end,
            desc = "Buffer Local Keymaps (which-key)",
          },
        },
      },
    -- incline
    {
      'b0o/incline.nvim',
      config = function()
        require('incline').setup()
      end,
      -- Optional: Lazy load Incline
      event = 'VeryLazy',
}
}