return {
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true, -- Enable transparency
        },
      })
      vim.cmd("colorscheme duskfox")
    end,
    priority = 1000, -- Load before other plugins
  },
}
