local dap = require("dap")
local dap_python = require("dap-python")

-- Utility function to find correct Python interpreter
local function get_python_path()
  local cwd = vim.fn.getcwd()

  -- check for .venv in project root
  local venv_path = cwd .. "/.venv/bin/python"
  if vim.fn.executable(venv_path) == 1 then
    return venv_path
  end

  -- fallback to virtualenv environment variable
  local venv_env = os.getenv("VIRTUAL_ENV")
  if venv_env then
    return venv_env .. "/bin/python"
  end

  -- fallback to pyenv/system python
  return vim.fn.exepath("python")
end

-- Setup the Python DAP adapter
dap.adapters.python = {
  type = "executable",
  command = get_python_path(),
  args = { "-m", "debugpy.adapter" },
}

-- Setup Python configurations
dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${fileDirname}",
    pythonPath = get_python_path,
  },
}

-- Setup dap-python with pytest
dap_python.setup(get_python_path())
dap_python.test_runner = "pytest"

-- Load custom keymaps for Python DAP
require("core.utils").load_mappings("dap_python")

-- Sign definitions for breakpoints
vim.fn.sign_define("DapBreakpoint", { text = "🟥", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "⭐️", texthl = "DapStopped", linehl = "DapStopped", numhl = "DapStopped" })
-- Highlight for stopped debugger
vim.api.nvim_set_hl(0, "DapStopped", { bg = "#666666", bold = true })


-- Optional: auto open dap-ui when debugging starts
local dapui = require("dapui")
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end
