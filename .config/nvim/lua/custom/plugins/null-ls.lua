-- return {
--   -- "jose-elias-alvarez/null-ls.nvim",
--   "nvimtools/none-ls.nvim",
--   ft = { "python", "terraform", "tf", "terraform-vars", "json", "sh", "bash", "zsh" },
--   config = function()
--     require("null-ls").setup({
--       debug = true,
--       -- opts = function()
--       --   return require "custom.configs.null-ls"
--       -- end
--     })
--   end,
--   opts = function()
--     return require "custom.configs.null-ls"
--   end
-- }
--
--
return {
  "nvimtools/none-ls.nvim",
  -- "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "mason.nvim" },
  opts = function()
    local null_ls = require('null-ls')
    return {
      sources = {
        null_ls.builtins.formatting.black.with({ filetypes = { "python" } }),
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.formatting.terraform_fmt,
        null_ls.builtins.diagnostics.terraform_validate,
        -- null_ls.builtins.diagnostics.shellcheck.with({ filetypes = { "sh", "bash", "zsh" } }),
        null_ls.builtins.formatting.prettier.with({ filetypes = { "json" } }),
      },

      on_attach = function(client, bufnr)
        -- Enable formatting on sync
        if client.supports_method("textDocument/formatting") then
          local format_on_save = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = format_on_save,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                bufnr = bufnr,
                filter = function(_client)
                  return _client.name == "null-ls"
                end
              })
            end,
          })
        end
      end
    }
  end,
}
