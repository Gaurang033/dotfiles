local plugins = {
  {
    -- for git,  support command like :Git Diff, :Git Log
    "tpope/vim-fugitive",
    -- lazy = false,
    cmd = "Git",
  },

  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",         -- required
      "sindrets/diffview.nvim",        -- optional - Diff integration
      -- Only one of these is needed, not both.
      "nvim-telescope/telescope.nvim", -- optional
      "ibhagwan/fzf-lua",              -- optional
    },
    config = true,
    cmd = "Neogit",
    -- event = "VeryLazy"
  },
}

return plugins
