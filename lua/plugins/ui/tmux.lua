return {
   {
    "christopher-francisco/tmux-status.nvim",
    lazy = true,
    opts = {},
   },
   -- Navigator Tmux
   {
    'numToStr/Navigator.nvim',
    config = function()
        require('Navigator').setup()
    end
   }
}