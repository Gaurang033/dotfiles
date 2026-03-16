return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      terraformls = {},
    },
  },
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require "plugins.configs.lspconfig"
    require "custom.configs.lspconfig"
  end
}
