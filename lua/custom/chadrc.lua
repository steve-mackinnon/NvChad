---@type ChadrcConfig
local M = {}

M.ui = { theme = 'github_dark' }
M.plugins = "custom.plugins"
M.mappings = require 'custom.mappings'

vim.opt.expandtab = true
vim.opt.relativenumber = true

return M
