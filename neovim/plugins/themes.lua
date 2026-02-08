return {

  {
    "nyoom-engineering/oxocarbon.nvim",
    -- Add in any other configuration;
    --   event = foo,
    --   config = bar
    --   end,
  },

  {
    "navarasu/onedark.nvim",
    -- priority = 1000, -- make sure to load this before all the other start plugins
    -- config = function()
    --   require("onedark").setup({
    --     style = "deep",
    --   })
    --   require("onedark").load()
    -- end,
  },

  {
    "tiagovla/tokyodark.nvim",
    -- priority = 1000,
    -- opts = {
    --   -- custom options here
    -- },
    -- config = function(_, opts)
    --   require("tokyodark").setup(opts) -- calling setup is optional
    --   vim.cmd([[colorscheme tokyodark]])
    -- end,
  },

  {
    { "Mofiqul/dracula.nvim" },
    --
    -- -- Configure LazyVim to load dracula
    -- {
    --   "LazyVim/LazyVim",
    --   opts = {
    --     colorscheme = "dracula",
    --   },
    -- },
  },
}
