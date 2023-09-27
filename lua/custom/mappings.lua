local M = {}

M.telescope = {
  n = {
    ["<leader>fg"] = { "<cmd> Telescope git_files <CR>",
                       "Find git files" },
  }
}

return M
