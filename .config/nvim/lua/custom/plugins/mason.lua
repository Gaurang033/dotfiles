-- Help you download binaries required for formatter, ls

return {
  "williamboman/mason.nvim",
  opts = {
    ensure_installed = {
      "pyright",
      -- "mypy",
      "flake8",
      "ruff",
      "black",
      "debugpy",
      "terraform-ls",
      "lua-language-server",
      "fixjson",
      "shellharden",
      "prettier"
    },
  },
}
