local opt = vim.opt
vim.o.foldmethod = "expr"
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldtext = "nvim_treesitter#foldtext()"
vim.o.foldenable = false
-- vim.g.loaded_python3_provider = 1
opt.number = true
opt.relativenumber = true
-- vim.opt.signcolumn = "number"
opt.statuscolumn = "%s %l %r "

vim.cmd [[
  au FileType hcl setlocal commentstring=#\ %s
]]
