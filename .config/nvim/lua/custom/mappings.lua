local M = {}
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {"<cmd> DapToggleBreakpoint <CR>"}
  }
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function ()
        require("dap-python").test_method()
      end
    }
  }
}

M.dap_ui = {
  plugin=true,
  n={
    ["<leader>dt"] = {
      function ()
        require("dapui").toggle()
      end
    }
  }
}

M.gitsings = {
  n = {
    ["<leader>gp"] = {"<cmd> Gitsigns preview_hunk <CR>", "git preview hunk"}
  }
}

M.neogit = {
  n = {
    ["<leader>gn"] = {
      function ()
        require("neogit").open({kind="split"})
      end,
      "open neogit menu"
    }
  }
}

M.fugitive = {
  n={
    ["<leader>gb"] = {"<cmd> Git blame <CR>", "git balme"}
  }
}

M.telescope = {
  plugin = true,

  n = {
    ["<leader>fcm"] = { "<cmd> Telescope git_commits <CR>", "Find git commit message in telesccope" },
    ["<leader>fgb"] = { "<cmd> Telescope git_branches <CR>", "Find git branches" },
  },
}


return M
