-- author:thohnb
-- What to do: add some utils plugins (usually small- default config)

-- Which Key
return 
{
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