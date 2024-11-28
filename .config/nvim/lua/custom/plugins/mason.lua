-- Help you download binaries required for formatter, ls

return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "pyright",
      -- "mypy",
      "pylint",
      "ruff",
      "black",
      "debugpy",
      "terraform-ls",
      "lua-language-server",
      "fixjson",
      "shellharden",
      "prettier",
      "sqlfluff",
      "hclfmt",
      "gopls",
      "gofumpt",
      "goimports-reviser",
      "golines",
      "delve",
    },
  },
}
