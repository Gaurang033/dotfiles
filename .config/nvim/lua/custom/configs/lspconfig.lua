local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

local tf_cap = vim.lsp.protocol.make_client_capabilities()
tf_cap.textDocument.completion.completionItem.snippetSupport = true

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})

require'lspconfig'.terraformls.setup({
  on_attach = on_attach,
  capabilities = tf_cap,
  flags = {debounce_text_changes = 150},
})
vim.api.nvim_create_autocmd({"BufWritePre"}, {
  pattern = {"*.tf", "*.tfvars"},
  callback = function()
    vim.lsp.buf.format()
  end
})
