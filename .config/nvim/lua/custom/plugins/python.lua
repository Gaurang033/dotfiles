local plugins = {
{
    "mfussenegger/nvim-dap",
    config = function (_, _)
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
    config = function (_, _)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require('dap-python').test_runner = 'pytest'
      require("core.utils").load_mappings("dap_python")
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {"mfussenegger/nvim-dap"},
    config = function ()
      require("core.utils").load_mappings("dap_ui")
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
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

