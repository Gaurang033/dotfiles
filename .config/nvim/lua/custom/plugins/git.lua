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
}

return plugins
