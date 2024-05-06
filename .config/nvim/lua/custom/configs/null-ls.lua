local augroup = vim.api.nvim_create_augroup("lspformatting", {})
local null_ls = require "null-ls"

local opts = {
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.stylua,
    -- null_ls.builtins.diagnostics.mypy,
    -- null_ls.builtins.diagnostics.flake8,
    null_ls.builtins.formatting.terraform_fmt,
    null_ls.builtins.diagnostics.terraform_validate,
    null_ls.builtins.formatting.shellharden,
    null_ls.builtins.formatting.prettier.with { filetypes = { "json" } },
    null_ls.builtins.formatting.isort,
    -- null_ls.builtins.diagnostics.pylint.with {
    --   prefer_local = ".venv/bin",
    --   extra_args = { "--disable=C0114,C0115,C0116" },
    -- },
    null_ls.builtins.diagnostics.terraform_validate,
    -- null_ls.builtins.code_actions.gitsigns,
    -- null_ls.builtins.code_actions.refactoring,
  },
  on_attach = function(client, bufnr)
    if client.supports_method "textdocument/formatting" then
      vim.api.nvim_clear_autocmds {
        group = augroup,
        buffer = bufnr,
      }
      vim.api.nvim_create_autocmd("bufwritepre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format {
            buffer = bufnr,
            async = false,
            filter = function(client)
              return client.name == "null-ls"
            end,
          }
        end,
      })
    end
  end,
}
return opts
