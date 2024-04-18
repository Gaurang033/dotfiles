local plugins = {
{
    "lewis6991/gitsigns.nvim",
    config = function ()
      require("core.utils").load_mappings("gitsigns")
      require("gitsigns").setup()
    end
  },
  {
  -- for git,  support command like :Git Diff, :Git Log 
    "tpope/vim-fugitive",
    lazy = false
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
    event = "VeryLazy"
  }

}

return plugins
