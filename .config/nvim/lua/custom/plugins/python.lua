local plugins = {
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings("dap")
    end
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui"
    },
    config = function(_, _)
      vim.api.nvim_set_hl(0, "DapStopped", { bg = "#666666", bold = true })
      -- local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      local path = require('mason-registry').get_package('debugpy'):get_install_path()
      require("dap-python").setup(path .. "/venv/bin/python")
      -- require("dap-python").setup("/usr/bin/python3")
      require('dap-python').test_runner = 'pytest'
      require("core.utils").load_mappings("dap_python")
      vim.fn.sign_define('DapBreakpoint', { text = '🟥', texthl = '', linehl = '', numhl = '' })
      vim.fn.sign_define('DapStopped',
        { text = '⭐️', texthl = 'DapStopped', linehl = 'DapStopped', numhl = 'DapStopped' })
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    config = function()
      require("core.utils").load_mappings("dap_ui")
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      -- dap.listeners.before.event_terminated["dapui_config"] = function ()
      -- dapui.close()
      -- end
      -- dap.listeners.before.event_exited["dapui_config"] = function ()
      -- dapui.close()
      -- end
    end
  }
}

return plugins
