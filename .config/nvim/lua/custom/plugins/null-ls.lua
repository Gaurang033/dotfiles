return {
  "nvimtools/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  -- branch = "fix/terragrunt_fmt",
  -- branch = "feature/terragrunt_validate",
  opts = function()
    return require "custom.configs.null-ls"
  end,
}
