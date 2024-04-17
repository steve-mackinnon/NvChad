local M = {}

M.telescope = {
  n = {
    ["<leader>fg"] = { "<cmd> Telescope git_files <CR>", "Find git files" },
    ["<leader>o"] = {
      "<cmd> ClangdSwitchSourceHeader <CR>",
      "Switch between source and header files",
    },
    ["<leader>tt"] = { "<cmd>Trouble diagnostics toggle<cr>", "Show trouble diagnostics" },
    ["<leader><tab>"] = {
      function()
        require("telescope.builtin").buffers { sort_mru = true, ignore_current_buffer = true }
      end,
      "List open buffers",
    },
    ["<leader>gg"] = {
      function()
        local current_path = vim.fn.expand "%:p:h"
        local command = "a" -- go into terminal mode
          .. "cd "
          .. current_path
          .. "<CR>"
          .. "lazygit<CR>" -- run tig
        command = vim.api.nvim_replace_termcodes(command, true, false, true)
        require("detour").Detour()
        vim.cmd.terminal() -- open a terminal buffer
        vim.bo.bufhidden = "delete" -- close the terminal when window closes
        vim.api.nvim_feedkeys(command, "n", false)
      end,
      "Launch lazygit",
    },
    ["<leader>tm"] = {
      function()
        local command = "a" -- go into terminal mode
        command = vim.api.nvim_replace_termcodes(command, true, false, true)
        require("detour").Detour()
        vim.cmd.terminal()
        vim.bo.bufhidden = "delete"
        vim.api.nvim_feedkeys(command, "n", false)
      end,
      "Launch terminal",
    },
    ["<leader>gf"] = { "<cmd>OpenInGHFile <CR>", "Open file on remote" },
    ["<leader>cb"] = { "<cmd>BDelete! hidden<cr>", "Close all other buffers" },
  },
  v = {
    ["<leader>gf"] = { "<cmd>OpenInGHFileLines <CR>", "Open file on remote" },
  },
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
  },
}

M.clangd = {
  n = {
    ["<leader>fx"] = {
      function()
        vim.lsp.buf.code_action {
          filter = function(a)
            return a.isPreferred
          end,
          apply = true,
        }
      end,
      "Apply quickfix",
    },
  },
}

return M
