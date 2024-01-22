---@type ChadrcConfig
local M = {}

M.ui = { theme = "catppuccin" }
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"

vim.opt.expandtab = true
vim.opt.relativenumber = true
vim.opt.shell = "fish"

vim.opt.guicursor = {
  "n-v-c:block,i-ci-ve:ver10,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor,sm:block-blinkwait175-blinkoff150-blinkon175",
}

return M
