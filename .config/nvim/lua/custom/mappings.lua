local M = {}
M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>" },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
    },
  },
}

-- for go debu
M.dap_go = {
  plugin = true,
  n = {
    ["<leader>dgt"] = {
      function()
        require("dap-go").debug_test()
      end,
      "debug go test",
    },
  },
}

M.dap_ui = {
  plugin = true,
  n = {
    ["<leader>dt"] = {
      function()
        require("dapui").toggle()
      end,
      "Toogle Debug Window",
    },
    ["<leader>ds"] = { "<CMD>lua require'dap'.stop()<CR>", "stop debug" },
    ["<leader>dn"] = { "<CMD>lua require'dap'.stop()<CR>", "continue debug run" },
  },
}

M.gitsings = {
  n = {
    ["<leader>gp"] = { "<cmd> Gitsigns preview_hunk <CR>", "git preview hunk" },
  },
}

M.neogit = {
  n = {
    ["<leader>gn"] = {
      function()
        require("neogit").open { kind = "split" }
      end,
      "open neogit menu",
    },
  },
}

M.fugitive = {
  n = {
    ["<leader>gb"] = { "<cmd> Git blame <CR>", "git balme" },
  },
}

M.telescope = {
  plugin = true,
  n = {
    ["<leader>fcm"] = {
      "<cmd> Telescope git_commits <CR>",
      "Find git commit message in telesccope",
      { noremap = true },
    },
    ["<leader>fgb"] = { "<cmd> Telescope git_branches <CR>", "Find git branches", { noremap = true } },
  },
}

M.obsidian = {
  n = {
    ["<leader>os"] = { "<CMD> ObsidianSearch <CR>", "search obsidan notes", { noremp = true } },
    ["<leader>on"] = { "<CMD> ObsidianNew <CR>", "search obsidan notes", { noremp = true } },
  },
}

return M
