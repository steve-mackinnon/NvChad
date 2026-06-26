require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- VS Code style Ctrl+Tab: MRU open-buffer picker
map("n", "<leader><Tab>", function()
  require("telescope.builtin").buffers {
    sort_mru = true,
    ignore_current_buffer = true,
  }
end, { desc = "Telescope MRU buffers" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
