local M = {}

M.telescope = {
  n = {
    ["<leader>fg"] = { "<cmd> Telescope git_files <CR>",
                       "Find git files" },
    ["<leader>o"] = { "<cmd> ClangdSwitchSourceHeader <CR>",
                      "Switch between source and header files" },
    ["<leader>tt"] = { "<cmd>TroubleToggle<cr>",
                      "Show trouble diagnostics" },
    ["<leader><tab>"] = { "<cmd>Telescope buffers<CR>",
                          "List open buffers" },
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

M.clangd = {
  n = {
    ["<leader>fx"] = {
      function()
        vim.lsp.buf.code_action({
          filter = function(a) return a.isPreferred end,
          apply = true
        })
      end,
      "Apply quickfix"
    },
  }
}

return M
