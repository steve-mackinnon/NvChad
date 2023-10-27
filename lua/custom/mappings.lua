local M = {}

M.telescope = {
  n = {
    ["<leader>fg"] = { "<cmd> Telescope git_files <CR>",
                       "Find git files" },
    ["<leader>o"] = { "<cmd> ClangdSwitchSourceHeader <CR>",
                      "Switch between source and header files" },
    ["<leader>t"] = { "<cmd>Trouble<cr>",
                      "Show trouble diagnostics" },
  }
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd>DapContinue<CR>",
      "Start or continue the debugger",
    },
  }
}

return M
