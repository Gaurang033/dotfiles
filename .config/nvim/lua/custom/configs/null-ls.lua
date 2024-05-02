local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
  sources = {
    null_ls.builtins.formatting.black,
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.diagnostics.mypy,
    null_ls.builtins.formatting.terraform_fmt,
    null_ls.builtins.diagnostics.terraform_validate,
    -- null_ls.builtins.diagnostics.shellcheck.with({ filetypes = { "sh", "bash", "zsh" } }),
    null_ls.builtins.formatting.prettier.with({ filetypes = { "json" } }),
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({
            buffer = bufnr,
            async = false,
            filter = function(client)
              return client.name == "null-ls"
            end
          })
        end,
      })
    end
  end
}
return opts
