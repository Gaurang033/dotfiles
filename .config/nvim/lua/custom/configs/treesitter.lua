local config = require("plugins.configs.lspconfig")

config.setup {
  ensure_installed = { "lua", "vim", "vimdoc", "terraform", "hcl", "python" },
  auto_install = true,
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
}

