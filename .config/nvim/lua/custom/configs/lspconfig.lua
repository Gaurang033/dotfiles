local config = require "plugins.configs.lspconfig"
local on_attach = config.on_attach
local capabilities = config.capabilities
local lspconfig = require "lspconfig"

capabilities.textDocument.completion.completionItem.snippetSupport = true

-- lspconfig.pyright.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   filetypes = { "python" },
-- }
lspconfig.jedi_language_server.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers,
  init_options = {
    completion = {
      disableSnippets = true,
    },
  },
}
lspconfig.ruff_lsp.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  handlers = handlers,
  init_options = {
    settings = {
      args = {
        "--extend-select=W,COM,ICN",
        "--ignore=E501,E722,COM812",
      },
    },
  },
}

lspconfig.terraformls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = { debounce_text_changes = 150 },
}

lspconfig.lua_ls.setup {
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }, -- to disable global vim error
      },
    },
  },
}

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.tf", "*.tfvars", "*.py", "*.lua", "*.json" },
  callback = function()
    vim.lsp.buf.format()
  end,
})
