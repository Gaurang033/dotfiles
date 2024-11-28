local config = require "plugins.configs.treesitter"

config.setup {
  ensure_installed = { "lua", "vim", "vimdoc", "terraform", "hcl", "python", "go" },
  auto_install = true,
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
}
