local config = require "plugins.configs.lspconfig"
local on_attach = config.on_attach
local capabilities = config.capabilities
local util = require "lspconfig.util"

capabilities.textDocument.completion.completionItem.snippetSupport = true

-- TypeScript
vim.lsp.config("ts_ls", {
  on_attach = on_attach,
  capabilities = capabilities,
  init_options = {
    preferences = {
      disableSuggestion = true,
    },
  },
})
vim.lsp.enable("ts_ls")

-- Python
vim.lsp.config("pyright", {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "python" },
})
vim.lsp.enable("pyright")

-- Terraform
vim.lsp.config("terraformls", {
  on_attach = on_attach,
  capabilities = capabilities,
  flags = { debounce_text_changes = 150 },
})
vim.lsp.enable("terraformls")

-- Lua
vim.lsp.config("lua_ls", {
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})
vim.lsp.enable("lua_ls")

-- Go
vim.lsp.config("gopls", {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparam = true,
      },
    },
  },
})
vim.lsp.enable("gopls")

-- Auto format on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*.tf", "*.tfvars", "*.py", "*.lua", "*.json", "*.hcl", "*.go", "*.json", "*.js" },
  callback = function()
    vim.lsp.buf.format()
  end,
})
