local dap = require "dap"

dap.adapters.python = {
  type = "executable",
  command = os.getenv "HOME" .. "/.virtualenvs/debugpy/bin/python",
  -- command = '/Users/fki/brew/bin/python3'
  args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = "python", -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = "launch",
    name = "Launch file",

    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options

    program = "${file}", -- This configuration will launch the current file if used.
    pythonPath = function()
      -- debugpy supports launching an application with a different interpreter then the one used to launch debugpy itself.
      -- The code below looks for a `venv` or `.venv` folder in the current directly and uses the python within.
      -- You could adapt this - to for example use the `VIRTUAL_ENV` environment variable.
      local vdir = os.getenv "VIRTUAL_ENV"
      if vdir then
        print "$vdir"
        return vdir .. "/bin/python"
      else
        -- return "/usr/bin/python3"
        return "/Users/fki/brew/bin/python3"
      end
    end,
  },
}
