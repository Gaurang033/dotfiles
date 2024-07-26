return {
  "Gaurang033/none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  -- branch = "fix/terragrunt_fmt",
  branch = "feature/terragrunt_validate",
  opts = function()
    local null_ls = require "null-ls"
    return require "custom.configs.null-ls"
  end,
}
