return {
  "olexsmir/gopher.nvim",
  ft = "go",
  -- branch = "develop", -- if you want develop branch
  -- keep in mind, it might break everything
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "mfussenegger/nvim-dap", -- (optional) only if you use `gopher.dap`
  },

  Config = function(_, opts)
    require("gopher").setup(opts)
  end,
  -- (optional) will update plugin's deps on every update
  build = function()
    vim.cmd.GoInstallDeps()
  end,
}
