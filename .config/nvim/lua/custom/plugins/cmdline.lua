return {
  'VonHeikemen/fine-cmdline.nvim',
  dependencies = {
    'MunifTanjim/nui.nvim'
  },
  event="VeryLazy",
  config = function ()
    vim.keymap.set('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
 end,

 --[[  require('fine-cmdline').setup({
    cmdline={
      smart_history=true,
      promopt= ">"
    }
  }) ]]
}
